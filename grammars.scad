// Predefined L-system grammar catalog: pure data, zero dependencies.
// Each curve is a function returning [axiom, rules, params] where params is a
// list of [key, value] pairs holding the curve's curated defaults ("angle",
// "n", and where non-default: "w", "draw_chars", "move_chars", "heading",
// "poly"). Pass the tuple straight to L_System2D: L_System2D(dragon_curve());
// explicit arguments override the tuple's params. [0]/[1] remain axiom/rules.

// ================================
// Line Curves
// ================================

// Dragon Curve
function dragon_curve() = let(
    axiom = "FX",
    rules = [ "X=X+YF+", "Y=-FX-Y" ],
    params = [ [ "angle", 90 ], [ "n", 10 ] ]
) [axiom, rules, params];

// Moore Curve
function moore_square() = let(
    axiom = "LFL+F+LFL",
    rules = [ "L=-RF+LFL+FR-", "R=+LF-RFR-FL+" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Levy C Curve
function levy_c_curve() = let(
    axiom = "F",
    rules = ["F=+F--F+"],
    params = [ [ "angle", 45 ], [ "n", 10 ] ]
) [axiom, rules, params];

// Koch Curve
function koch_curve() = let(
    axiom = "F",
    rules = ["F=F-F++F-F"],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Quadratic Type 1 Koch
function quadratic_type1_koch() = let(
    axiom = "F",
    rules = ["F=F-F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Quadratic Type 2 Koch
function quadratic_type2_koch() = let(
    axiom = "F",
    rules = ["F=F-F+F+FF-F-F+F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Quadratic Fractal 1, src: 100hex
function quadratic_fractal1() = let(
    axiom = "F+F+F+F",
    rules = ["F=F+F-F-FFF+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ], [ "w", 1.6 ] ]
) [axiom, rules, params];
// Quadratic Fractal 2, src: 100hex
function quadratic_fractal2() = let(
    axiom = "F+F+F+F",
    rules = ["F=F+FF-F-FF+F-FF+F+FF-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ], [ "w", 1.21 ] ]
) [axiom, rules, params];

// Quadratic Fractal 3, src: 100hex
function quadratic_fractal3() = let(
    axiom = "F+F+F+F",
    rules = ["F=F-FF+FF+F+F-F-FF+F+F-F-FF-FF+F"],
    params = [ [ "angle", 90 ], [ "n", 2 ], [ "w", 1.21 ] ]
) [axiom, rules, params];

// Sierpinski Triangle
function sierpinski_triangle() = let(
    axiom = "F-G-G",
    rules = [ "F=F-G+F+G-F", "G=GG" ],
    params = [ [ "angle", 120 ], [ "n", 5 ], [ "w", 0.2 ], [ "draw_chars", "FG" ] ]
) [axiom, rules, params];

// Island Curve
function island_curve() = let(
    axiom = "F-F-F-F",
    rules = [ "F=F-b+FF-F-FF-Fb-FF+b-FF+F+FF+Fb+FFF", "b=bbbbbb" ],
    params = [ [ "angle", 90 ], [ "n", 10 ], [ "move_chars", "b" ] ]
) [axiom, rules, params];

// Penrose Tiling
function penrose_tiling() = let(
    axiom = "[7]++[7]++[7]++[7]++[7]",
    rules =
        [
            "6=81++91----71[-81----61]++", "7=+81--91[---61--71]+", "8=-61++71[+++81++91]-",
            "9=--81++++61[+91++++71]--71",
            "1="
        ],
    params = [ [ "angle", 36 ], [ "n", 2 ], [ "w", 0.2 ], [ "draw_chars", "6789" ] ]
) [axiom, rules, params];

// Icy Pattern
function icy() = let(
    axiom = "F+F+F+F",
    rules = ["F=FF+F++F+F"],
    params = [ [ "angle", 90 ], [ "n", 2 ], [ "w", 0.5 ] ]
) [axiom, rules, params];

// Tree
function tree() = let(
    axiom = "F",
    rules = ["F=F[+FF][-FF]F[-F][+F]F"],
    params = [ [ "angle", 36 ], [ "n", 2 ], [ "w", 0.1 ], [ "move_chars", "F" ], [ "heading", 90 ] ]
) [axiom, rules, params];

// Round Star
function round_star() = let(
    axiom = "F",
    rules = ["F=F++F"],
    params = [ [ "angle", 77 ], [ "n", 7 ], [ "w", 0.001 ] ]
) [axiom, rules, params];
// Fractal Plant
function fractal_plant() = let(
    axiom = "X",
    rules = [ "X=F+[[X]-X]-F[-FX]+X", "F=FF" ],
    params = [ [ "angle", 25 ], [ "n", 4 ], [ "w", 0.1 ], [ "draw_chars", "FX" ] ]
) [axiom, rules, params];

// Minkowski Curve
function minkowski_curve() = let(
    axiom = "F+F+F+F",
    rules = ["F=F+F-F-F+F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Vicsek Fractal
function vicsek_fractal() = let(
    axiom = "F",
    rules = ["F=F-F+F+FF-F-F+F"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Koch Island
function koch_island() = let(
    axiom = "F++F++F++F",
    rules = ["F=F-F++F-F"],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Fractal Vine
function fractal_vine() = let(
    axiom = "F",
    rules = ["F=F[+F]F[-F]F"],
    params = [ [ "angle", 25 ], [ "n", 5 ], [ "w", 0.2 ], [ "move_chars", "F" ] ]
) [axiom, rules, params];

// Spiral Curve
function spiral_curve() = let(
    axiom = "F",
    rules = ["F=F+F-F"],
    params = [ [ "angle", 30 ], [ "n", 5 ], [ "w", 0.3 ] ]
) [axiom, rules, params];

// Hexagonal Spiral
function hexagonal_spiral() = let(
    axiom = "F",
    rules = ["F=F+F-F"],
    params = [ [ "angle", 60 ], [ "n", 6 ], [ "w", 0.3 ] ]
) [axiom, rules, params];

// Square Fractal
function square_fractal() = let(
    axiom = "F+F+F+F",
    rules = ["F=F+F-F-F+F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Segment Curve 1, src: 100hex
function segment_curve() = let(
    axiom = "F",
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Segment Curve 2, src: 100hex
function segment_curve_2() = let(
    axiom = "F-F-F-F",
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Cesaro Sweep Variant, src: 100hex
function cesaro_sweep() = let(
    axiom = "F",
    rules = ["F=F+F--F+F"],
    params = [ [ "angle", 80 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Cesaro Carpet, src: 100hex
function cesaro_carpet() = let(
    axiom = "X+X+X+X",
    rules = ["X=FXF+FXF--FXF+FXF"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Icy Fractal, src: 100hex
function icy_fractal() = let(
    axiom = "F-F-F-F",
    rules = ["F=FF-F--F-F"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Heighway's Dragon Curve, src: 100hex
function heighways_dragon() = let(
    axiom = "FX",
    rules = [ "X=X+YF+", "Y=-FX-Y" ],
    params = [ [ "angle", 90 ], [ "n", 8 ] ]
) [axiom, rules, params];

// Polya Sweep, src: 100hex
function polya_sweep() = let(
    axiom = "X",
    rules = [ "X=+FX-FY-", "Y=-FX+FY+", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 8 ] ]
) [axiom, rules, params];

// Hexagonal Dragon, src: 100hex
function hexagonal_dragon() = let(
    axiom = "X-X-X-X-X-X",
    rules = [ "X=X+YF+", "Y=-FX-Y" ],
    params = [ [ "angle", 60 ], [ "n", 5 ] ]
) [axiom, rules, params];
// Hexagonal Dragon Estrela, src: 100hex
function hexagonal_dragon_estrela() = let(
    axiom = "Z-Z-Z--Z-Z-Z",
    rules = [ "X=X+YF+", "Y=-FX-Y", "Z=FX+FX" ],
    params = [ [ "angle", 60 ], [ "n", 7 ] ]
) [axiom, rules, params];

// Twin Dragon, src: 100hex
function twin_dragon() = let(
    axiom = "FX+FX+",
    rules = [ "X=X+YF", "Y=FX-Y" ],
    params = [ [ "angle", 90 ], [ "n", 8 ] ]
) [axiom, rules, params];

// Terdragon, src: 100hex
function terdragon() = let(
    axiom = "F",
    rules = ["F=F+F-F"],
    params = [ [ "angle", 120 ], [ "n", 5 ] ]
) [axiom, rules, params];

// Inverted Terdragon, src: 100hex
function inverted_terdragon() = let(
    axiom = "F",
    rules = ["F=F-F+F + F-F+F - F-F+F"],
    params = [ [ "angle", 120 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Mandelbrot Quartet - Root 5, src: 100hex
function mandelbrot_quartet() = let(
    axiom = "+X",
    rules = [ "X=-FYFX+FX+FY-FX", "Y=FY+FX-FY-FYFX+", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Hilbert Curve, src: 100hex
function hilbert_curve() = let(
    axiom = "X",
    rules = [ "X=-YF+XFX+FY-", "Y=+XF-YFY-FX+" ],
    params = [ [ "angle", 90 ], [ "n", 5 ] ]
) [axiom, rules, params];

// Moore Curve, src: 100hex
function moore_square2() = let(
    axiom = "F-XFX-F-XFX",
    rules = [ "X=+YF-XFX-FY+", "Y=-XF+YFY+FX-" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Gosper Curve, src: 100hex
function gosper_curve() = let(
    axiom = "X",
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Inner-Flip Gosper Curve, src: 100hex
function inner_flip_gosper_curve() = let(
    axiom = "X",
    rules =
        [
            "X=FZ-FY--FY+FZ++FZFZ+FY-", "Y=FW+XF++XF-WF--WFWF-XF+", "Z=-WF+XFXF++XF+WF--WF-XF",
            "W=+FY-FZF--ZF-FY++FY+FZ", "F="
        ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Gosper Curve Tree, src: 100hex
function gosper_curve_tree() = let(
    axiom = "X--X--X",
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Gosper Hex, src: 100hex
function gosper_hex() = let(
    axiom = "X",
    rules =
        [
            "X=-F++F-X-F--F+Y---F--F+Y+F++F-X+++F++F-X-F++F-X+++F--F+Y--",
            "Y=+F++F-X-F--F+Y+F--F+Y---F--F+Y---F++F-X+++F++F-X+++F--F+Y", "F="
        ],
    params = [ [ "angle", 30 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Quadratic Gosper, src: 100hex
function quadratic_gosper() = let(
    axiom = "XF",
    rules =
        [
            "X=XFX-YF-YF+FX+FX-YF-YFFX+YF+FXFXYF-FX+YF+FXFX+YF-FXYF-YF-FX+FX+YFYF-",
            "Y=+FXFX-YF-YF+FX+FXYF+FX-YFYF-FX-YF+FXYFYF-FX-YFFX+FX+YF-YF-FX+FX+YFY"
        ],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];
// Gosper Variation, src: 100hex
function gosper_variation() = let(
    axiom = "X",
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ],
    params = [ [ "angle", 60 ], [ "n", 5 ] ]
) [axiom, rules, params];

// Koch Snowflake Inverted, src: 100hex
function koch_snowflake_inverted() = let(
    axiom = "F+F+F+F+F+F",
    rules = ["F=F+F--F+F"],
    params = [ [ "angle", 60 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Reflected Koch, src: 100hex
function reflected_koch() = let(
    axiom = "X",
    rules = [ "X=XF+YF--XF-XF--XF--YFXF", "Y=XFYF++YF++YF+YF++XF-YF", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Sierpinski Arrowhead, src: 100hex
function sierpinski_arrowhead() = let(
    axiom = "X",
    rules = [ "X=YF+XF+YF", "Y=XF-YF-XF", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 5 ] ]
) [axiom, rules, params];

// Sierpinski Arrowhead Hexagon, src: 100hex
// The axiom depends on the parity of n, so n is a function parameter here;
// the returned params carry the same n so L_System2D stays consistent.
function sierpinski_arrowhead_hexagon(n = 5) = let(
    axiom = (n % 2 == 0) ? "FYFF+FYFF+FYFF+FYFF+FYFF+FYFF" : "YF-YF+YF-YF+YF-YF",
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ],
    params = [ [ "angle", 60 ], [ "n", n ] ]
) [axiom, rules, params];

// Sierpinski Arrowhead Star, src: 100hex
// The axiom depends on the parity of n, so n is a function parameter here;
// the returned params carry the same n so L_System2D stays consistent.
function sierpinski_arrowhead_star(n = 4) = let(
    axiom = (n % 2 == 0) ? "YF-YF-YF-YF-YF-YF" : "YF+YF+YF+YF+YF+YF",
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ],
    params = [ [ "angle", 60 ], [ "n", n ] ]
) [axiom, rules, params];

// Lace, src: 100hex
function lace() = let(
    axiom = "X",
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ],
    params = [ [ "angle", 30 ], [ "n", 6 ] ]
) [axiom, rules, params];

// Lace triangle, src: 100hex
function lace_triangle() = let(
    axiom = "X",
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ],
    params = [ [ "angle", 30 ], [ "n", 5 ] ]
) [axiom, rules, params];

// Peano curve - root9, src: 100hex
function peano_curve() = let(
    axiom = "F",
    rules = ["F=F+F-F-F-F+F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Peano round corners, src: 100hex
function peano_round_corners() = let(
    axiom = "X",
    rules = [ "X=FX+FY+FX-FY-FX-FY-FX-FY-FX+FY+FX+FY+FX+FY+FX-FY-FX", "Y=FY", "F=" ],
    params = [ [ "angle", 45 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Krishna, src: 100hex
function krishna() = let(
    axiom = "X",
    rules = ["X=XFX--XFX"],
    params = [ [ "angle", 45 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Carpet3, src: 100hex
function carpet3() = let(
    axiom = "F",
    rules = ["F=F+F-F-F-F++FF"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Carpet5, src: 100hex
function carpet5() = let(
    axiom = "L",
    rules = [ "L=LF+RFR+FL-F-LFLFL-FRFR+", "R=-LFLF+RFRFR+F+RF-LFL-FR", "F=F" ],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Pentaplexity, src: 100hex
function pentaplexity() = let(
    axiom = "F",
    rules = ["F=F++F++F+++++F-F++F"],
    params = [ [ "angle", 36 ], [ "n", 4 ] ]
) [axiom, rules, params];
// Pentadendrite, src: 100hex
function pentadendrite() = let(
    axiom = "F",
    rules = ["F=F-F-F++F+F-F"],
    params = [ [ "angle", 72 ], [ "n", 3 ] ]
) [axiom, rules, params];

// McWorter's Pentigree, src: 100hex
function mcworters_pentigree() = let(
    axiom = "F",
    rules = ["F=+F++F----F--F++F++F-"],
    params = [ [ "angle", 36 ], [ "n", 4 ] ]
) [axiom, rules, params];

// A bush, src: 100hex
function bush() = let(
    axiom = "F",
    rules = ["F=F-F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// X-border2 - Joined Cross Curves, src: 100hex
function x_border_cross_curves() = let(
    axiom = "Z+Z+Z+Z",
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYX" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Moore, src: 100hex
function moore_curve() = let(
    axiom = "X",
    rules = [ "F=", "X=FX+FX+FXFYFX+FXFY-FY-FY-", "Y=+FX+FX+FXFY-FYFXFY-FY-FY" ],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Pajarita, src: 100hex
function pajarita() = let(
    axiom = "X",
    rules = [ "F=", "X=F-F-F+F+FX++F-F-F+F+FX--F-F-F+F+FX" ],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Estrela4puntas, src: 100hex
function four_point_stars() = let(
    axiom = "F",
    rules = ["F=F+F+F++++F+F+F"],
    params = [ [ "angle", 45 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Cross2, src: 100hex
function cross2() = let(
    axiom = "F",
    rules = ["F=F+F-F+F+F"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Cross3, src: 100hex
function cross3() = let(
    axiom = "F",
    rules = ["F=FF-F-F-F-F-F+F"],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Mango Leaf, src: 100hex
function mango_leaf() = let(
    axiom = "Y",
    rules = [ "X={F-F}{F-F}--[--X]{F-F}{F-F}--{F-F}{F-F}--", "Y=F-F+X+F-FY" ],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Maple-root9, src: 100hex
function maple_leaf() = let(
    axiom = "F",
    rules = ["F=F--F++F++FF--F--F++FF"],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];
// Maple2-root9, src: 100hex
function maple_leaf2() = let(
    axiom = "F",
    rules = ["F=F--F++F++FF--F--F++FF--F++F++FF--F--F++F"],
    params = [ [ "angle", 60 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Triangulos4-rosas, src: 100hex
function rose_triangles() = let(
    axiom = "X",
    rules = [ "X=+FX+FX+FX+FX+FX+FX+", "F=FF" ],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Hexagonos1, src: 100hex
function hexagons() = let(
    axiom = "X",
    rules = [ "X=+XF+XF+XF+XF+XF+XF", "F=FF" ],
    params = [ [ "angle", 60 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Hexagonos2-estrelas, src: 100hex
function hexagon_star() = let(
    axiom = "X",
    rules = [ "X=+FX+FX+FX+FX+FX+FX", "F=FFF" ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Triangulos1-root4, src: 100hex
function triangles_var3() = let(
    axiom = "F",
    rules = ["F=F++FF--F"],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Triangulos2-root4, src: 100hex
function triangles_var4() = let(
    axiom = "X",
    rules = [ "X=-FYFX++FYFX-", "Y=+YFXF--YFXF+", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 5 ] ]
) [axiom, rules, params];

// 5dragon-root5, src: 100hex
function dragon_root() = let(
    axiom = "F",
    rules = ["F=F+F+F-F-F"],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Pinched 5_dragon-root5, src: 100hex
function pinched_dragon_root() = let(
    axiom = "X",
    rules = [ "X=YF+YF+YF-YF-YF", "Y=XF-XF-XF+XF+XF", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// 5_Crazy dragon, src: 100hex
function crazy_dragon() = let(
    axiom = "X",
    rules = [ "X=-XF+YF-XF+YF+XF", "Y=FY-FX-FY+FX-FY+", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// 5_Pine, src: 100hex
function pine_dragon() = let(
    axiom = "X",
    rules = [ "X=-YF-XF-YF+XF-YF", "Y=FX+FY-FX+FY+FX+", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Lazo, src: 100hex
function trefoil_knots() = let(
    axiom = "F",
    rules = ["F=FF-F-"],
    params = [ [ "angle", 60 ], [ "n", 7 ] ]
) [axiom, rules, params];

// Root8-BrainDragon variant, src: 100hex
function brain_dragon() = let(
    axiom = "X",
    rules = [ "X=XFXF+XF+YF-XF-YF", "Y=FX+FY+FX-FY-FYFY", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Triangular grid - root7, src: 100hex
function triangular_grid() = let(
    axiom = "X",
    rules = [ "X=-YF++XF--YF++XFXF++YF--XF-", "Y=+YF++XF--YFYF--XF++YF--XF+", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Sym_7_1-root7, src: 100hex
function triangles_var5() = let(
    axiom = "X",
    rules = [ "X=FX++FXFY++FY--FXFX--FX", "Y=FX++FXFX++FY--FYFX--FX", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// 8Filler-root8, src: 100hex
function octagons() = let(
    axiom = "X",
    rules = [ "X=XF+YF+XF+YF+XF", "Y=YF-XF-YF-XF-YF", "F=" ],
    params = [ [ "angle", 45 ], [ "n", 4 ] ]
) [axiom, rules, params];

// Triangulos-root9, src: 100hex
function triangles_var1() = let(
    axiom = "F",
    rules = ["F=F--F++F++F--FF"],
    params = [ [ "angle", 60 ], [ "n", 3 ] ]
) [axiom, rules, params];

// Triangulos3-root9, src: 100hex
function triangles_var2() = let(
    axiom = "X",
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 2 ] ]
) [axiom, rules, params];

// PeanoGosper-root13, src: 100hex
function peano_gosper() = let(
    axiom = "X",
    rules = [ "X=YF+XF-YF-YFXF+XF+YF-XF+XF+YF-XF+YF-XF-", "Y=+YF+XF-YF+XF-YF-YF+FX-YF-YFXF+XF+YF-XF", "F=" ],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Gosper-root13, src: 100hex
function gosper_tri() = let(
    axiom = "X",
    rules = [ "X=YF+XF++XF-YF--YF+XFXF++XF+YF-XF+YF--YF-XF-", "Y=+YF+XF++XF-YF+XF-YF--YFYF-XF++XF+YF--YF-XF", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 2 ] ]
) [axiom, rules, params];

// DragonLobulos, src: 100hex
function dragon_lobes() = let(
    axiom = "X",
    rules = [ "X=--FXF+F+FYF--", "Y=++FXF-F-FYF++", "F=" ],
    params = [ [ "angle", 45 ], [ "n", 9 ] ]
) [axiom, rules, params];

// Carpet6, src: 100hex
function carpet6() = let(
    axiom = "F",
    rules = [ "F=F-b+F-F-F-Fb-F+b-F+F+F+Fb+FF", "b=" ],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// Peano variacion - root9, src: 100hex
function peano_variation1() = let(
    axiom = "F",
    rules = [ "F=F+F-F-F-G+F+F+F-F", "G=FFF" ],
    params = [ [ "angle", 90 ], [ "n", 2 ] ]
) [axiom, rules, params];

// ================================
// Polygon Curves
// ================================

// Koch Snowflake
function koch_snowflake() = let(
    axiom = "F++F++F",
    rules = ["F=F-F++F-F"],
    params = [ [ "angle", 60 ], [ "n", 4 ], [ "poly", true ] ]
) [axiom, rules, params];

// Segment Curve II, src: 100hex
function segment_x() = let(
    axiom = "F-F-F-F",
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"],
    params = [ [ "angle", 90 ], [ "n", 2 ], [ "poly", true ] ]
) [axiom, rules, params];

// Gosper Variation Tree, src: 100hex
function gosper_variation_tree() = let(
    axiom = "X--X--X",
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ],
    params = [ [ "angle", 60 ], [ "n", 3 ], [ "poly", true ] ]
) [axiom, rules, params];

// Koch Snowflake Variant, src: 100hex
function koch_snowflake_variant() = let(
    axiom = "F--F--F--F--F--F",
    rules = ["F=-F++F--F+"],
    params = [ [ "angle", 30 ], [ "n", 3 ], [ "poly", true ] ]
) [axiom, rules, params];

// Square Sierpinski, src: 100hex
function square_sierpinski() = let(
    axiom = "F+XF+F+XF",
    rules = ["X=XF-F+F-XF+F+XF-F+F-X"],
    params = [ [ "angle", 90 ], [ "n", 3 ], [ "poly", true ] ]
) [axiom, rules, params];

// X-border - Joined Cross Curves, src: 100hex
function x_border_joined_cross_curves() = let(
    axiom = "Z+Z+Z+Z",
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYXYXYX" ],
    params = [ [ "angle", 90 ], [ "n", 3 ], [ "poly", true ] ]
) [axiom, rules, params];

// Jaggy-Cross2, src: 100hex
function jaggy_cross() = let(
    axiom = "X+X+X+X",
    rules = [ "X=-YF-YFXF+XF+XF", "Y=FY-FY-FYFX+FX+", "F= " ],
    params = [ [ "angle", 90 ], [ "n", 4 ], [ "poly", true ] ]
) [axiom, rules, params];

// Triángulos3a-root9, src: 100hex
function triangles_var6() = let(
    axiom = "X++X++X",
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 2 ], [ "poly", true ] ]
) [axiom, rules, params];

// root16-fractal1, src: 100hex
function fractal_var1() = let(
    axiom = "X++X++X",
    rules = [ "X=-YF+XF+XF-", "Y=+FY-FY-FX+", "F=" ],
    params = [ [ "angle", 60 ], [ "n", 5 ], [ "poly", true ] ]
) [axiom, rules, params];

// ================================
// 3D Curves
// ================================
// Interpreted by L_System3D. Roll-left is the backslash symbol, which must
// be escaped as "\\" inside OpenSCAD rule strings.

// 3D Hilbert Curve (Wagon / Dickau)
function hilbert_curve_3d() = let(
    axiom = "X",
    rules = ["X=^\\XF^\\XFX-F^//XFX&F+//XFX-F/X-/"],
    params = [ [ "angle", 90 ], [ "n", 3 ] ]
) [axiom, rules, params];

// ABOP Bush (fig. 1.25, simplified: no leaf or color symbols)
function abop_bush() = let(
    axiom = "A",
    rules = [ "A=[&FA]/////[&FA]///////[&FA]", "F=S/////F", "S=F" ],
    params = [ [ "angle", 22.5 ], [ "n", 6 ], [ "w", 0.3 ] ]
) [axiom, rules, params];

// Whorl Tree (three tapered branches per level, rolled 120 degrees apart)
function whorl_tree() = let(
    axiom = "FA",
    rules = ["A=!F[&FA]///[&FA]///[&FA]"],
    params = [ [ "angle", 28 ], [ "n", 6 ], [ "w", 0.5 ], [ "taper", 0.75 ] ]
) [axiom, rules, params];

// Coral (dense tapered branching dome)
function coral_3d() = let(
    axiom = "!FA",
    rules = ["A=!F[&F!A]//[&F!A]//[&F!A]F!A"],
    params = [ [ "angle", 25 ], [ "n", 5 ], [ "w", 0.8 ], [ "taper", 0.85 ] ]
) [axiom, rules, params];
