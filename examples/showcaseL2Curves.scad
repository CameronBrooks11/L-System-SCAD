use <../L-Systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "dragon_curve";

// Options:
// "dragon_curve",
// "dragon_curve_pentagonal",
// "dragon_curve_hexagonal",
// "twin_dragon",
// "terdragon",
// "hilbert_curve",
// "moore_square",
// "peano_curve",
// "gosper_curve",
// "levy_c_curve",
// "koch_curve",
// "koch_curve_animated",
// "quadratic_type1_koch",
// "quadratic_type2_koch",
// "quadratic_fractal1",
// "quadratic_fractal2",
// "quadratic_fractal3"
// "sierpinski_triangle",
// "sierpinski_arrowhead",
// "island_curve",
// "penrose_tiling",
// "pentadendrite",
// "icy",
// "tree",
// "round_star",
// "fractal_plant",
// "minkowski",
// "vicsek_fractal",
// "koch_island",
// "fractal_vine",
// "spiral_curve",
// "hexagonal_spiral",
// "square_fractal",
// "segment_curve",
// "cesaro_sweep",
// "cesaro_carpet",
// "icy_fractal"
// "heighways_dragon",
// "polya_sweep",
// "hexagonal_dragon",
// "hexagonal_dragon_estrela",
// "twin_dragon",
// "terdragon",
// "inverted_terdragon",
// "mandelbrot_quartet",
// "hilbert_curve",
// "peano_curve",
// "gosper_curve",
// "inner_flip_gosper_curve",
// "gosper_curve_tree"
// "gosper_hex",
// "quadratic_gosper",
// "gosper_variation",
// "koch_snowflake_inverted",
// "reflected_koch",
// "sierpinski_arrowhead_hexagon",
// "sierpinski_arrowhead_star",
// "lace"
// "lace_triangle",
// "peano_curve",
// "peano_round_corners",
// "krishna",
// "carpet3",
// "carpet5",
// "pentaplexity",
// "mcworters_pentigree",
// "a_bush",
// "x_border_cross_curves",
// "moore_curve",
// "pajarita"
// "four_point_stars",
// "cross2",
// "cross3",
// "mango_leaf",
// "maple_leaf",
// "maple_leaf2",
// "rose_triangles",
// "hexagons",
// "hexagon_star",
// "triangles_var3",
// "triangles_var4",
// "dragon_root",
// "pinched_dragon_root",
// "crazy_dragon"
// "pine_dragon",
// "trefoil_knots",
// "brain_dragon",
// "triangular_grid",
// "triangles_var5",
// "octagons",
// "triangles_var1",
// "triangles_var2"
// "peano_gosper",
// "gosper_tri",
// "dragon_lobes",
// "carpet6",
// "peano_variation1"

