// L-system based model generator for 3D structures.
// Definitions only -- no top-level assignments, echoes, or geometry (this file
// is reached through multiple include paths; every re-parse must be idempotent).
//
// ABOP-style 3D turtle. State = position + orthonormal orientation frame
// [H, L, U] (heading, left, up; H x L = U) carried as a 3x3 row matrix,
// plus a current line width. Symbols:
//   F draw forward, M move forward, +/- yaw about U, &/^ pitch about L,
//   \ / roll about H, | turn around (yaw 180), ! multiply width by taper,
//   [ ] push/pop [position, frame, width].
// Default start: origin, heading +Z (H=[0,0,1], L=[0,1,0], U=[-1,0,0]),
// so a 90-degree pitch-down (&) tips the heading toward +X.
//
// Settings ($-special variables, overridable per call or at the consumer's top level):
//   $ls_rounded (default true)  - sphere joints and end caps on segments
//   $ls_debug   (default false) - echo intermediate tables/instructions/segments

include <l_system_core.scad>;

// Turtle alphabet understood by the 3D interpreter (passed to create_lookup
// so rewriting keeps these symbols; the stock 2D set would strip them).
function _ls3d_valid_chars() = "FM-+[]&^\\/|!{}.;,";

// Rotation matrices for premultiplying a row-major frame M = [H, L, U]:
// M' = R * M rotates the frame about its own (local) axis.
function _rot_u(a) = [ [ cos(a), sin(a), 0 ], [ -sin(a), cos(a), 0 ], [ 0, 0, 1 ] ];
function _rot_l(a) = [ [ cos(a), 0, -sin(a) ], [ 0, 1, 0 ], [ sin(a), 0, cos(a) ] ];
function _rot_h(a) = [ [ 1, 0, 0 ], [ 0, cos(a), sin(a) ], [ 0, -sin(a), cos(a) ] ];

// Frame update for one symbol: rotation symbols premultiply, others leave M.
function _step_rot(ch, a, M) = (ch == "+")   ? _rot_u(a) * M
                               : (ch == "-") ? _rot_u(-a) * M
                               : (ch == "&") ? _rot_l(a) * M
                               : (ch == "^") ? _rot_l(-a) * M
                               : (ch == "\\") ? _rot_h(a) * M
                               : (ch == "/") ? _rot_h(-a) * M
                               : (ch == "|") ? _rot_u(180) * M
                                             : M;

// Rodrigues rotation of vector v about unit axis k by angle a (degrees).
function _rot_about(v, k, a) = v * cos(a) + cross(k, v) * sin(a) + k * (k * v) * (1 - cos(a));

// Tropism: bend the frame toward T by angle e*|H x T| about the axis H x T
// (ABOP: torque = H cross T, applied after each drawn segment). No effect when
// tropism is off (T undef / e == 0) or H is parallel to T (zero cross product).
function _tropism_bend(M, T, e) =
    (is_undef(T) || e == 0) ? M
                            : let(axis = cross(M[0], T), m = norm(axis)) //
                              m < 1e-9 //
                                  ? M
                                  : let(k = axis / m, a = e * m) //
                                    [ _rot_about(M[0], k, a), _rot_about(M[1], k, a), _rot_about(M[2], k, a) ];

/**
 * L_System3D
 *
 * Generates an L-system based 3D model.
 *
 * Accepts either an explicit axiom string plus rules, or a grammar tuple
 * [axiom, rules, params] (as returned by the grammars.scad catalog) as the
 * first argument alone. The tuple's params ([key, value] pairs) supply
 * per-curve defaults; explicit arguments always win.
 *
 * @param start        Starting axiom string, or a grammar tuple [axiom, rules, params].
 * @param rules        Array of replacement rules in the form "X=ABC" (omit when start is a tuple).
 * @param n            Number of iterations.
 * @param angle        Rotation angle in degrees for + - & ^ \ / (default: 90).
 * @param w            Width (diameter) of the segments (default: 0.4).
 * @param draw_chars   Characters interpreted as draw commands (default: "F").
 * @param move_chars   Characters interpreted as move commands (default: "M").
 * @param startpos     Starting position as [x, y, z] (default: [0, 0, 0]).
 * @param taper        Width multiplier applied by each "!" (default: 0.7).
 * @param tropism      Direction the heading bends toward each F step, e.g.
 *                     [0, 0, -1] for gravity (default: undef, no tropism).
 * @param tropism_strength  Bend susceptibility e in alpha = e*|H x tropism|
 *                     (default: 0.22 when tropism is set).
 * @param leaf_thickness    Thickness of filled leaf polygons from "{" "." "}"
 *                     (default: 0.2).
 * @param palette      Optional list of colors indexed by the turtle color index
 *                     (";" / "," symbols). Preview only -- OpenSCAD strips color
 *                     on F6 render and STL/3MF export (default: undef, uncolored).
 */
