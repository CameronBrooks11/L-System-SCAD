// A simple 3D tree on a round base, sized for 3D printing.
// Radial branching with smooth tapered cone branches (thick trunk -> thin
// twigs, no beaded joints). Adjust the parameters below or in the Customizer.
use <../l_systems.scad>;

/* [Tree] */
// Fork levels: 1 = minimal, 2 = fuller, 3+ = bushier
levels = 2; // [1:4]
// Branch spread angle in degrees: wider = flatter, narrower = taller
spread_angle = 32; // [15:45]
// How fast branches thin along their length (lower = finer twigs)
branch_taper = 0.85; // [0.6:0.01:0.95]
// Trunk diameter at the base
trunk_width = 5; // [1:0.5:10]

/* [Base] */
// Diameter of the round base disc
base_diameter = 12; // [6:40]
// Thickness of the base disc
base_height = 3; // [1:0.5:8]

/* [Quality] */
// Facets per branch cross-section (higher = smoother, slower)
facets = 32; // [8:64]

// --- model ---
$ls_rounded = false; // clean cone-to-cone joints, no sphere beads
$fn = facets;

color("dimgray") translate([ 0, 0, -base_height / 2 ]) cylinder(h = base_height, d = base_diameter, $fn = 64);

L_System3D(printable_tree(), n = levels, angle = spread_angle, w = trunk_width, branch_taper = branch_taper);
