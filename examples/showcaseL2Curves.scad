use <../curves.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "koch_curve";
// Options:
// "dragon_curve",
// "dragon_curve_pentagonal",
// "dragon_curve_hexagonal",
// "twin_dragon",
// "terdragon",
// "hilbert_curve",
// "moore_curve",
// "peano_curve",
// "gosper_curve",
// "levy_c_curve",
// "koch_curve",
// "koch_curve_animated",
// "quadratic_type1_koch",
// "quadratic_type2_koch",
// "sierpinski_triangle",
// "sierpinski_arrowhead",
// "island_curve",
// "penrose_tiling",
// "pentadendrite",
// "icy",
// "tree",
// "round_star",
// "fractal_plant";

// ================================
// Curve Selection Logic
// ================================

module select_curve()
{
    if (selected_curve == "dragon_curve")
    {
        dragon_curve(n = 14); // Recommended n <= 18
    }
    else if (selected_curve == "dragon_curve_pentagonal")
    {
        dragon_curve(n = 14, angle = 72); // "Pentagonal Dragon"
    }
    else if (selected_curve == "dragon_curve_hexagonal")
    {
        dragon_curve(n = 14, angle = 60); // Hexagonal Dragon
    }
    else if (selected_curve == "twin_dragon")
    {
        twin_dragon(n = 12); // Recommended n <= 17
    }
    else if (selected_curve == "terdragon")
    {
        terdragon(n = 5, w = 0.1); // Recommended n <= 11
    }
    else if (selected_curve == "hilbert_curve")
    {
        hilbert_curve(n = 4, w = 0.5); // Recommended n <= 9
    }
    else if (selected_curve == "moore_curve")
    {
        moore_curve(n = 3, w = 0.5); // Recommended n <= 8
    }
    else if (selected_curve == "peano_curve")
    {
        peano_curve(n = 3); // Recommended n <= 6
    }
    else if (selected_curve == "gosper_curve")
    {
        gosper_curve(n = 3); // Recommended n <= 6
    }
    else if (selected_curve == "levy_c_curve")
    {
        levy_c_curve(n = 9); // Recommended n <= 17
    }
    else if (selected_curve == "koch_curve")
    {
        koch_curve(n = 6, angle = 80, w = 0.2); // Recommended n <= 6 (try different angles: 60,80,90)
    }
    else if (selected_curve == "koch_curve_animated")
    {
        koch_curve(n = 4, angle = 75 + 15 * sin($t * 360), w = 0.2); // Enable animation!!
    }
    else if (selected_curve == "quadratic_type1_koch")
    {
        quadratic_type1_koch(n = 4); // Recommended n <= 8
    }
    else if (selected_curve == "quadratic_type2_koch")
    {
        quadratic_type2_koch(n = 3); // Recommended n <= 6
    }
    else if (selected_curve == "sierpinski_triangle")
    {
        sierpinski_triangle(n = 6, angle = 120, w = 0.2); // Recommended n <= 11
    }
    else if (selected_curve == "sierpinski_arrowhead")
    {
        sierpinski_arrowhead(n = 6, angle = 60, w = 0.4); // Recommended n <= 11
    }
    else if (selected_curve == "island_curve")
    {
        island_curve(n = 2, angle = 90, w = 0.4); // Recommended n <= 4
    }
    else if (selected_curve == "penrose_tiling")
    {
        penrose_tiling(n = 4, angle = 36, w = 0.2); // Recommended n <= 6
    }
    else if (selected_curve == "pentadendrite")
    {
        pentadendrite(n = 4, angle = 72, w = 0.2); // Recommended n <= 5
    }
    else if (selected_curve == "icy")
    {
        icy(n = 4, angle = 90, w = 0.5);
    }
    else if (selected_curve == "tree")
    {
        tree(n = 4, angle = 36, w = 0.1);
    }
    else if (selected_curve == "round_star")
    {
        scale([ 100, 100, 1 ]) round_star(n = 8, angle = 77, w = 0.001);
    }
    else if (selected_curve == "fractal_plant")
    {
        fractal_plant(n = 6, angle = 35, w = 0.1); // Recommended n <= 8
    }
    else
    {
        echo("Selected curve is not defined.");
    }
}

// Invoke the selected curve
select_curve();