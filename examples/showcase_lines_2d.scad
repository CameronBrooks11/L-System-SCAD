use <../l_systems.scad>;

// ================================
// Configuration: Select Your Curve
// ================================

selected_curve = "moore_square";

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
// "minkowski_curve",
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
    L_System2D(dragon_curve(), n = 12); // Recommended n <= 18
}
else if (selected_curve == "dragon_curve_pentagonal")
{
    L_System2D(dragon_curve(), n = 12, angle = 72); // "Pentagonal Dragon"
}
else if (selected_curve == "dragon_curve_hexagonal")
{
    L_System2D(dragon_curve(), n = 12, angle = 60); // Hexagonal Dragon
}
else if (selected_curve == "twin_dragon")
{
    L_System2D(twin_dragon(), n = 12); // Recommended n <= 17
}
else if (selected_curve == "terdragon")
{
    L_System2D(terdragon(), n = 5, w = 0.1); // Recommended n <= 11
}
else if (selected_curve == "hilbert_curve")
{
    L_System2D(hilbert_curve(), n = 4, w = 0.5); // Recommended n <= 9
}
else if (selected_curve == "moore_square")
{
    L_System2D(moore_square(), n = 3, w = 0.5); // Recommended n <= 8
}
else if (selected_curve == "peano_curve")
{
    L_System2D(peano_curve(), n = 3); // Recommended n <= 6
}
else if (selected_curve == "gosper_curve")
{
    L_System2D(gosper_curve(), n = 3); // Recommended n <= 6
}
else if (selected_curve == "levy_c_curve")
{
    L_System2D(levy_c_curve(), n = 9); // Recommended n <= 17
}
else if (selected_curve == "koch_curve")
{
    L_System2D(koch_curve(), n = 6, angle = 80, w = 0.2); // Recommended n <= 6 (try different angles: 60,80,90)
}
else if (selected_curve == "koch_curve_animated")
{
    L_System2D(koch_curve(), n = 4, angle = 75 + 15 * sin($t * 360), w = 0.2); // Enable animation!!
}
else if (selected_curve == "quadratic_type1_koch")
{
    L_System2D(quadratic_type1_koch(), n = 4); // Recommended n <= 8
}
else if (selected_curve == "quadratic_type2_koch")
{
    L_System2D(quadratic_type2_koch(), n = 3); // Recommended n <= 6
}
else if (selected_curve == "quadratic_fractal1")
{
    L_System2D(quadratic_fractal1(), n = 2); // Recommended n <= 5
}
else if (selected_curve == "quadratic_fractal2")
{
    L_System2D(quadratic_fractal2(), n = 2); // Recommended n <= 5
}
else if (selected_curve == "quadratic_fractal3")
{
    L_System2D(quadratic_fractal3(), n = 2); // Recommended n <= 5
}
else if (selected_curve == "sierpinski_triangle")
{
    L_System2D(sierpinski_triangle(), n = 6, angle = 120, w = 0.2); // Recommended n <= 11
}
else if (selected_curve == "sierpinski_arrowhead")
{
    L_System2D(sierpinski_arrowhead(), n = 6, angle = 60, w = 0.4); // Recommended n <= 11
}
else if (selected_curve == "island_curve")
{
    L_System2D(island_curve(), n = 2, angle = 90, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "penrose_tiling")
{
    L_System2D(penrose_tiling(), n = 4, angle = 36, w = 0.2); // Recommended n <= 6
}
else if (selected_curve == "pentadendrite")
{
    L_System2D(pentadendrite(), n = 4, angle = 72, w = 0.2); // Recommended n <= 5
}
else if (selected_curve == "icy")
{
    L_System2D(icy(), n = 4, angle = 90, w = 0.5); // Recommended n <= 6
}
else if (selected_curve == "tree") // Recommended n <= 5
{
    L_System2D(tree(), n = 4, angle = 36, w = 0.1); // Recommended n <= 6
}
else if (selected_curve == "round_star")
{
    scale([ 100, 100, 1 ]) L_System2D(round_star(), n = 8, angle = 77, w = 0.001);
}
else if (selected_curve == "fractal_plant")
{
    L_System2D(fractal_plant(), n = 6, angle = 35, w = 0.1); // Recommended n <= 8
}
if (selected_curve == "minkowski_curve")
{
    L_System2D(minkowski_curve(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "vicsek_fractal")
{
    L_System2D(vicsek_fractal(), n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "koch_island")
{
    L_System2D(koch_island(), n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "fractal_vine")
{
    L_System2D(fractal_vine(), n = 5, angle = 25, w = 0.2); // Recommended n <= 7
}
else if (selected_curve == "spiral_curve")
{
    L_System2D(spiral_curve(), n = 5, angle = 30, w = 0.3); // Recommended n <= 8
}
else if (selected_curve == "hexagonal_spiral")
{
    L_System2D(hexagonal_spiral(), n = 6, angle = 60, w = 0.3); // Recommended n <= 6
}
else if (selected_curve == "square_fractal")
{
    L_System2D(square_fractal(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "segment_curve")
{
    L_System2D(segment_curve(), n = 2, angle = 90, w = 0.4); // Recommended n <= 2, max 3
}
else if (selected_curve == "cesaro_sweep")
{
    L_System2D(cesaro_sweep(), n = 4, angle = 85, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cesaro_carpet")
{
    L_System2D(cesaro_carpet(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "icy_fractal")
{
    L_System2D(icy(), n = 3, angle = 90, w = 0.5); // Recommended n <= 6
}
else if (selected_curve == "heighways_dragon")
{
    L_System2D(heighways_dragon(), n = 8, angle = 90, w = 0.4); // Recommended n <= 18
}
else if (selected_curve == "polya_sweep")
{
    L_System2D(polya_sweep(), n = 8, angle = 90, w = 0.4); // Recommended n <= 18
}
else if (selected_curve == "hexagonal_dragon")
{
    L_System2D(hexagonal_dragon(), n = 5, angle = 60, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "hexagonal_dragon_estrela")
{
    L_System2D(hexagonal_dragon_estrela(), n = 7, angle = 60, w = 0.4); // Recommended n <= 12
}
else if (selected_curve == "twin_dragon")
{
    L_System2D(twin_dragon(), n = 8, angle = 90, w = 0.4); // Recommended n <= 14
}
else if (selected_curve == "terdragon")
{
    L_System2D(terdragon(), n = 5, angle = 120, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "inverted_terdragon")
{
    L_System2D(inverted_terdragon(), n = 2, angle = 120, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "mandelbrot_quartet")
{
    L_System2D(mandelbrot_quartet(), n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "hilbert_curve")
{
    L_System2D(hilbert_curve(), n = 5, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "peano_curve")
{
    L_System2D(peano_curve(), n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "gosper_curve")
{
    L_System2D(gosper_curve(), n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "inner_flip_gosper_curve")
{
    L_System2D(inner_flip_gosper_curve(), n = 3, angle = 60, w = 0.4); // Recommended n <= 3
}
else if (selected_curve == "gosper_curve_tree")
{
    L_System2D(gosper_curve_tree(), n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "gosper_curve_tree")
{
    L_System2D(gosper_curve_tree(), n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
// Add more curves here
else if (selected_curve == "gosper_hex")
{
    L_System2D(gosper_hex(), n = 4, angle = 30, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "quadratic_gosper")
{
    L_System2D(quadratic_gosper(), n = 2, angle = 90, w = 0.4); // Recommended n <= 3
}
else if (selected_curve == "gosper_variation")
{
    L_System2D(gosper_variation(), n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "koch_snowflake_inverted")
{
    L_System2D(koch_snowflake_inverted(), n = 2, angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "reflected_koch")
{
    L_System2D(reflected_koch(), n = 3, angle = 60, w = 0.4); // Recommended n <= 14
}
else if (selected_curve == "sierpinski_arrowhead_hexagon")
{
    L_System2D(sierpinski_arrowhead_hexagon(n = 5), angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "sierpinski_arrowhead_star")
{
    L_System2D(sierpinski_arrowhead_star(n = 4), angle = 60, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "lace")
{
    L_System2D(lace(), n = 6, angle = 30, w = 0.4); // Recommended n <= 11
}
else if (selected_curve == "lace_triangle")
{
    L_System2D(lace_triangle(), n = 5, angle = 30, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "peano_curve")
{
    L_System2D(peano_curve(), n = 2, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "peano_round_corners")
{
    L_System2D(peano_round_corners(), n = 3, angle = 45, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "krishna")
{
    L_System2D(krishna(), n = 4, angle = 45, w = 0.4); // Recommended n <= 8
}
else if (selected_curve == "carpet3")
{
    L_System2D(carpet3(), n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "carpet5")
{
    L_System2D(carpet5(), n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "pentaplexity")
{
    L_System2D(pentaplexity(), n = 4, angle = 36, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "mcworters_pentigree")
{
    L_System2D(mcworters_pentigree(), n = 4, angle = 36, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "x_border_cross_curves")
{
    L_System2D(x_border_cross_curves(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "moore_curve")
{
    L_System2D(moore_curve(), n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "pajarita")
{
    L_System2D(pajarita(), n = 5, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "four_point_stars")
{
    L_System2D(four_point_stars(), n = 4, angle = 45, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cross2")
{
    L_System2D(cross2(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "cross3")
{
    L_System2D(cross3(), n = 3, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "mango_leaf")
{
    L_System2D(mango_leaf(), n = 64, angle = 60, w = 0.4); // Recommended n <= 64
}
else if (selected_curve == "maple_leaf")
{
    L_System2D(maple_leaf(), n = 4, angle = 60, w = 0.2); // Recommended n <= 5
}
else if (selected_curve == "maple_leaf2")
{
    L_System2D(maple_leaf2(), n = 3, angle = 60, w = 0.2); // Recommended n <= 4
}
else if (selected_curve == "rose_triangles")
{
    L_System2D(rose_triangles(), n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "hexagons")
{
    L_System2D(hexagons(), n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "hexagon_star")
{
    L_System2D(hexagon_star(), n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var3")
{
    L_System2D(triangles_var3(), n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var4")
{
    L_System2D(triangles_var4(), n = 4, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "dragon_root")
{
    L_System2D(dragon_root(), n = 4, angle = 90, w = 0.4); // Recommended n <= 10
}
else if (selected_curve == "pinched_dragon_root")
{
    L_System2D(pinched_dragon_root(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "crazy_dragon")
{
    L_System2D(crazy_dragon(), n = 4, angle = 90, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "pinched_dragon_root")
{
    L_System2D(pinched_dragon_root(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "crazy_dragon")
{
    L_System2D(crazy_dragon(), n = 4, angle = 90, w = 0.4); // Recommended n <= 7
}
else if (selected_curve == "pine_dragon")
{
    L_System2D(pine_dragon(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "trefoil_knots")
{
    L_System2D(trefoil_knots(), n = 5, angle = 60, w = 0.4); // Recommended n <= 9
}
else if (selected_curve == "brain_dragon")
{
    L_System2D(brain_dragon(), n = 4, angle = 90, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangular_grid")
{
    L_System2D(triangular_grid(), n = 4, angle = 60, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "triangles_var5")
{
    L_System2D(triangles_var5(), n = 3, angle = 60, w = 0.2); // Recommended n <= 5
}
else if (selected_curve == "octagons")
{
    L_System2D(octagons(), n = 5, angle = 45, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var1")
{
    L_System2D(triangles_var1(), n = 3, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "triangles_var2")
{
    L_System2D(triangles_var2(), n = 3, angle = 60, w = 0.4); // Recommended n <= 6
}
else if (selected_curve == "peano_gosper")
{
    L_System2D(peano_gosper(), n = 2, angle = 90, w = 0.4); // Recommended n <= 5
}
else if (selected_curve == "gosper_tri")
{
    L_System2D(gosper_tri(), n = 3, angle = 60, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "dragon_lobes")
{
    L_System2D(dragon_lobes(), n = 9, angle = 45, w = 0.4); // Recommended n <= 12
}
else if (selected_curve == "carpet6")
{
    L_System2D(carpet6(), n = 3, angle = 90, w = 0.4); // Recommended n <= 4
}
else if (selected_curve == "peano_variation1")
{
    L_System2D(peano_variation1(), n = 3, angle = 90, w = 0.4); // Recommended n <= 5
}
else
{
    echo("Selected curve is not defined.");
}