module L_System3D(start, rules, n, angle, w, draw_chars, move_chars, startpos, taper, tropism, tropism_strength,
                 leaf_thickness, palette)
{
    debug = is_undef($ls_debug) ? false : $ls_debug;

    // Grammar tuple dispatch: is_list() is false for the string axiom form
    p = (is_undef(rules) && is_list(start) && len(start) > 2) ? start[2] : [];
    _axiom = (is_undef(rules) && is_list(start)) ? start[0] : start;
    _rules = (is_undef(rules) && is_list(start)) ? start[1] : rules;

    // Explicit argument > tuple param > library default
    _n = !is_undef(n) ? n : _ls_param(p, "n", undef);
    _angle = !is_undef(angle) ? angle : _ls_param(p, "angle", 90);
    _w = !is_undef(w) ? w : _ls_param(p, "w", 0.4);
    _draw = !is_undef(draw_chars) ? draw_chars : _ls_param(p, "draw_chars", "F");
    _move = !is_undef(move_chars) ? move_chars : _ls_param(p, "move_chars", "M");
    _startpos = !is_undef(startpos) ? startpos : _ls_param(p, "startpos", [ 0, 0, 0 ]);
    _taper = !is_undef(taper) ? taper : _ls_param(p, "taper", 0.7);
    _tropism = !is_undef(tropism) ? tropism : _ls_param(p, "tropism", undef);
    _tstrength = !is_undef(tropism_strength) ? tropism_strength : _ls_param(p, "tropism_strength", 0.22);
    _leaf_t = !is_undef(leaf_thickness) ? leaf_thickness : _ls_param(p, "leaf_thickness", 0.2);
    _palette = !is_undef(palette) ? palette : _ls_param(p, "palette", undef);

    assert(!is_undef(_n), "L_System3D: n is required (no iteration count given or found in the grammar tuple)");

    // First create the lookup tables for rule replacement
    tables = create_lookup(_axiom, _rules, _draw, _move, _ls3d_valid_chars());
    if (debug)
        echo("Tables:", tables);

    // Apply the rules to generate the final instruction set
    instrs = apply_rules(_axiom, tables[0], tables[1], _n);
    if (debug)
        echo("Instructions:", instrs);

    // Walk the turtle to generate the segment list
    segs = generate_coords_3d(instrs, _angle, _startpos, _taper, _w, _tropism, _tstrength);
    if (debug)
        echo("Segments:", segs);

    segmented_lines_3d(segs, _leaf_t, _palette);
    if (debug)
        echo("Done!");
}

/**
 * generate_coords_3d
 *
 * Walks the 3D turtle over an instruction list and returns one
 * [start, end, width] entry per drawn ("F") segment. The output is a
 * C-style "for" list comprehension, usable directly (without rendering)
 * for path-extrusion or analysis workflows.
 *
 * @param instrs     Instruction list (single-character strings).
 * @param angle      Rotation angle in degrees.
 * @param startpos   Starting position [x, y, z].
 * @param taper      Width multiplier applied by each "!".
 * @param w          Initial segment width (diameter).
 * @param tropism    Direction the heading bends toward each F step (default: off).
 * @param e          Bend susceptibility (default: 0).
 * @return           Tagged list mixing ["seg", pa, pb, width, color_index] line
 *                   segments and ["leaf", [v0, v1, ...], color_index] filled
 *                   polygons (from "{" "." "}"). The color index (";" increments,
 *                   "," decrements, saved/restored by "[" "]") is a palette slot.
 */
