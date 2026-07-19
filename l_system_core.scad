// Core L-system rewriting engine: rule lookup and grammar expansion.
// Dimension-agnostic; used by the 2D (and future 3D) implementations.
// Definitions only -- no top-level assignments, echoes, or geometry (this file
// is included by every interpreter; diamond re-parses must be idempotent).

// --------------------------------
// Grammar Tuple Access
// --------------------------------

/**
 * _ls_param
 *
 * Looks up a key in a grammar tuple's params list ([key, value] pairs),
 * falling back to a default when the key is absent.
 *
 * @param p    List of [key, value] pairs (a grammar tuple's third element).
 * @param k    Key to look up.
 * @param d    Default value if the key is absent.
 * @return     The value for the key, or the default.
 */
function _ls_param(p, k, d) = let(m = [for (e = p) if (e[0] == k) e[1]]) len(m) > 0 ? m[0] : d;

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
 * @param valid_chars  Turtle symbols the final pass preserves; any other
 *                     ruleless symbol is stripped (default: the 2D set).
 * @return             Array containing the lookup tables.
 */
function create_lookup(start, rules, draw_chars, move_chars, valid_chars = "FM-+[]") =
    let(allchars = str(join(rules), start, valid_chars),

        // Create table of size == max ord character in all rules (<256 for ASCII)
        size = max([for (ch = allchars) if (ch != "=") ord(ch)]) + 1,

        rules_l = [for (rule = rules) rule[0]], // rule 'left' symbol

        rules_r = [for (rule = rules) // rule 'right' symbols (string, or weighted options)
            is_list(rule[1])
                ? _cum(rule[1])
                : assert(rule[1] == "=", str("Invalid rule: ", rule, "\nRules must be in the form 'symbol=replacement'"))
                      substr(rule, 2)],

        table = [for (i = [0:size]) // rule_i is index of first rule for ch, otherwise undef
                     let(ch = chr(i), rule_i = [for (j = [0:len(rules) - 1]) if (rules_l[j] == ch) j][0]) // end let 2
                     is_undef(rule_i)
                     ? ch
                     : rules_r[rule_i]],

        final_rules1 = [for (rule = rules) // rule right symbols (string, or weighted options)
            is_list(rule[1])
                ? [ rule[0], _cum(rule[1]) ]
                : assert(rule[1] == "=", str("Invalid rule: ", rule,
                                             "\nRules must be in the form 'symbol=replacement'"))[rule[0], substr(rule, 2)]],

        final_rules2 =
            [for (ch = valid_chars)[ch, ch]], // use identity rules for valid characters,
                                              // needed because any invalid char will be filtered out in final pass

        // Normalize replacements to F/M/valid; stochastic options are normalized per option.
        final_rules = [for (rule = concat(final_rules1, final_rules2))
                           [ rule[0], is_list(rule[1])
                                          ? [for (o = rule[1])[ o[0], _norm(o[1], draw_chars, move_chars, valid_chars) ]]
                                          : _norm(rule[1], draw_chars, move_chars, valid_chars) ]],
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
// Indexed over position i so each occurrence gets a position/depth-dependent seed
// (i*131 + n*977); a stochastic cell (is_list) is picked per occurrence, a
// deterministic cell (string) is used directly, so deterministic grammars are
// unaffected (the ternary is lazy: no rands() call on the deterministic path).
function apply_rules(start, table, final_table,
                     n) = n > 1
                              ? apply_rules([for (i = [0:len(start) - 1])
                                                 let(e = table[ord(start[i])],
                                                     repl = is_list(e) ? _pick(e, _ls_seed() + i * 131 + n * 977) : e)
                                                     for (c2 = repl) c2],
                                            table, final_table, n - 1)
                              : (n == 1 ? [for (i = [0:len(start) - 1])
                                               let(e = final_table[ord(start[i])],
                                                   repl = is_undef(e) ? ""
                                                          : is_list(e) ? _pick(e, _ls_seed() + i * 131 + n * 977)
                                                                       : e)
                                                   for (c2 = repl) c2]
                                        : start);

// --------------------------------
// Stochastic Rule Helpers
// --------------------------------
// A rule's right-hand side is either a string ("X=ABC", deterministic) or a
// list of weighted options [[weight, "repl"], ...] (stochastic). is_list()
// distinguishes them (is_list of a string is false), so deterministic grammars
// never touch this code and expand exactly as before.

// Master seed for stochastic choices; default keeps renders reproducible.
function _ls_seed() = is_undef($ls_seed) ? 1 : $ls_seed;

// Sum of option weights for indices 0..k (k < 0 -> 0).
function _addw(opts, k) = k < 0 ? 0 : opts[k][0] + _addw(opts, k - 1);

// Normalize weighted options into cumulative thresholds paired with replacements:
// [[w0,r0],[w1,r1],...] -> [[w0/T, r0], [(w0+w1)/T, r1], ...], T = total weight.
function _cum(opts) = let(total = _addw(opts, len(opts) - 1))
    [for (k = [0:len(opts) - 1])[ _addw(opts, k) / total, opts[k][1] ]];

// Pick a replacement from cumulative-threshold options using a seeded draw.
function _pick(opts, seed) = let(r = rands(0, 1, 1, seed)[0], hit = [for (k = [0:len(opts) - 1]) if (r < opts[k][0]) k][0])
    opts[is_undef(hit) ? len(opts) - 1 : hit][1];

// Normalize a replacement string: map draw/move chars to F/M, keep valid turtle
// symbols, drop everything else. (Extracted from the create_lookup final pass.)
function _norm(s, draw_chars, move_chars, valid_chars) =
    join([for (ch = s) in_list(draw_chars, ch) ? "F" : in_list(move_chars, ch) ? "M" : in_list(valid_chars, ch) ? ch : ""]);

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
