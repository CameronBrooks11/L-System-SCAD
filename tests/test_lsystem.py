"""Check the L-system library.

usage: python3 tests/test_lsystem.py [OPENSCAD] [--update]

1. tests/behaviour.scad: segment counts that follow from the rules (dragon
   2^n, Hilbert 4^n - 1, Koch snowflake 3 * 4^n points), the turtle closing a
   square, returning from branches and moving without drawing, symbol
   mapping, the first rule for a symbol winning, stochastic rules repeating
   per seed and drawing in proportion to their weights, and the
   3D turtle's unit steps, pitch, tropism, branch taper and leaves.
2. Every grammar in grammars.scad, expanded to n = min(its n, 3) through the
   2D and 3D turtles, matches its fingerprint in tests/fingerprints.txt: an
   exact checksum of the symbols, the 2D segments and polygon points, and the
   3D segments and leaves. --update rewrites the file.
3. Every example file evaluates with --hardwarnings.
4. Malformed input stops with a message.
"""

import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TESTS = os.path.join(ROOT, "tests")
FINGERPRINTS = os.path.join(TESTS, "fingerprints.txt")

EXPECTED = {
    "dragon_segments": "[2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]",
    "hilbert_segments": "[3, 15, 63, 255, 1023]",
    "koch_snowflake_points": "[3, 12, 48, 192, 768]",
    "square_closes": "[0, 0]",
    "branch": "[0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 2, 0]",
    "move": "[0, 0, 1, 0, 2, 0, 3, 0]",
    "nested_branches": "[0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 1, 0, 2, 0]",
    "draw_chars": '["F", "F", "F", "F", "F"]',
    "drops_unknown": '["F", "F", "+"]',
    "seed_repeats": "true",
    "seeds_differ": "true",
    "zero_weight": "xxxx",
    "weight_share": "true",
    "first_rule_wins": '["F"]',
    "unit_steps": "[1, 1, 1, 1, 1, 1, 1, 1]",
    "pitch_down": "[1, 0, 0]",
    "tropism": "[-0.031415, 0]",
    "branch_taper": "[[1, 0.5], [0.5, 0.25], [0.5, 0.25]]",
    "leaf": "[4]",
}

FINGERPRINT_SCAD = r"""include <{root}/l_systems.scad>
P = 1000000007;
function _digits(k) = k < 10 ? str(k) : str(_digits(floor(k / 10)), k % 10);
function _modsum(v) = [for (i = 0, a = 0; i <= len(v); a = i < len(v) ? (a + v[i]) % P : a, i = i + 1) if (i == len(v)) a][0];
function cs_chars(l) = _digits(_modsum([for (i = [0:1:len(l) - 1]) (ord(l[i]) * ((i % 1009) + 1)) % P]));
function _flat(x) = is_list(x) ? [for (e = x) each _flat(e)] : is_num(x) ? [x] : [];
function cs_nums(l) = let(f = _flat(l)) _digits(_modsum([for (i = [0:1:len(f) - 1]) ((round(f[i] * 1e6) % P + P) % P * ((i % 997) + 1)) % P]));
function cs_3d(items) = cs_nums([for (it = items) it[0] == "seg" ? [1, it[1], it[2], it[3], it[4], it[5]] : [2, it[1], it[2]]]);
function p_(t, k, d) = _ls_param(t[2], k, d);
module probe(name, t) {{
  n = min(3, p_(t, "n", 4));
  draw = p_(t, "draw_chars", "F"); move = p_(t, "move_chars", "M");
  t2 = create_lookup(t[0], t[1], draw, move);
  i2 = apply_rules(t[0], t2[0], t2[1], n);
  c2 = generate_coords(i2, p_(t, "angle", 90), p_(t, "startpos", [0, 0]), p_(t, "heading", 0), false, 0.4);
  p2 = generate_coords(i2, p_(t, "angle", 90), p_(t, "startpos", [0, 0]), p_(t, "heading", 0), true, 0.4);
  t3 = create_lookup(t[0], t[1], draw, move, "FM-+[]&^\\/|!{{}}.;,");
  i3 = apply_rules(t[0], t3[0], t3[1], n);
  g3 = generate_coords_3d(i3, p_(t, "angle", 90), [0, 0, 0], p_(t, "taper", 0.7), 0.4,
                          p_(t, "tropism", undef), p_(t, "tropism_strength", 0.22),
                          p_(t, "attract_points", undef), p_(t, "repel_points", undef), p_(t, "branch_taper", 1));
  echo(str("FP ", name, " n=", n, " i2=", len(i2), ":", cs_chars(i2), " c2=", len(c2), ":", cs_nums(c2),
           " p2=", len(p2), ":", cs_nums(p2), " i3=", len(i3), ":", cs_chars(i3), " g3=", len(g3), ":", cs_3d(g3)));
}}
"""


