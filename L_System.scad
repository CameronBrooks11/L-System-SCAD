/* 
 * L-system OpenSCAD Library by Hans Loeblich
 * 
 * Version 2.0
 * - Now supports "M" move without draw
 * - Also supports position save "[" and restore "]"
 * - Core functions have been completely rewritten and are about twice as fast using half the memory from before.
 * - Rules now take the form of a single string per rule: "X=ABC"
 * - Added new examples to demonstrate added features
 * 
 * This library is for creating L-systems, aka Lindenmayer Systems,
 * which are a kind of formal grammar that can be used to generate space-filling curves
 * and other fractal shapes by applying replacement rules recursively.
 * 
 * See https://en.wikipedia.org/wiki/L-system for a better, more detailed explanation.
 * Many of the example curves in this file use rules found on that Wikipedia page.
 * 
 * This script relies on recent features, so it is recommended to use a 2019 RC or nightly build of OpenSCAD.
 * Download from: http://www.openscad.org/downloads.html#snapshots
 * 
 * The "turtle graphics" used by the script supports the following operations:
 *   "F" : Moves the turtle "forward" by one unit and draws a line segment
 *   "M" : "Move" turtle forward without drawing (see island_curve example)
 *   "-" : Rotates the turtle to the left by the given angle (default 90 degrees)
 *   "+" : Rotates the turtle to the right by the given angle (default 90 degrees)
 *   "[" : Saves the current position and heading on the stack
 *   "]" : Restores the position and heading from the top of the stack
 * 
 * If your L-system rules use different symbols than "F" for forward
 * or "M" for move, you can specify an optional string of characters to interpret as each
 * of those operations, using the "draw_chars" and "move_chars" parameters for L_system2.
 * See examples: island_curve, gosper_curve, and sierpinski_triangle definitions.
 * 
 * Note: The models increase in complexity exponentially, so be careful with increasing values of 'n'
 * or the program may hang or consume many gigabytes of RAM.
 * 
 * Recommended absolute maximum 'n' values have been given for each curve,
 * most of which are currently limited by the 1,000,000 iteration limit for "C-style" for loops
 * in OpenSCAD. This is the limit of the final total instructions length after applying
 * replacement rules. That's also around the point where geometries may need multiple GB of RAM.
 * 
 * All the generated shapes are currently 2D, and it is recommended to **USE F6 RENDER** to view each curve.
 * It takes roughly the same time to complete as F5, but the framerate of moving the camera, etc.,
 * will be much better without OpenCSG rendering a 2D object as 3D on these complex models.
 */

// Global Settings
rounded = true; // Add circles at each vertex
// Setting rounded = false gives slightly faster preview/render but an uglier curve path

n = 18; // Default iteration level

$fn = 16; // Fragment resolution

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
module L_system2(start, rules, n, angle, w=0.4, draw_chars="F", move_chars="M", heading=0, startpos=[0,0]) {
    tables = create_lookup(start, rules, draw_chars, move_chars);
    // echo(tables);
    instrs = apply_rules(start, tables[0], tables[1], n);
    // echo(instrs);
    l = len(instrs);

    // Generate a completely flat list of numbers, with each consecutive 4 numbers representing a line segment
    // This doubles the output size necessary in most cases, but needed to support M (move without drawing) commands
    coords = // C-style "for" list comprehension
    [for(
        i=0, ch=instrs[0], pos=startpos,
        newpos=(ch=="F" || ch=="M") ? pos + [cos(heading), sin(heading)] : pos,
        heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
        stack=(ch=="[") ? [[pos, heading]] : [];
        
        i < l; // condition
        // update variables
        i = i+1,
        ch = instrs[i],
        pos = newpos, 
        newpos = (ch=="F" || ch=="M") ? newpos + [cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : newpos,
        heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
        stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
        //,_=echo(ch,pos,newpos,heading,stack)       
    )
    if(ch=="F") for(x=[pos[0],pos[1],newpos[0],newpos[1]]) x ];

    segmented_lines(coords, w);
    echo("Done!");
}

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
module L_system_polygon(start, rules, n, angle=90, draw_chars="F") {
    startpos = [0,0];
    heading = 0;

