// l_system_core.scad: the rewriting engine shared by the 2D and 3D turtles.
// Definitions only, so it can be reached through several include paths.
//
// A grammar is an axiom string and a list of rules. A rule is either
// "X=ABC" (X becomes ABC) or ["X", [[weight, "ABC"], [weight, "ABD"], ...]]
// (X becomes one of the options, chosen at random with the given weights,
// seeded by $ls_seed so a render is repeatable).
//
// Expansion runs in two stages. Every pass but the last replaces each symbol
// by its rule, or keeps it. The last pass also turns the drawing symbols into
// F, the moving symbols into M, keeps the turtle's own symbols and drops
// everything else, so the turtle only ever sees symbols it knows.

// ---------------- Grammar tuples ----------------
// A grammar tuple is [axiom, rules, params]; params is a list of [key, value].
function _ls_param(p, k, d) = let (m = [for (e = p) if (e[0] == k) e[1]]) len(m) > 0 ? m[0] : d;

// ---------------- Small string helpers ----------------
// Concatenate a list of strings, pairing neighbours each round, so the
// recursion is only log2(n) deep.
function _cat(l) =
  len(l) == 0 ? ""
  : len(l) == 1 ? l[0]
  : _cat([for (i = [0:2:len(l) - 1]) i + 1 < len(l) ? str(l[i], l[i + 1]) : l[i]]);

// Characters k.. of s, as a string.
function _from(s, k) = k >= len(s) ? "" : _cat([for (i = [k:len(s) - 1]) s[i]]);

function _contains(s, c) = len([for (x = s) if (x == c) 1]) > 0;

// ---------------- Rules ----------------
function _rule_lhs(r) = r[0];

// The right-hand side: a string, or for a stochastic rule a list of
// [cumulative weight in 0..1, string].
function _rule_rhs(r) =
  is_list(r[1]) ? _weights_to_steps(r[1])
  : assert(r[1] == "=", str("Invalid rule: ", r, "\nRules must be in the form 'symbol=replacement'")) _from(r, 2);

function _weights_to_steps(opts) =
  let (total = [for (o = opts) o[0]] * [for (o = opts) 1])
  [for (k = [0:len(opts) - 1]) [[for (j = [0:k]) opts[j][0]] * [for (j = [0:k]) 1] / total, opts[k][1]]];

// One option from a stochastic right-hand side, by a seeded draw.
function _choose(steps, seed) =
  let (r = rands(0, 1, 1, seed)[0], k = [for (i = [0:len(steps) - 1]) if (r < steps[i][0]) i])
  steps[len(k) > 0 ? k[0] : len(steps) - 1][1];

function _ls_seed() = is_undef($ls_seed) ? 1 : $ls_seed;

// The last pass's spelling of a replacement: drawing symbols become F, moving
// symbols M, the turtle's symbols stay, anything else goes.
function _final_form(s, draw_chars, move_chars, valid_chars) =
  _cat([for (c = s) _contains(draw_chars, c) ? "F" : _contains(move_chars, c) ? "M" : _contains(valid_chars, c) ? c : ""]);

// ---------------- Lookup tables ----------------
/**
 * create_lookup
 *
 * Builds the two tables expansion reads, both indexed by a symbol's code:
 * [grow, last]. grow[c] is what symbol c becomes on every pass but the last
 * (its rule, or itself); last[c] is what it becomes on the last pass (its
 * rule or itself in final form, or undef to drop it). The first rule for a
 * symbol wins. A stochastic rule's entry is a list of options.
 *
 * @param start        Axiom string.
 * @param rules        Rules, as above.
 * @param draw_chars   Symbols the turtle draws a segment for (become F).
 * @param move_chars   Symbols the turtle moves without drawing for (become M).
 * @param valid_chars  The turtle's own symbols, kept by the last pass
 *                     (default: the 2D set).
 * @return             [grow, last].
 */
function create_lookup(start, rules, draw_chars, move_chars, valid_chars = "FM-+[]") =
  let (
    lhs = [for (r = rules) _rule_lhs(r)],
    rhs = [for (r = rules) _rule_rhs(r)],
    seen = _cat(concat([for (r = rules) is_list(r[1]) ? str(r[0], _cat([for (o = r[1]) o[1]])) : r], [start, valid_chars])),
    top = max([for (c = seen) if (c != "=") ord(c)]),
    rule_for = function(c) let (k = [for (i = [0:len(lhs) - 1]) if (lhs[i] == c) i]) len(k) > 0 ? k[0] : undef,
    finish = function(x) is_list(x) ? [for (o = x) [o[0], _final_form(o[1], draw_chars, move_chars, valid_chars)]]
                                    : _final_form(x, draw_chars, move_chars, valid_chars),
    grow = [for (code = [0:top + 1]) let (c = chr(code), k = rule_for(c)) is_undef(k) ? c : rhs[k]],
    last = [for (code = [0:top + 1]) let (c = chr(code), k = rule_for(c))
              !is_undef(k) ? finish(rhs[k]) : _contains(valid_chars, c) ? finish(c) : undef]
  )
  [grow, last];

// ---------------- Expansion ----------------
/**
 * apply_rules
 *
 * Expands the axiom n times and returns the result as a list of
 * one-character strings. A stochastic symbol picks its option with the seed
 * $ls_seed + 131 * position + 977 * passes left, so each occurrence draws
 * independently and the same render always repeats. With n = 0 the axiom is
 * returned as it is.
 *
 * @param start        Axiom (string or list of symbols).
 * @param table        The grow table from create_lookup.
 * @param final_table  The last table from create_lookup.
 * @param n            Number of passes.
 */
function apply_rules(start, table, final_table, n) =
  n <= 0 ? start
  : n == 1 ? [for (i = [0:len(start) - 1])
               let (e = final_table[ord(start[i])])
               if (!is_undef(e)) for (c = is_list(e) ? _choose(e, _ls_seed() + i * 131 + n * 977) : e) c]
  : apply_rules([for (i = [0:len(start) - 1])
                  let (e = table[ord(start[i])])
                  for (c = is_list(e) ? _choose(e, _ls_seed() + i * 131 + n * 977) : e) c],
                table, final_table, n - 1);

// ---------------- Turtle stacks ----------------
// The turtles keep their saved states as a linked list [top, rest], so a push
// or a pop costs the same however deep the branching goes.
function _push(stack, state) = [state, stack];
function _top(stack) = stack[0];
function _pop(stack) = stack[1];

// ---------------- Drawing in blocks ----------------
// Runs its child once per block of at most 9999 indices with $chunk set to
// the block's range, since a module for-loop over more than 10000 elements
// draws nothing. The child loops: for (j = $chunk).
module _chunked(size) {
  limit = 9999;
  for (c = [0:1:(size > 0 ? floor((size - 1) / limit) : -1)]) {
    $chunk = [c * limit:1:min(c * limit + limit - 1, size - 1)];
    children();
  }
}
