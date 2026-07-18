// L-system based model generator for 2D curves.

include <l_system_core.scad>;

/**
 * L_System2D
 *
 * Generates an L-system based model.
 *
 * @param start        Starting axiom string.
 * @param rules        Array of replacement rules in the form "X=ABC".
 * @param n            Number of iterations.
 * @param angle        Angle of rotation in degrees.
 * @param w            Width of the line segments (default: 0.4).
 * @param draw_chars   Characters interpreted as draw commands (default: "F").
 * @param move_chars   Characters interpreted as move commands (default: "M").
 * @param heading      Initial heading angle in degrees (default: 0).
 * @param startpos     Starting position as [x, y] coordinates (default: [0, 0]).
 */
module L_System2D(start, rules, n, angle = 90, w = 0.4, draw_chars = "F", move_chars = "M", heading = 0,
                 startpos = [ 0, 0 ], poly = false)
{
    // First create the lookup tables for rule replacement
    tables = create_lookup(start, rules, draw_chars, move_chars);
    if (debug)
        echo("Tables:", tables);

    // Apply the rules to generate the final instruction set
    instrs = apply_rules(start, tables[0], tables[1], n);
    if (debug)
        echo("Instructions:", instrs);

    // Generate the coordinates based on the instructions
    coords = generate_coords(instrs, angle, startpos, heading, poly, w);
    if (debug)
        echo("Coords:", coords);

    if (poly)
        polygon(coords); // draw polygon
    else
        segmented_lines(coords, w); // draw lines
    echo("Done!");
}

/**
 * generate_coords
 *
 * Generates a list of coordinates based on instructions.
 * If poly = true, it generates a list of [x, y] coordinates for a polygon.
 * If poly = false, it generates a flat list where every consecutive 4 numbers represent a line segment.
 * This doubles the output size necessary in most cases, but supports M (move without drawing) commands.
 * The output is a C-style "for" list comprehension.
 *
 * @param instrs     Instructions for generating coordinates.
 * @param l          Length of segments.
 * @param angle      Angle for turning.
 * @param startpos   Starting position for the first segment.
 * @param heading    Heading (orientation) of the first segment.
 * @param poly       Flag to determine if output should be polygonal or flat.
 * @param w          Width of the segments.
 * @return           List of coordinates or line segments based on the poly flag.
 */
function generate_coords(instrs, angle, startpos, heading, poly, w) = let(l = len(instrs)) // end let
    [for (i = 0, ch = instrs[0], pos = startpos,
          newpos = (ch == "F" || ch == "M") ? pos + [ cos(heading), sin(heading) ] : pos,
          heading = (ch == "-")   ? heading - angle
                    : (ch == "+") ? heading + angle
                                  : heading,
          stack = (ch == "[") ? [[pos, heading]] : [];

          i < l; // condition

          // update variables
          i = i + 1,

          ch = instrs[i], pos = newpos,

          newpos = (ch == "F" || ch == "M") ? newpos + [ cos(heading), sin(heading) ]
                   : (ch == "]")            ? stack[0][0]
                                            : newpos,

          heading = (ch == "-")   ? heading - angle
                    : (ch == "+") ? heading + angle
                    : (ch == "]") ? stack[0][1]
                                  : heading,

          stack = (ch == "[")   ? concat([[pos, heading]], stack)
                  : (ch == "]") ? sublist(stack, 1)
                                : stack

          //,_=echo(ch,pos,newpos,heading,stack)
          ) // end for loop

     if (ch == "F") // only draw if F command
     if (poly) pos  // for polygon return only the position [x,y]
     else           // otherwise return the line segment [xa,ya,xb,yb]
     for (x = [ pos[0], pos[1], newpos[0], newpos[1] ]) x];

// --------------------------------
// Supporting Modules for Drawing
// --------------------------------

/**
 * segmented_lines
 *
 * Works on long lists of "lines" which are specified as a flat list of numbers,
 * each 4 representing a single line: [xa,ya,xb,yb,...]
 *
 * @param l    Flat list of line segments.
 * @param w    Width of the lines (default: 0.1).
 */
module segmented_lines(l, w = 0.1)
{
    // OpenSCAD doesn't allow ranges > 10000 in modules,
    // so limit is used to split very large segmented lines into manageable chunks
    limit = 9999 * 4;
    size = len(l);
    imax = floor((size - 1) / limit);
    for (i = [0:1:imax])
    {
        jmin = i * limit;
        jmax = min(jmin + limit - 1, size - 1);
        for (j = [jmin:4:jmax])
        {
            line(l[j], l[j + 1], l[j + 2], l[j + 3], w);
        }
    }
    if (rounded)
    {
        lmax = len(l) - 1;
        translate([ l[lmax - 1], l[lmax] ]) circle(d = w);
    }
}

/**
 * line
 *
 * Draws a single line segment from (xa, ya) to (xb, yb) with width w.
 * Optionally adds a circle at the starting point if 'rounded' is true.
 *
 * @param xa   Starting x-coordinate.
 * @param ya   Starting y-coordinate.
 * @param xb   Ending x-coordinate.
 * @param yb   Ending y-coordinate.
 * @param w    Width of the line (default: 0.1).
 */
module line(xa, ya, xb, yb, w = 0.1)
{
    // echo(xa,ya,xb,yb);
    dx = (xb - xa);
    dy = (yb - ya);
    d = sqrt(dx * dx + dy * dy);
    a = atan2(dy, dx);
    translate([ xa, ya ])
    {
        if (rounded)
            circle(d = w);
        rotate([ 0, 0, a ]) translate([ 0, -w / 2 ]) square([ d, w ]);
    }
}
