// L-system based model generator for 2D curves.

/**
 * L_system2
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
module L_system2(start, rules, n, angle = 90, w = 0.4, draw_chars = "F", move_chars = "M", heading = 0,
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
    coords = genernate_coords(instrs, angle, startpos, heading, poly, w);
    if (debug)
        echo("Coords:", coords);

    if (poly)
        polygon(coords); // draw polygon
    else
        segmented_lines(coords, w); // draw lines
    echo("Done!");
}

// --------------------------------
// Core Functions
// --------------------------------

/**
 * create_lookup
 *
 * Creates lookup tables for every character, then performs array lookup for replacement
 * instead of many ternary statements.
 *
 * @param start        Starting axiom string.
 * @param rules        Array of replacement rules.
 * @param draw_chars   Characters interpreted as draw commands.
 * @param move_chars   Characters interpreted as move commands.
 * @return             Array containing the lookup tables.
 */
function create_lookup(start, rules, draw_chars, move_chars) =
    let(valid_chars = "FM-+[]", allchars = str(join(rules), start, valid_chars),

        // Create table of size == max ord character in all rules (<256 for ASCII)
        size = max([for (ch = allchars) if (ch != "=") ord(ch)]) + 1,

        rules_l = [for (rule = rules) rule[0]], // rule 'left' symbol

        rules_r = [for (rule = rules) // rule 'right' symbols
            assert(rule[1] == "=", str("Invalid rule: ", rule, "\nRules must be in the form 'symbol=replacement'"))
                substr(rule, 2)],

        table = [for (i = [0:size]) // rule_i is index of first rule for ch, otherwise undef
                     let(ch = chr(i), rule_i = [for (j = [0:len(rules) - 1]) if (rules_l[j] == ch) j][0]) // end let 2
                     is_undef(rule_i)
                     ? ch
                     : rules_r[rule_i]],

        final_rules1 = [for (rule = rules) // rule right symbols
            assert(rule[1] == "=", str("Invalid rule: ", rule,
                                       "\nRules must be in the form 'symbol=replacement'"))[rule[0], substr(rule, 2)]],

        final_rules2 =
            [for (ch = valid_chars)[ch, ch]], // use identity rules for valid characters,
                                              // needed because any invalid char will be filtered out in final pass

        final_rules = [for (rule = concat(final_rules1,
                                          final_rules2))[rule[0], join([for (ch = rule[1]) in_list(draw_chars, ch)
                                                                            ? "F"
                                                                            : (in_list(move_chars, ch)    ? "M"
                                                                               : in_list(valid_chars, ch) ? ch
                                                                                                          : "")])]],
        // final table should specify replacements for draw/move, and keep any other valid chars
        // if a draw/move char is a F or M then
        final_table = [for (i = [0:size]) let(ch = chr(i), // rule_i is index of first rule for ch, otherwise undef
                                              rule_i = [for (j = [0:len(final_rules) - 1]) if (final_rules[j][0] == ch)
                                                  j][0]) // end let 3
                           is_undef(rule_i)
                           ? undef
                           : final_rules[rule_i][1]]) // end let 1
        [table, final_table];

/**
 * apply_rules
 *
 * Recursively applies rule replacement using table lookup.
 * Replacement strings are split out into individual characters at each level.
 * Returns a list of single character strings to be processed into coordinates.
 *
 * @param start        Starting axiom string.
 * @param table        Lookup table for rules.
 * @param final_table  Final lookup table for draw/move commands.
 * @param n            Number of iterations.
 * @return             List of single character strings to be processed into coordinates.
 */
function apply_rules(start, table, final_table,
                     n) = n > 1
                              ? apply_rules([for (ch = start) for (c2 = table[ord(ch)]) c2], table, final_table, n - 1)
                              : (n == 1 ? [for (ch = start) for (c2 = final_table[ord(ch)]) c2] : start);

/**
 * genernate_coords
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
function genernate_coords(instrs, angle, startpos, heading, poly, w) = let(l = len(instrs)) // end let
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
// Helper Functions
// --------------------------------

/**
 * join
 *
 * Binary tree based join, depth of recursion is log2(n), rather than n for naive join.
 *
 * @param l    List to join.
 * @return     Joined string.
 * @usedby    apply_rules
 */
function join(l) = let(s = len(l)) // end let
                           s
                           > 0
                       ? _jb(l, 0, s)
                       : "";

// "join binary", splits list into halves and joins them.
// l=list, b=begin(inclusive), e=end(exlusive), s=size, m=midpoint
function _jb(l, b, e) = let(s = e - b, m = floor(b + s / 2)) // end let
                                s
                                > 2
                            ? str(_jb(l, b, m), _jb(l, m, e))
                        : s == 2 ? str(l[b], l[b + 1])
                                 : l[b];

/**
 * substr
 *
 * Extracts a substring given begin (inclusive) and end (exclusive).
 * If end is not specified, goes to the end of the string.
 *
 * @param s    String to extract from.
 * @param b    Begin index (inclusive).
 * @param e    End index (exclusive).
 * @return     Extracted substring.
 */
function substr(s, b, e) = let(e = is_undef(e) || e > len(s) ? len(s) : e) // end let
                               (b == e)
                               ? ""
                               : join([for (i = [b:e - 1]) s[i]]);

/**
 * sublist
 *
 * Extracts a sublist from a list given begin (inclusive) and end (exclusive).
 *
 * @param s    List to extract from.
 * @param b    Begin index (inclusive).
 * @param e    End index (exclusive).
 * @return     Extracted sublist.
 */
function sublist(s, b, e) = let(e = is_undef(e) || e > len(s) ? len(s) : e) // end let
    [for (i = [b:1:e - 1]) s[i]];

/**
 * in_list
 *
 * Checks if a value is present in a list (or string).
 *
 * @param l    List or string to search.
 * @param v    Value to find.
 * @return     True if value is in the list, false otherwise.
 */
function in_list(l, v) = len([for (x = l) if (x == v) x]) > 0;

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