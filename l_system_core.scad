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
