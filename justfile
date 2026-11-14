# Check behaviour, every grammar's fingerprint, the examples and error messages
test:
    python3 tests/test_lsystem.py

# Rewrite tests/fingerprints.txt after an intended change to a grammar's output
fingerprints:
    python3 tests/test_lsystem.py --update

# Render the README pictures into images/
images:
    mkdir -p images
    openscad --render --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --projection=ortho --camera 0,0,0,0,0,0,0 -D 'selected_curve="dragon_curve"' -o images/dragon_curve.png examples/showcase_lines_2d.scad
    openscad --render --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --projection=ortho --camera 0,0,0,0,0,270,0 -D 'selected_curve="fractal_plant"' -o images/fractal_plant.png examples/showcase_lines_2d.scad
    openscad --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --camera 0,0,0,75,0,30,0 -D 'selected_curve="color_tree"' -o images/color_tree.png examples/showcase_3d.scad
    openscad --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --camera 0,0,0,75,0,30,0 -D 'selected_curve="weeping_tree"' -o images/weeping_tree.png examples/showcase_3d.scad
    openscad --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --camera 0,0,0,55,0,30,0 -D 'selected_curve="hilbert_curve_3d"' -o images/hilbert_curve_3d.png examples/showcase_3d.scad
    openscad --imgsize 900,900 --viewall --autocenter --colorscheme Tomorrow --camera 0,0,0,75,0,30,0 -o images/printable_tree.png examples/printable_tree.scad
