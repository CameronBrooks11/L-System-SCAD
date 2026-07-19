use <../l_systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "hilbert_curve_3d"; // [hilbert_curve_3d, abop_bush, whorl_tree, coral_3d, hilbert_curve_tube, dragon_curve_tube]

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
