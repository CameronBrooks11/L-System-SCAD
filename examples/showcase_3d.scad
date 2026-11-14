// The 3D grammars, and two 2D curves drawn as 3D tubes.
// Pick one from the dropdown. The seed changes the stochastic tree's branches.
use <../l_systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "whorl_tree"; // [hilbert_curve_3d, abop_bush, whorl_tree, coral_3d, weeping_tree, leafy_sprig, stochastic_tree, color_tree, reaching_tree, hilbert_curve_tube, dragon_curve_tube]

// Seed for the stochastic tree; each seed grows different branches
seed = 1; // [1:100]

// ================================
// Curve Selection Logic
// ================================
if (selected_curve == "hilbert_curve_3d")
{
    L_System3D(hilbert_curve_3d(), n = 3, w = 0.5); // Recommended n <= 4
}
else if (selected_curve == "abop_bush")
{
    L_System3D(abop_bush(), n = 6); // Recommended n <= 7
}
else if (selected_curve == "whorl_tree")
{
    L_System3D(whorl_tree(), n = 6); // Recommended n <= 7
}
else if (selected_curve == "coral_3d")
{
    L_System3D(coral_3d(), n = 5); // Recommended n <= 6
}
else if (selected_curve == "weeping_tree")
{
    L_System3D(weeping_tree(), n = 6); // gravity tropism; Recommended n <= 7
}
else if (selected_curve == "leafy_sprig")
{
    L_System3D(leafy_sprig(), n = 4); // filled polygon leaves; Recommended n <= 4
}
else if (selected_curve == "stochastic_tree")
{
    L_System3D(stochastic_tree(), n = 6, $ls_seed = seed); // random branch patterns
}
else if (selected_curve == "color_tree")
{
    L_System3D(color_tree(), n = 6); // per-level color gradient (preview only)
}
else if (selected_curve == "reaching_tree")
{
    L_System3D(reaching_tree(), n = 6); // directed growth toward an attractor point
}
// Grammars are dimension-free data: any 2D curve renders as a 3D tube.
else if (selected_curve == "hilbert_curve_tube")
{
    L_System3D(hilbert_curve(), n = 5, w = 0.6); // 2D grammar, 3D interpreter
}
else if (selected_curve == "dragon_curve_tube")
{
    L_System3D(dragon_curve(), n = 10, w = 0.6); // 2D grammar, 3D interpreter
}
else
{
    echo("Selected curve is not defined.");
}
