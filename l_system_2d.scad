// l_system_2d.scad: the 2D turtle, drawing an expanded grammar as lines or
// as a filled polygon. Definitions only.
//
// Settings ($-special variables, per call or at the top of your file):
//   $ls_rounded (default true)  - round the line joints and ends
//   $ls_debug   (default false) - echo the tables, symbols and coordinates

include <l_system_core.scad>;

/**
 * L_System2D
 *
 * Draws an L-system in 2D. Pass an axiom and rules, or a grammar tuple
 * [axiom, rules, params] from grammars.scad alone, whose params give the
 * defaults; explicit arguments win over them.
 *
 * @param start       Axiom string, or a grammar tuple.
 * @param rules       Rules (omit with a tuple).
 * @param n           Number of passes.
 * @param angle       Turn for + and - in degrees (default 90).
 * @param w           Line width (default 0.4).
 * @param draw_chars  Symbols that draw a step (default "F").
 * @param move_chars  Symbols that move a step without drawing (default "M").
 * @param heading     Starting direction in degrees (default 0, along +x).
 * @param startpos    Starting point [x, y] (default [0, 0]).
 * @param poly        Fill the path as a polygon instead of drawing lines (default false).
 */
module L_System2D(start, rules, n, angle, w, draw_chars, move_chars, heading, startpos, poly) {
  debug = is_undef($ls_debug) ? false : $ls_debug;
  tuple = is_undef(rules) && is_list(start);
  p = tuple && len(start) > 2 ? start[2] : [];
  pick = function(v, k, d) !is_undef(v) ? v : _ls_param(p, k, d);

  _n = pick(n, "n", undef);
  _angle = pick(angle, "angle", 90);
  _w = pick(w, "w", 0.4);
  _poly = pick(poly, "poly", false);
  assert(!is_undef(_n), "L_System2D: n is required (no iteration count given or found in the grammar tuple)");

  tables = create_lookup(tuple ? start[0] : start, tuple ? start[1] : rules, pick(draw_chars, "draw_chars", "F"),
                         pick(move_chars, "move_chars", "M"));
  if (debug) echo("Tables:", tables);
  instrs = apply_rules(tuple ? start[0] : start, tables[0], tables[1], _n);
  if (debug) echo("Instructions:", instrs);
  coords = generate_coords(instrs, _angle, pick(startpos, "startpos", [0, 0]), pick(heading, "heading", 0), _poly, _w);
  if (debug) echo("Coords:", coords);

  if (_poly) polygon(coords);
  else segmented_lines(coords, _w);
  if (debug) echo("Done!");
}

/**
 * generate_coords
 *
 * Walks the turtle along the symbols, one unit per F or M step. With
 * poly = false, returns a flat list holding four numbers [xa, ya, xb, yb] for
 * each F; with poly = true, the point each F starts from, for polygon().
 *
 * @param instrs    Expanded symbols.
 * @param angle     Turn for + and - in degrees.
 * @param startpos  Starting point [x, y].
 * @param heading   Starting direction in degrees.
 * @param poly      Return polygon points instead of line segments.
 * @param w         Unused; kept for existing callers.
 */
// The turtle is its position p, heading h, unit step d along h, and saved
// states st, for the current symbol c. Each step updates them in that order,
// so "]" restores p and h before popping st, and d is only recomputed when h
// changes.
function generate_coords(instrs, angle, startpos, heading, poly, w) =
  let (n = len(instrs))
  [for (i = 0, c = instrs[0], p = startpos, h = heading, d = [cos(heading), sin(heading)], st = []; i < n;
        p = c == "F" || c == "M" ? p + d : c == "]" ? _top(st)[0] : p,
        h = c == "+" ? h + angle : c == "-" ? h - angle : c == "]" ? _top(st)[1] : h,
        d = c == "+" || c == "-" || c == "]" ? [cos(h), sin(h)] : d,
        st = c == "[" ? _push(st, [p, h]) : c == "]" ? _pop(st) : st,
        i = i + 1, c = instrs[i])
    if (c == "F") each (poly ? [p] : let (q = p + d) [p.x, p.y, q.x, q.y])];

// ---------------- Drawing ----------------

/**
 * segmented_lines
 *
 * Draws the flat [xa, ya, xb, yb, ...] list from generate_coords: each
 * segment as a bar of width w, with a round joint at its start and a round
 * end on the last when $ls_rounded is on.
 */
module segmented_lines(l, w = 0.1) {
  count = floor(len(l) / 4);
  _chunked(count) for (j = $chunk) line(l[4 * j], l[4 * j + 1], l[4 * j + 2], l[4 * j + 3], w);
  if ((is_undef($ls_rounded) ? true : $ls_rounded) && count > 0)
    translate([l[4 * count - 2], l[4 * count - 1]]) circle(d = w, $fn = $fn > 0 ? $fn : 16);
}

/**
 * line
 *
 * One bar of width w from (xa, ya) to (xb, yb), with a round joint at its
 * start when $ls_rounded is on.
 */
module line(xa, ya, xb, yb, w = 0.1) {
  translate([xa, ya]) {
    if (is_undef($ls_rounded) ? true : $ls_rounded) circle(d = w, $fn = $fn > 0 ? $fn : 16);
    rotate(atan2(yb - ya, xb - xa)) translate([0, -w / 2]) square([norm([xb - xa, yb - ya]), w]);
  }
}
