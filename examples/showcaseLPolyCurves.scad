use <../L-Systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "fractal_var1"; // Change this to test different curves

// Options:
// "koch_snowflake",
// "segment_x",
// "gosper_variation_tree",
// "koch_snowflake_variant",
// "square_sierpinski",
// "square_sierpinski",
// "x_border_joined_cross_curves",
// "jaggy_cross",
// "triangles_var6",
// "fractal_var1"

// ================================
// Curve Selection Logic
// ================================

if (selected_curve == "koch_snowflake")
{
    koch_snowflake(n = 5); // Recommended n <= 8
}
else if (selected_curve == "segment_x")
{
    segment_x(n = 2); // Recommended n <= 3
}
else if (selected_curve == "gosper_variation_tree")
{
    gosper_variation_tree(n = 3); // Recommended n <= 4
}
else if (selected_curve == "koch_snowflake_variant")
{
    koch_snowflake_variant(n = 3); // Recommended n <= 8
}
else if (selected_curve == "square_sierpinski")
{
    square_sierpinski(n = 3); // Recommended n <= 8
}
else if (selected_curve == "square_sierpinski")
{
    square_sierpinski(n = 9); // Recommended n <= 14
}
else if (selected_curve == "x_border_joined_cross_curves")
{
    x_border_joined_cross_curves(n = 3); // Recommended n <= 6
}
else if (selected_curve == "jaggy_cross")
{
    jaggy_cross(n = 4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var6")
{
    triangles_var6(n = 2); // Recommended n <= 6
}
else if (selected_curve == "fractal_var1")
{
    fractal_var1(n = 5); // Recommended n <= 10
}
else
{
    echo("Selected curve is not defined.");
}