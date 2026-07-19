use <../l_systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "fractal_var1"; // [koch_snowflake, segment_x, gosper_variation_tree, koch_snowflake_variant, square_sierpinski, x_border_joined_cross_curves, jaggy_cross, triangles_var6, fractal_var1]

// ================================
// Curve Selection Logic
// ================================

if (selected_curve == "koch_snowflake")
{
    L_System2D(koch_snowflake(), n = 5); // Recommended n <= 8
}
else if (selected_curve == "segment_x")
{
    L_System2D(segment_x(), n = 2); // Recommended n <= 3
}
else if (selected_curve == "gosper_variation_tree")
{
    L_System2D(gosper_variation_tree(), n = 3); // Recommended n <= 4
}
else if (selected_curve == "koch_snowflake_variant")
{
    L_System2D(koch_snowflake_variant(), n = 3); // Recommended n <= 8
}
else if (selected_curve == "square_sierpinski")
{
    L_System2D(square_sierpinski(), n = 3); // Recommended n <= 8
}
else if (selected_curve == "x_border_joined_cross_curves")
{
    L_System2D(x_border_joined_cross_curves(), n = 3); // Recommended n <= 6
}
else if (selected_curve == "jaggy_cross")
{
    L_System2D(jaggy_cross(), n = 4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var6")
{
    L_System2D(triangles_var6(), n = 2); // Recommended n <= 6
}
else if (selected_curve == "fractal_var1")
{
    L_System2D(fractal_var1(), n = 5); // Recommended n <= 10
}
else
{
    echo("Selected curve is not defined.");
}