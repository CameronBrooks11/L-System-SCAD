// User script showing how to render a predefined curve from the catalog.
use <../l_systems.scad>;

// A grammar tuple carries its own curated defaults (angle, n, ...):
L_System2D(moore_square());

// Explicit arguments override the tuple's params:
translate([ 20, 0 ]) L_System2D(moore_square(), n = 4, angle = 80, w = 1);

// The tuple is plain data: [0] is the axiom, [1] the rules
echo("moore_square axiom:", moore_square()[0]);
