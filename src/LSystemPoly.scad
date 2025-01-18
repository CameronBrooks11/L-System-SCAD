/**
 * L_system_polygon
 *
 * Draws a closed path using polygon. Assumes no move commands (all lines connected).
 * Only the Koch snowflake uses this currently.
 *
 * @param start        Starting axiom string.
 * @param rules        Array of replacement rules in the form "X=ABC".
 * @param n            Number of iterations.
 * @param angle        Angle of rotation in degrees (default: 90).
 * @param draw_chars   Characters interpreted as draw commands (default: "F").
 */
module L_system_polygon(start, rules, n, angle = 90, draw_chars = "F")
{
    startpos = [ 0, 0 ];
    heading = 0;

    tables = create_lookup(start, rules, draw_chars, "");
    // echo(tables);
    instrs = apply_rules(start, tables[0], tables[1], n);
    // echo(instrs);
    l = len(instrs);
    path = // C-style "for" list comprehension
        [for (i = 0, ch = instrs[0], pos = (ch == "F") ? startpos + [ cos(heading), sin(heading) ] : startpos,
              heading = (ch == "-")   ? heading - angle
                        : (ch == "+") ? heading + angle
                                      : heading,
              stack = (ch == "[") ? [[pos, heading]] : [];
              i < l; // condition
              // update variables
              i = i + 1,
              ch = instrs[i],
              pos = (ch == "F")   ? pos + [ cos(heading), sin(heading) ]
                    : (ch == "]") ? stack[0][0]
                                  : pos,
              heading = (ch == "-")   ? heading - angle
                        : (ch == "+") ? heading + angle
                        : (ch == "]") ? stack[0][1]
                                      : heading,
              stack = (ch == "[")   ? concat([[pos, heading]], stack)
                      : (ch == "]") ? sublist(stack, 1)
                                    : stack
              //,_=echo(ch,pos,newpos,heading,stack)
              ) if (ch == "F") pos];
    // echo(path);
    polygon(path);
}