function generate_coords_3d(instrs, angle, startpos, taper, w, tropism = undef, e = 0) =
    let(l = len(instrs), M0 = [ [ 0, 0, 1 ], [ 0, 1, 0 ], [ -1, 0, 0 ] ]) // end let
    [for (i = 0, ch = instrs[0], pos = startpos,
          newpos = (ch == "F" || ch == "M") ? pos + M0[0] : pos,
          M = (ch == "F") ? _tropism_bend(M0, tropism, e) : _step_rot(ch, angle, M0),
          wid = (ch == "!") ? w * taper : w,
          ci = (ch == ";") ? 1 : (ch == ",") ? -1 : 0,
          stack = (ch == "[") ? [[ pos, M0, w, ci ]] : [],
          // Polygon vertices accumulate between "{" and "}"; the accumulator
          // is independent of the turtle "[" "]" stack, so vertices recorded
          // inside a branch persist in the enclosing polygon. "." records a vertex.
          verts = (ch == ".") ? [startpos] : [],
          entry = (ch == "F") ? [ "seg", pos, newpos, wid, ci ] : undef;

          i < l; // condition

          // update variables (sequential: each sees the ones above)
          i = i + 1,

          ch = instrs[i], pos = newpos,

          newpos = (ch == "F" || ch == "M") ? newpos + M[0]
                   : (ch == "]")            ? stack[0][0]
                                            : newpos,

          // F bends the frame by tropism (its _step_rot is identity); "]" restores.
          M = (ch == "]")   ? stack[0][1]
              : (ch == "F") ? _tropism_bend(M, tropism, e)
                            : _step_rot(ch, angle, M),

          wid = (ch == "!")   ? wid * taper
                : (ch == "]") ? stack[0][2]
                              : wid,

          // color index: ";" brighter, "," darker into the palette; "]" restores.
          ci = (ch == ";")   ? ci + 1
               : (ch == ",") ? ci - 1
               : (ch == "]") ? stack[0][3]
                             : ci,

          stack = (ch == "[")   ? concat([[ pos, M, wid, ci ]], stack)
                  : (ch == "]") ? sublist(stack, 1)
                                : stack,

          verts = (ch == "{")   ? []                        // open a new polygon
                  : (ch == ".") ? concat(verts, [newpos])   // record a vertex
                                : verts,                     // carry (survives "[" "]")

          entry = (ch == "F")   ? [ "seg", pos, newpos, wid, ci ]
                  : (ch == "}") ? [ "leaf", verts, ci ]      // emit filled polygon
                                : undef

          ) // end for loop

     if (!is_undef(entry)) entry];

// --------------------------------
// Supporting Modules for Drawing
// --------------------------------

/**
 * segmented_lines_3d
 *
 * Renders a tagged geometry list: ["seg", pa, pb, width] entries as cylinders
 * and ["leaf", [vertices]] entries as filled polygons.
 *
 * @param items           Tagged list from generate_coords_3d.
 * @param leaf_thickness  Thickness of filled leaf polygons (default: 0.2).
 * @param palette         Optional list of colors indexed by the turtle's color
 *                        index (preview only; OpenSCAD strips color on F6/export).
 *                        When undef, geometry is emitted uncolored, unchanged.
 */
module segmented_lines_3d(items, leaf_thickness = 0.2, palette = undef)
{
    segs = [for (it = items) if (it[0] == "seg") it];
    leaves = [for (it = items) if (it[0] == "leaf") it];