    tables = create_lookup(start, rules, draw_chars, "");
    // echo(tables);
    instrs = apply_rules(start, tables[0], tables[1], n);
    // echo(instrs);
    l = len(instrs);
    path = // C-style "for" list comprehension
    [for(
        i=0, ch=instrs[0],
        pos=(ch=="F") ? startpos + [cos(heading), sin(heading)] : startpos,
        heading=(ch=="-") ? heading-angle : (ch=="+") ? heading+angle : heading,
        stack=(ch=="[") ? [[pos,heading]] : [];
        i < l; // condition
        // update variables
        i = i+1,
        ch = instrs[i],
        pos = (ch=="F") ? pos + [cos(heading), sin(heading)] : (ch=="]") ? stack[0][0] : pos,
        heading = (ch=="-") ? heading-angle : (ch=="+") ? heading+angle : (ch=="]") ? stack[0][1]: heading,
        stack=(ch=="[") ? concat([[pos,heading]],stack) : (ch=="]") ? sublist(stack,1) : stack 
        //,_=echo(ch,pos,newpos,heading,stack)       
    )
    if(ch=="F") pos ];
    // echo(path);
    polygon(path);
}

/**
 * join
 * 
 * Binary tree based join, depth of recursion is log2(n), rather than n for naive join.
 * 
 * @param l    List to join.
 * @return     Joined string.
 */
function join(l) = let(s = len(l)) s > 0 ? _jb(l,0,s) : "";

// "join binary", splits list into halves and joins them. 
// l=list, b=begin(inclusive), e=end(exlusive), s=size, m=midpoint
function _jb(l,b,e) = let(s = e-b, m=floor(b+s/2)) 
    s > 2 ? 
        str(_jb(l,b,m), _jb(l,m,e)) 
    : s == 2 ? 
        str(l[b],l[b+1]) 
    : 
        l[b];

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
function substr(s,b,e) = let(
    e = is_undef(e) || e > len(s) ? len(s) : e
) 
    (b == e) ? "" : join([for(i=[b:e-1]) s[i] ]);

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
function sublist(s,b,e) = let(
    e = is_undef(e) || e > len(s) ? len(s) : e
) 
    [for(i=[b:1:e-1]) s[i] ];

/**
 * in_list
 * 
 * Checks if a value is present in a list (or string).
 * 
 * @param l    List or string to search.
 * @param v    Value to find.
 * @return     True if value is in the list, false otherwise.
 */
function in_list(l,v) = len([for(x=l) if(x==v) x]) > 0;

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
    let (
        valid_chars = "FM-+[]",
        allchars = str(join(rules), start, valid_chars),
        // Create table of size == max ord character in all rules (<256 for ASCII)
        size = max([for(ch = allchars) if (ch != "=") ord(ch)]) + 1,
        rules_l = [for (rule = rules) rule[0]], // rule left symbol
        rules_r = [for (rule = rules)           // rule right symbols
            assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
            substr(rule,2)
        ],
        table = [for(i=[0:size]) // rule_i is index of first rule for ch, otherwise undef 
            let (ch = chr(i), rule_i=[for(j=[0:len(rules)-1]) if(rules_l[j]==ch) j ][0]) 
            is_undef(rule_i) ? ch : rules_r[rule_i]
        ],
        //valid_identity = 
        final_rules1 = [for (rule = rules)     // rule right symbols
            assert(rule[1]=="=", str("Invalid rule:\"",rule,"\"\nRules must be single strings starting with a symbol to replace, then '=', then the replacement string")) 
            [rule[0],substr(rule,2)]
        ],
        final_rules2 = [for (ch=valid_chars) [ch,ch]], // use identity rules for valid characters, 
                                        // needed because any invalid char will be filtered out in final pass
        final_rules = [for(rule=concat(final_rules1,final_rules2))
            [rule[0], join([for(ch=rule[1]) in_list(draw_chars,ch)? "F": (in_list(move_chars,ch)? "M": in_list(valid_chars,ch) ? ch : "") ])]
        ],
        // final table should specify replacements for draw/move, and keep any other valid chars
        // if a draw/move char is a F or M then 
        final_table = [for(i=[0:size])
            let (
                ch = chr(i), // rule_i is index of first rule for ch, otherwise undef
                rule_i=[for(j=[0:len(final_rules)-1]) if(final_rules[j][0]==ch) j ][0]
            ) 
            is_undef(rule_i) ? undef : final_rules[rule_i][1]
        ]
    )
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
function apply_rules(start, table, final_table, n) = 
    n > 1 ? 
        apply_rules([ for(ch=start) for(c2=table[ord(ch)]) c2 ], table, final_table, n-1) 
    :
        (n == 1 ? 
            [ for(ch=start) for(c2=final_table[ord(ch)]) c2] 
            : start);

/**
 * segmented_lines
 * 
 * Works on long lists of "lines" which are specified as a flat list of numbers, 
 * each 4 representing a single line: [xa,ya,xb,yb,...]
 * 
 * @param l    Flat list of line segments.
 * @param w    Width of the lines (default: 0.1).
 */
module segmented_lines(l, w=0.1) {
    // OpenSCAD doesn't allow ranges > 10000 in modules, 
    // so limit is used to split very large segmented lines into manageable chunks
    limit = 9999*4;
    size = len(l);
    imax = floor((size-1) / limit);
    for (i = [0:1:imax]) {
        jmin = i*limit;
        jmax = min(jmin + limit - 1, size-1);
        for (j=[jmin:4:jmax]) {
            line(l[j],l[j+1],l[j+2],l[j+3], w); 
        }
    }
    if (rounded) {
        lmax = len(l)-1;
        translate([l[lmax-1], l[lmax]]) circle(d=w); 
    }
}

/**
 * binary_lines
 * 
 * Works on long lists of "lines" which are a flat list of numbers: [xa1,ya1,xb1,yb1,xa2,ya2,xb2,yb2,...]
 * From testing, this is not really advantageous over segmented_lines implementation above.
 * 
 * @param l    Flat list of line segments.
 * @param w    Width of the lines (default: 0.1).
 * @param b    Begin index (default: 0).
 * @param end  End index (optional).
 */
module binary_lines(l, w=0.1, b=0, end) {
    e = is_undef(end) ? len(l) : end;
    s = e - b;
    // echo(b,e,s);
    if (s > 8) {
        m = b + floor(s/8)*4;
        binary_lines(l, w, b, m);    
        binary_lines(l, w, m, e);    
    } else if (s == 8){
        line(l[b  ],l[b+1],l[b+2],l[b+3], w); 
        line(l[b+4],l[b+5],l[b+6],l[b+7], w); 
    } else if (s == 4){
        line(l[b],l[b+1],l[b+2],l[b+3], w); 
    }
    if (rounded) {
        lmax = len(l)-1;
        translate([l[lmax-1], l[lmax]]) circle(d=w); 
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
module line(xa,ya,xb,yb, w=0.1) {
    // echo(xa,ya,xb,yb);
    dx = (xb - xa);
    dy = (yb - ya);
    d = sqrt(dx*dx + dy*dy);
    a = atan2(dy, dx);
    translate([xa,ya]) {
        if (rounded) circle(d=w);
        rotate([0,0,a]) translate([0,-w/2]) square([d,w]);
    }
}
