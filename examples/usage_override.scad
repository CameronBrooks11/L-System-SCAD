// User script showing how to override the library settings.
// Settings are $-special variables (dynamically scoped), so they work with
// `use` as well as `include`, and can also be overridden per call.

use <../l_systems.scad>;

$ls_rounded = false; // Disable rounded corners (faster preview)
$ls_debug = true;    // Enable debug echoes
$fn = 8;             // Reduce fragment resolution for rounded corners

// Lévy Dragon
module levy_dragon(n = 10, angle = 45, w = 0.4)
{
    L_System2D("F", ["F=+F--F+"], n, angle, w);
}

levy_dragon();

// Per-call override: this one gets rounded corners despite the global setting
translate([ 30, 0 ]) levy_dragon($ls_rounded = true);