def run(openscad, scad, out, export="echo", defines=None):
    cmd = [openscad, "--hardwarnings", "--export-format", export, "-o", out]
    for k, v in (defines or {}).items():
        cmd += ["-D", f"{k}={v}"]
    return subprocess.run(cmd + [scad], capture_output=True, text=True)


def main():
    args = [a for a in sys.argv[1:] if a != "--update"]
    update = "--update" in sys.argv
    openscad = args[0] if args else "openscad"
    failures = []

    def report(label, ok, got):
        print(f"{'ok  ' if ok else 'FAIL'} {label}: {got}")
        if not ok:
            failures.append(label)

    with tempfile.TemporaryDirectory() as tmp:
        out = os.path.join(tmp, "out.echo")

        run(openscad, os.path.join(TESTS, "behaviour.scad"), out)
        got = dict(re.findall(r'ECHO: "CHECK (\S+) (.*)"', open(out).read()))
        for name, want in EXPECTED.items():
            report(f"behaviour: {name}", got.get(name) == want, got.get(name))

        names = re.findall(r"^function ([a-z0-9_]+)\(", open(os.path.join(ROOT, "grammars.scad")).read(), re.M)
        scad = os.path.join(tmp, "fingerprints.scad")
        open(scad, "w").write(FINGERPRINT_SCAD.format(root=ROOT) + "".join(f'probe("{n}", {n}());\n' for n in names))
        result = run(openscad, scad, out)
        text = open(out).read()
        rows = re.findall(r'ECHO: "FP (\S+) (.*)"', text)
        current = {n: r for n, r in rows}
        report("every grammar expands without warnings", len(rows) == len(names) and "WARNING" not in text
               and "ERROR" not in text and result.returncode == 0, f"{len(rows)} of {len(names)}")
        if update:
            open(FINGERPRINTS, "w").write("".join(f"{n} {r}\n" for n, r in rows))
            print(f"wrote {len(rows)} fingerprints")
        stored = dict(line.rstrip("\n").split(" ", 1) for line in open(FINGERPRINTS))
        changed = [n for n in names if current.get(n) != stored.get(n)]
        report("every grammar matches its fingerprint", not changed and len(stored) == len(names),
               f"{len(names) - len(changed)} of {len(names)} match" + (f", changed: {changed[:5]}" if changed else ""))

        for f in sorted(f for f in os.listdir(os.path.join(ROOT, "examples")) if f.endswith(".scad")):
            result = run(openscad, os.path.join(ROOT, "examples", f), os.path.join(tmp, "x.csg"), export="csg")
            bad = [l for l in (result.stderr + result.stdout).splitlines() if "WARNING" in l or "ERROR" in l]
            report(f"examples/{f} evaluates", result.returncode == 0 and not bad, bad[:1] or "clean")

        # The first ERROR or WARNING must be the assertion naming the problem.
        cases = {
            "a rule without =": ('use <{root}/l_systems.scad>\nL_System2D("F", ["F-F+F"], n = 2);\n', "Invalid rule"),
            "2D with no iteration count": ('use <{root}/l_systems.scad>\nL_System2D("F", ["F=F+F"]);\n', "n is required"),
            "3D with no iteration count": ('use <{root}/l_systems.scad>\nL_System3D("F", ["F=F+F"]);\n', "n is required"),
        }
        for label, (body, msg) in cases.items():
            scad = os.path.join(tmp, "bad.scad")
            open(scad, "w").write(body.format(root=ROOT))
            result = run(openscad, scad, os.path.join(tmp, "bad.csg"), export="csg")
            first = next((l for l in (result.stderr + result.stdout).splitlines() if l.startswith(("ERROR", "WARNING"))), "")
            report(f"refuses {label}", first.startswith("ERROR: Assertion") and msg in first, first[:100] or "no message")

    print("all checks passed" if not failures else f"{len(failures)} failed")
    sys.exit(1 if failures else 0)


main()