    // OpenSCAD silently skips module for-loops over ranges > 10000 elements
    // (only a warning, empty geometry), so large lists must be rendered in chunks.
    rounded = is_undef($ls_rounded) ? true : $ls_rounded;
    if (is_undef(palette))
    {
        // Uncolored path: byte-identical to before color existed.
        _chunked(len(segs)) for (j = $chunk) line_3d(segs[j][1], segs[j][2], segs[j][3]);
        _chunked(len(leaves)) for (j = $chunk) _leaf(leaves[j][1], leaf_thickness);
        if (rounded && len(segs) > 0)
        {
            last = segs[len(segs) - 1];
            translate(last[2]) sphere(d = last[3], $fn = $fn > 0 ? $fn : 16);
        }
    }
    else
    {
        n = len(palette);
        _chunked(len(segs)) for (j = $chunk) color(palette[_pidx(segs[j][4], n)]) line_3d(segs[j][1], segs[j][2], segs[j][3]);
        _chunked(len(leaves)) for (j = $chunk) color(palette[_pidx(leaves[j][2], n)]) _leaf(leaves[j][1], leaf_thickness);
        if (rounded && len(segs) > 0)
        {
            last = segs[len(segs) - 1];
            color(palette[_pidx(last[4], n)]) translate(last[2]) sphere(d = last[3], $fn = $fn > 0 ? $fn : 16);
        }
    }
}

// Wrap a color index into a palette of length n (handles negatives from ",").
function _pidx(i, n) = ((i % n) + n) % n;

/**
 * _chunked
 *
 * Runs its child once per chunk with $chunk set to a <=9999-element index
 * range, so an arbitrarily long list can be walked without tripping
 * OpenSCAD's 10000-element for-range cap. The child iterates: for (j = $chunk).
 *
 * @param size   Total number of elements to cover.
 */
module _chunked(size)
{
    limit = 9999;
    for (c = [0:1:(size > 0 ? floor((size - 1) / limit) : -1)])
    {
        $chunk = [c * limit:1:min(c * limit + limit - 1, size - 1)];
        children();
    }
}

/**
 * _leaf
 *
 * Renders a filled polygon through a run of 3D vertices as a thin prism.
 * The extrusion direction is the Newell-averaged face normal, so the surface
 * tolerates the not-quite-planar vertex runs a turtle produces.
 *
 * @param pts   Polygon vertices [[x,y,z], ...].
 * @param t     Prism thickness (default: 0.2).
 */
module _leaf(pts, t = 0.2)
{
    n = len(pts);
    if (n >= 3)
    {
        nx = _sum([for (i = [0:n - 1]) (pts[i].y - pts[(i + 1) % n].y) * (pts[i].z + pts[(i + 1) % n].z)]);
        ny = _sum([for (i = [0:n - 1]) (pts[i].z - pts[(i + 1) % n].z) * (pts[i].x + pts[(i + 1) % n].x)]);
        nz = _sum([for (i = [0:n - 1]) (pts[i].x - pts[(i + 1) % n].x) * (pts[i].y + pts[(i + 1) % n].y)]);
        nr = [ nx, ny, nz ];
        nm = norm(nr);
        if (nm > 1e-9) // skip degenerate (collinear) vertex runs
        {
            h = nr / nm * t / 2;
            top = [for (p = pts) p + h];
            bot = [for (p = pts) p - h];
            topf = [for (i = [0:n - 1]) i];
            botf = [for (i = [n - 1:-1:0]) i + n];
            sides = [for (i = [0:n - 1])[ i, i + n, (i + 1) % n + n, (i + 1) % n ]];
            polyhedron(points = concat(top, bot), faces = concat([topf], [botf], sides));
        }
    }
}

// Sum of a list of scalars (no builtin sum() in OpenSCAD 2021.01).
function _sum(v) = len(v) == 0 ? 0 : [for (x = v) 1] * v;

/**
 * line_3d
 *
 * Draws a single 3D segment from pa to pb as a cylinder of diameter w,
 * with a sphere joint at the starting point when 'rounded' is enabled.
 *
 * @param pa   Segment start [x, y, z].
 * @param pb   Segment end [x, y, z].
 * @param w    Cylinder diameter.
 */
module line_3d(pa, pb, w)
{
    v = pb - pa;
    d = norm(v);
    rounded = is_undef($ls_rounded) ? true : $ls_rounded;
    fn = $fn > 0 ? $fn : 16;
    if (d > 0) // guard zero-length segments (repeated points)
    {
        b = acos(v.z / d); // inclination from +Z
        c = atan2(v.y, v.x); // azimuth; atan2(0,0)=0 covers the vertical case
        translate(pa)
        {
            if (rounded)
                sphere(d = w, $fn = fn);
            rotate([ 0, b, c ]) cylinder(h = d, d = w, $fn = fn);
        }
    }
}
