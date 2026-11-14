// Echoes "CHECK name value" lines for tests/test_lsystem.py to compare.
include <../l_systems.scad>

function expand(t, n, valid = "FM-+[]") =
  let (p = t[2], tb = create_lookup(t[0], t[1], _ls_param(p, "draw_chars", "F"), _ls_param(p, "move_chars", "M"), valid))
  apply_rules(t[0], tb[0], tb[1], n);
function segs2(t, n) = let (p = t[2]) generate_coords(expand(t, n), _ls_param(p, "angle", 90), [0, 0], _ls_param(p, "heading", 0), false, 0.4);
function count2(t, n) = len(segs2(t, n)) / 4;
V3 = "FM-+[]&^\\/|!{}.;,";
function walk3(axiom, rules, n, angle, T = undef, e = 0, bt = 1) =
  let (tb = create_lookup(axiom, rules, "F", "M", V3))
  generate_coords_3d(apply_rules(axiom, tb[0], tb[1], n), angle, [0, 0, 0], 0.7, 1, T, e, undef, undef, bt);
function r6(v) = is_list(v) ? [for (x = v) r6(x)] : round(v * 1e6) / 1e6;

// Segment counts that follow from the rules
echo(str("CHECK dragon_segments ", [for (k = [1:10]) count2(dragon_curve(), k)]));
echo(str("CHECK hilbert_segments ", [for (k = [1:5]) count2(hilbert_curve(), k)]));
echo(str("CHECK koch_snowflake_points ", [for (k = [0:4]) let (t = koch_snowflake()) len(generate_coords(expand(t, k), 60, [0, 0], 0, true, 0))]));

// The turtle: a square closes; a branch returns; a move draws nothing
sq = generate_coords(expand(["F+F+F+F", []], 0), 90, [0, 0], 0, false, 0);
echo(str("CHECK square_closes ", r6([sq[len(sq) - 2], sq[len(sq) - 1]])));
echo(str("CHECK branch ", r6(generate_coords(expand(["F[+F]F", []], 0), 90, [0, 0], 0, false, 0))));
echo(str("CHECK move ", r6(generate_coords(expand(["FMF", []], 0), 90, [0, 0], 0, false, 0))));
echo(str("CHECK nested_branches ", r6(generate_coords(expand(["F[+F[+F]F]F", []], 0), 90, [0, 0], 0, false, 0))));
echo(str("CHECK draw_chars ", expand(["A", ["A=AB", "B=A"], [["draw_chars", "AB"]]], 3)));
echo(str("CHECK drops_unknown ", expand(["FXQ", ["X=F+"]], 1)));

// Stochastic rules: repeatable for a seed, different across seeds, weights obeyed
echo(str("CHECK seed_repeats ", expand(stochastic_tree(), 4, V3) == expand(stochastic_tree(), 4, V3)));
s1 = let ($ls_seed = 1) expand(stochastic_tree(), 4, V3);
s2 = let ($ls_seed = 2) expand(stochastic_tree(), 4, V3);
echo(str("CHECK seeds_differ ", s1 != s2));
echo(str("CHECK zero_weight ", _cat(expand(["AAAA", [["A", [[1, "x"], [0, "y"]]]]], 2, "xy"))));
// Weights 3:1 that do not sum to 1: about three quarters of 400 draws are x
w31 = expand([_cat([for (i = [1:400]) "A"]), [["A", [[3, "x"], [1, "y"]]]]], 1, "xy");
echo(str("CHECK weight_share ", let (k = len([for (c = w31) if (c == "x") 1])) k > 260 && k < 340));
// The first rule for a symbol wins
echo(str("CHECK first_rule_wins ", expand(["A", ["A=F", "A=FF"]], 1)));

// 3D: every step has unit length however the frame turns; & 90 turns +Z to +X
long = walk3("F&F/F+F^F\\F-F|F", [], 0, 37);
echo(str("CHECK unit_steps ", [for (s = long) round(norm(s[2] - s[1]) * 1e9) / 1e9]));
echo(str("CHECK pitch_down ", r6(walk3("&F", [], 0, 90)[0][2])));
// Gravity pulls a horizontal branch down; with none it stays level
echo(str("CHECK tropism ", r6([walk3("&FFFF", [], 0, 90, [0, 0, -1], 0.3)[3][2].z, walk3("&FFFF", [], 0, 90)[3][2].z])));
// branch_taper narrows each F and a branch inherits the tip width
bt = walk3("F[F]F", [], 0, 30, undef, 0, 0.5);
echo(str("CHECK branch_taper ", r6([for (s = bt) [s[3], s[4]]])));
// Leaves: a closed run of vertices becomes one leaf
lv = walk3("{.F+.F+.F+.}", [], 0, 90);
echo(str("CHECK leaf ", [for (x = lv) if (x[0] == "leaf") len(x[1])]));