// ================================
// Curve Selection Logic
// ================================
if (selected_curve == "dragon_curve")
{
    dragon_curve(n = 12); // Recommended n <= 18
}
else if (selected_curve == "dragon_curve_pentagonal")
{
    dragon_curve(n = 12, angle = 72); // "Pentagonal Dragon"
}
else if (selected_curve == "dragon_curve_hexagonal")
{
    dragon_curve(n = 12, angle = 60); // Hexagonal Dragon
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
else if (selected_curve == "moore_square")
{
    moore_square(n = 3, w = 0.5); // Recommended n <= 8
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
else if (selected_curve == "quadratic_fractal1")
{
    quadratic_fractal1(n = 2); // Recommended n <= 5
}
else if (selected_curve == "quadratic_fractal2")
{
    quadratic_fractal2(n = 2); // Recommended n <= 5
}
else if (selected_curve == "quadratic_fractal3")
{
    quadratic_fractal3(n = 2); // Recommended n <= 5
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
    icy(n = 4, angle = 90, w = 0.5); // Recommended n <= 6
}
else if (selected_curve == "tree") // Recommended n <= 5
{
    tree(n = 4, angle = 36, w = 0.1); // Recommended n <= 6
}
else if (selected_curve == "round_star")
{
    scale([ 100, 100, 1 ]) round_star(n = 8, angle = 77, w = 0.001);
}
else if (selected_curve == "fractal_plant")
{
    fractal_plant(n = 6, angle = 35, w = 0.1); // Recommended n <= 8
}
if (selected_curve == "minkowski")
{
    minkowski(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
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
else if (selected_curve == "segment_curve")
{
    segment_curve(n = 2, angle = 90, w = 0.4); // Recommended n <= 2, max 3
}
else if (selected_curve == "cesaro_sweep")
{
    cesaro_sweep(n = 4, angle = 85, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cesaro_carpet")
{
    cesaro_carpet(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "icy_fractal")
{
    icy(n = 3, angle = 90, w = 0.5); // Recommended n <= 6
}
else if (selected_curve == "heighways_dragon")
{
    heighways_dragon(n = 8, angle = 90, w = 0.4); // Recommended n <= 18
}
else if (selected_curve == "polya_sweep")
{
    polya_sweep(n = 8, angle = 90, w = 0.4); // Recommended n <= 18
}
else if (selected_curve == "hexagonal_dragon")
{
    hexagonal_dragon(n = 5, angle = 60, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "hexagonal_dragon_estrela")
{
    hexagonal_dragon_estrela(n = 7, angle = 60, w = 0.4); // Recommended n <= 12
}
else if (selected_curve == "twin_dragon")
{
    twin_dragon(n = 8, angle = 90, w = 0.4); // Recommended n <= 14
}
else if (selected_curve == "terdragon")
{
    terdragon(n = 5, angle = 120, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "inverted_terdragon")
{
    inverted_terdragon(n = 2, angle = 120, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "mandelbrot_quartet")
{
    mandelbrot_quartet(n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "hilbert_curve")
{
    hilbert_curve(n = 5, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "peano_curve")
{
    peano_curve(n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "gosper_curve")
{
    gosper_curve(n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "inner_flip_gosper_curve")
{
    inner_flip_gosper_curve(n = 3, angle = 60, w = 0.4); // Recommended n <= 3
}
else if (selected_curve == "gosper_curve_tree")
{
    gosper_curve_tree(n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "gosper_curve_tree")
{
    gosper_curve_tree(n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
// Add more curves here
else if (selected_curve == "gosper_hex")
{
    gosper_hex(n = 4, angle = 30, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "quadratic_gosper")
{
    quadratic_gosper(n = 2, angle = 90, w = 0.4); // Recommended n <= 3
}
else if (selected_curve == "gosper_variation")
{
    gosper_variation(n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "koch_snowflake_inverted")
{
    koch_snowflake_inverted(n = 2, angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "reflected_koch")
{
    reflected_koch(n = 3, angle = 60, w = 0.4); // Recommended n <= 14
}
else if (selected_curve == "sierpinski_arrowhead_hexagon")
{
    sierpinski_arrowhead_hexagon(n = 5, angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "sierpinski_arrowhead_star")
{
    sierpinski_arrowhead_star(n = 4, angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "lace")
{
    lace(n = 6, angle = 30, w = 0.4); // Recommended n <= 11
}
else if (selected_curve == "lace_triangle")
{
    lace_triangle(n = 5, angle = 30, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "peano_curve")
{
    peano_curve(n = 2, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "peano_round_corners")
{
    peano_round_corners(n = 3, angle = 45, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "krishna")
{
    krishna(n = 4, angle = 45, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "carpet3")
{
    carpet3(n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "carpet5")
{
    carpet5(n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "pentaplexity")
{
    pentaplexity(n = 4, angle = 36, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "mcworters_pentigree")
{
    mcworters_pentigree(n = 4, angle = 36, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "a_bush")
{
    a_bush(n = 2, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "x_border_cross_curves")
{
    x_border_cross_curves(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "moore_curve")
{
    moore_curve(n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "pajarita")
{
    pajarita(n = 5, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "four_point_stars")
{
    four_point_stars(n = 4, angle = 45, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cross2")
{
    cross2(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cross3")
{
    cross3(n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "mango_leaf")
{
    mango_leaf(n = 64, angle = 60, w = 0.4); // Recommended n <= 64
}
else if (selected_curve == "maple_leaf")
{
    maple_leaf(n = 4, angle = 60, w = 0.2); // Recommended n <= 5
}
else if (selected_curve == "maple_leaf2")
{
    maple_leaf2(n = 3, angle = 60, w = 0.2); // Recommended n <= 4
}
else if (selected_curve == "rose_triangles")
{
    rose_triangles(n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "hexagons")
{
    hexagons(n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "hexagon_star")
{
    hexagon_star(n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var3")
{
    triangles_var3(n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var4")
{
    triangles_var4(n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "dragon_root")
{
    dragon_root(n = 4, angle = 90, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "pinched_dragon_root")
{
    pinched_dragon_root(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "crazy_dragon")
{
    crazy_dragon(n = 4, angle = 90, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "pinched_dragon_root")
{
    pinched_dragon_root(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "crazy_dragon")
{
    crazy_dragon(n = 4, angle = 90, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "pine_dragon")
{
    pine_dragon(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "trefoil_knots")
{
    trefoil_knots(n = 5, angle = 60, w = 0.4); // Recommended n <= 9
}
else if (selected_curve == "brain_dragon")
{
    brain_dragon(n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangular_grid")
{
    triangular_grid(n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "triangles_var5")
{
    triangles_var5(n = 3, angle = 60, w = 0.2); // Recommended n <= 5
}
else if (selected_curve == "octagons")
{
    octagons(n = 5, angle = 45, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var1")
{
    triangles_var1(n = 3, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var2")
{
    triangles_var2(n = 3, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "peano_gosper")
{
    peano_gosper(n = 2, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "gosper_tri")
{
    gosper_tri(n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "dragon_lobes")
{
    dragon_lobes(n = 9, angle = 45, w = 0.4); // Recommended n <= 12
}
else if (selected_curve == "carpet6")
{
    carpet6(n = 3, angle = 90, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "peano_variation1")
{
    peano_variation1(n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else
{
    echo("Selected curve is not defined.");
}