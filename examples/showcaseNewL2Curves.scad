use <../curves.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "square_fractal";
// Options:
// "minkowski_curve",
// "vicsek_fractal",
// "koch_island",
// "fractal_vine",
// "spiral_curve",
// "hexagonal_spiral",
// "square_fractal";

// ================================
// Curve Selection Logic
// ================================

module select_curve()
{
    if (selected_curve == "minkowski_curve")
    {
        minkowski_curve(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
    }
    else if (selected_curve == "vicsek_fractal")
    {
        vicsek_fractal(n = 3, angle = 90, w = 0.4); // Recommended n <= 5
    }
    else if (selected_curve == "koch_island")
    {
        koch_island(n = 4, angle = 60, w = 0.4); // Recommended n <= 5
    }
    else if (selected_curve == "fractal_vine")
    {
        fractal_vine(n = 5, angle = 25, w = 0.2); // Recommended n <= 7
    }
    else if (selected_curve == "spiral_curve")
    {
        spiral_curve(n = 5, angle = 30, w = 0.3); // Recommended n <= 8
    }
    else if (selected_curve == "hexagonal_spiral")
    {
        hexagonal_spiral(n = 6, angle = 60, w = 0.3); // Recommended n <= 6
    }
    else if (selected_curve == "square_fractal")
    {
        square_fractal(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
    }
    else
    {
        echo("Selected curve is not defined.");
    }
}

// Invoke the selected curve
select_curve();
