// Example 2D Curve Definitions

// Dragon Curve
module dragon_curve(n = 10, angle = 90, w = 0.4)
{
    axiom = "FX";
    rules = [ "X=X+YF+", "Y=-FX-Y" ];
    L_system2(axiom, rules, n, angle, w);
}

// Twin Dragon
module twin_dragon(n = 10, angle = 90, w = 0.4)
{
    axiom = "FX+FX+";
    rules = [ "X=X+YF", "Y=FX-Y" ];
    L_system2(axiom, rules, n, angle, w);
}

// Terdragon
module terdragon(n = 10, angle = 120, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Hilbert Curve
module hilbert_curve(n = 4, angle = 90, w = 0.4)
{
    axiom = "A";
    rules = [ "A=-BF+AFA+FB-", "B=+AF-BFB-FA+" ];
    L_system2(axiom, rules, n, angle, w);
}

// Moore Curve
module moore_square(n = 4, angle = 90, w = 0.4)
{
    axiom = "LFL+F+LFL";
    rules = [ "L=-RF+LFL+FR-", "R=+LF-RFR-FL+" ];
    L_system2(axiom, rules, n, angle, w);
}

// Peano Curve
module peano_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = "L";
    rules = [ "L=LFRFL-F-RFLFR+F+LFRFL", "R=RFLFR+F+LFRFL-F-RFLFR" ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve
module gosper_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = "A";
    rules = [ "A=A-B--B+A++AA+B-", "B=+A-BB--B-A++A+B" ];
    L_system2(axiom, rules, n, angle, w, "AB");
}

// Levy C Curve
module levy_c_curve(n = 10, angle = 45, w = 0.4)
{
    axiom = "F";
    rules = ["F=+F--F+"];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Curve
module koch_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F++F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Type 1 Koch
module quadratic_type1_koch(n = 4, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Type 2 Koch
module quadratic_type2_koch(n = 4, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F+F+FF-F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Fractal 1, src: 100hex
module quadratic_fractal1(n = 2, angle = 90, w = 1.6)
{
    axiom = "F+F+F+F";
    rules = ["F=F+F-F-FFF+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Fractal 2, src: 100hex
module quadratic_fractal2(n = 2, angle = 90, w = 1.21)
{
    axiom = "F+F+F+F";
    rules = ["F=F+FF-F-FF+F-FF+F+FF-F"];
    L_system2(axiom, rules, n, angle, w);
}
// Quadratic Fractal 3, src: 100hex
module quadratic_fractal3(n = 2, angle = 90, w = 1.21)
{
    axiom = "F+F+F+F";
    rules = ["F=F-FF+FF+F+F-F-FF+F+F-F-FF-FF+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Triangle
module sierpinski_triangle(n = 5, angle = 120, w = 0.2)
{
    axiom = "F-G-G";
    rules = [ "F=F-G+F+G-F", "G=GG" ];
    L_system2(axiom, rules, n, angle, w, "FG");
}

// Sierpinski Arrowhead
module sierpinski_arrowhead(n = 6, angle = 60, w = 0.4)
{
    axiom = "XF";
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ];
    L_system2(axiom, rules, n, angle, w);
}

// Island Curve
module island_curve(n = 10, angle = 90, w = 0.4)
{
    axiom = "F-F-F-F";
    rules = [ "F=F-b+FF-F-FF-Fb-FF+b-FF+F+FF+Fb+FFF", "b=bbbbbb" ];
    L_system2(axiom, rules, n, angle, w, "F", "b");
}

// Penrose Tiling
module penrose_tiling(n = 2, angle = 36, w = 0.2)
{
    axiom = "[7]++[7]++[7]++[7]++[7]";
    rules = [
        "6=81++91----71[-81----61]++", "7=+81--91[---61--71]+", "8=-61++71[+++81++91]-", "9=--81++++61[+91++++71]--71",
        "1="
    ];
    L_system2(axiom, rules, n, angle, w, "6789");
}

// Pentadendrite
module pentadendrite(n = 2, angle = 72, w = 0.2)
{
    axiom = "F-F-F-F-F";
    rules = ["F=F-F-F++F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Icy Pattern
module icy(n = 2, angle = 90, w = 0.5)
{
    axiom = "F+F+F+F";
    rules = ["F=FF+F++F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Tree
module tree(n = 2, angle = 36, w = 0.1)
{
    axiom = "F";
    rules = ["F=F[+FF][-FF]F[-F][+F]F"];
    L_system2(axiom, rules, n, angle, w, "F", "F", 90);
}

// Round Star
module round_star(n = 7, angle = 77, w = 0.001)
{
    axiom = "F";
    rules = ["F=F++F"];
    L_system2(axiom, rules, n, angle, w);
}

// Fractal Plant
module fractal_plant(n = 4, angle = 25, w = 0.1)
{
    axiom = "X";
    rules = [ "X=F+[[X]-X]-F[-FX]+X", "F=FF" ];
    L_system2(axiom, rules, n, angle, w, "FX");
}

// Minkowski Curve
module minkowski(n = 4, angle = 90, w = 0.4)
{
    axiom = "F+F+F+F";
    rules = ["F=F+F-F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Vicsek Fractal
module vicsek_fractal(n = 3, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F+F+FF-F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Island
module koch_island(n = 4, angle = 60, w = 0.4)
{
    axiom = "F++F++F++F";
    rules = ["F=F-F++F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Fractal Vine
module fractal_vine(n = 5, angle = 25, w = 0.2)
{
    axiom = "F";
    rules = ["F=F[+F]F[-F]F"];
    L_system2(axiom, rules, n, angle, w, "F", "F");
}

// Spiral Curve
module spiral_curve(n = 5, angle = 30, w = 0.3)
{
    axiom = "F";
    rules = ["F=F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonal Spiral
module hexagonal_spiral(n = 6, angle = 60, w = 0.3)
{
    axiom = "F";
    rules = ["F=F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Square Fractal
module square_fractal(n = 4, angle = 90, w = 0.4)
{
    axiom = "F+F+F+F";
    rules = ["F=F+F-F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Segment Curve 1, src: 100hex
module segment_curve(n = 2, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Segment Curve 2, src: 100hex
module segment_curve_2(n = 2, angle = 90, w = 0.4)
{
    axiom = "F-F-F-F";
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Cesaro Sweep Variant, src: 100hex
module cesaro_sweep(n = 4, angle = 80, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F--F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Cesaro Carpet, src: 100hex
module cesaro_carpet(n = 3, angle = 90, w = 0.4)
{
    axiom = "X+X+X+X";
    rules = ["X=FXF+FXF--FXF+FXF"];
    L_system2(axiom, rules, n, angle, w);
}

// Icy Fractal, src: 100hex
module icy_fractal(n = 3, angle = 90, w = 0.4)
{
    axiom = "F-F-F-F";
    rules = ["F=FF-F--F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Heighway's Dragon Curve, src: 100hex
module heighways_dragon(n = 8, angle = 90, w = 0.4)
{
    axiom = "FX";
    rules = [ "X=X+YF+", "Y=-FX-Y" ];
    L_system2(axiom, rules, n, angle, w);
}

// Polya Sweep, src: 100hex
module polya_sweep(n = 8, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=+FX-FY-", "Y=-FX+FY+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonal Dragon, src: 100hex
module hexagonal_dragon(n = 5, angle = 60, w = 0.4)
{
    axiom = "X-X-X-X-X-X";
    rules = [ "X=X+YF+", "Y=-FX-Y" ];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonal Dragon Estrela, src: 100hex
module hexagonal_dragon_estrela(n = 7, angle = 60, w = 0.4)
{
    axiom = "Z-Z-Z--Z-Z-Z";
    rules = [ "X=X+YF+", "Y=-FX-Y", "Z=FX+FX" ];
    L_system2(axiom, rules, n, angle, w);
}

// Twin Dragon, src: 100hex
module twin_dragon(n = 8, angle = 90, w = 0.4)
{
    axiom = "FX+FX+";
    rules = [ "X=X+YF", "Y=FX-Y" ];
    L_system2(axiom, rules, n, angle, w);
}

// Terdragon, src: 100hex
module terdragon(n = 5, angle = 120, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Inverted Terdragon, src: 100hex
module inverted_terdragon(n = 2, angle = 120, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F+F + F-F+F - F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Mandelbrot Quartet - Root 5, src: 100hex
module mandelbrot_quartet(n = 3, angle = 90, w = 0.4)
{
    axiom = "+X";
    rules = [ "X=-FYFX+FX+FY-FX", "Y=FY+FX-FY-FYFX+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Hilbert Curve, src: 100hex
module hilbert_curve(n = 5, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-YF+XFX+FY-", "Y=+XF-YFY-FX+" ];
    L_system2(axiom, rules, n, angle, w);
}

// Moore Curve, src: 100hex
module moore_square2(n = 4, angle = 90, w = 0.4)
{
    axiom = "F-XFX-F-XFX";
    rules = [ "X=+YF-XFX-FY+", "Y=-XF+YFY+FX-" ];
    L_system2(axiom, rules, n, angle, w);
}

// Peano Curve, src: 100hex
module peano_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=XFYFX-F-YFXFY+F+XFYFX", "Y=YFXFY+F+XFYFX-F-YFXFY" ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve, src: 100hex
module gosper_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Inner-Flip Gosper Curve, src: 100hex
module inner_flip_gosper_curve(n = 3, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [
        "X=FZ-FY--FY+FZ++FZFZ+FY-", "Y=FW+XF++XF-WF--WFWF-XF+", "Z=-WF+XFXF++XF+WF--WF-XF", "W=+FY-FZF--ZF-FY++FY+FZ",
        "F="
    ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve Tree, src: 100hex
module gosper_curve_tree(n = 3, angle = 60, w = 0.4)
{
    axiom = "X--X--X";
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Hex, src: 100hex
module gosper_hex(n = 4, angle = 30, w = 0.4)
{
    axiom = "X";
    rules = [
        "X=-F++F-X-F--F+Y---F--F+Y+F++F-X+++F++F-X-F++F-X+++F--F+Y--",
        "Y=+F++F-X-F--F+Y+F--F+Y---F--F+Y---F++F-X+++F++F-X+++F--F+Y", "F="
    ];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Gosper, src: 100hex
module quadratic_gosper(n = 3, angle = 90, w = 0.4)
{
    axiom = "XF";
    rules = [
        "X=XFX-YF-YF+FX+FX-YF-YFFX+YF+FXFXYF-FX+YF+FXFX+YF-FXYF-YF-FX+FX+YFYF-",
        "Y=+FXFX-YF-YF+FX+FXYF+FX-YFYF-FX-YF+FXYFYF-FX-YFFX+FX+YF-YF-FX+FX+YFY"
    ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Variation, src: 100hex
module gosper_variation(n = 5, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Snowflake Inverted, src: 100hex
module koch_snowflake_inverted(n = 2, angle = 60, w = 0.4)
{
    axiom = "F+F+F+F+F+F";
    rules = ["F=F+F--F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Reflected Koch, src: 100hex
module reflected_koch(n = 3, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=XF+YF--XF-XF--XF--YFXF", "Y=XFYF++YF++YF+YF++XF-YF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead, src: 100hex
module sierpinski_arrowhead(n = 5, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=YF+XF+YF", "Y=XF-YF-XF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead Hexagon, src: 100hex
module sierpinski_arrowhead_hexagon(n = 5, angle = 60, w = 0.4)
{
    axiom = (n % 2 == 0) ? "FYFF+FYFF+FYFF+FYFF+FYFF+FYFF" : "YF-YF+YF-YF+YF-YF";
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead Star, src: 100hex
module sierpinski_arrowhead_star(n = 4, angle = 60, w = 0.4)
{
    axiom = (n % 2 == 0) ? "YF-YF-YF-YF-YF-YF" : "YF+YF+YF+YF+YF+YF";
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ];
    L_system2(axiom, rules, n, angle, w);
}

// Lace, src: 100hex
module lace(n = 6, angle = 30, w = 0.4)
{
    axiom = "X";
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ];
    L_system2(axiom, rules, n, angle, w);
}

// Lace triangle, src: 100hex
module lace_triangle(n = 5, angle = 30, w = 0.4)
{
    axiom = "X";
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ];
    L_system2(axiom, rules, n, angle, w);
}

// Peano curve - root9, src: 100hex
module peano_curve(n = 2, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F-F-F+F+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Peano round corners, src: 100hex
module peano_round_corners(n = 3, angle = 45, w = 0.4)
{
    axiom = "X";
    rules = [ "X=FX+FY+FX-FY-FX-FY-FX-FY-FX+FY+FX+FY+FX+FY+FX-FY-FX", "Y=FY", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Krishna, src: 100hex
module krishna(n = 4, angle = 45, w = 0.4)
{
    axiom = "X";
    rules = ["X=XFX--XFX"];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet3, src: 100hex
module carpet3(n = 3, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F-F-F++FF"];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet5, src: 100hex
module carpet5(n = 3, angle = 90, w = 0.4)
{
    axiom = "L";
    rules = [ "L=LF+RFR+FL-F-LFLFL-FRFR+", "R=-LFLF+RFRFR+F+RF-LFL-FR", "F=F" ];
    L_system2(axiom, rules, n, angle, w);
}

// Pentaplexity, src: 100hex
module pentaplexity(n = 4, angle = 36, w = 0.4)
{
    axiom = "F";
    rules = ["F=F++F++F+++++F-F++F"];
    L_system2(axiom, rules, n, angle, w);
}

// Pentadendrite, src: 100hex
module pentadendrite(n = 3, angle = 72, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F-F++F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}
// McWorter's Pentigree, src: 100hex
module mcworters_pentigree(n = 4, angle = 36, w = 0.4)
{
    axiom = "F";
    rules = ["F=+F++F----F--F++F++F-"];
    L_system2(axiom, rules, n, angle, w);
}

// A bush, src: 100hex
module bush(n = 4, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F-F+F+F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// X-border2 - Joined Cross Curves, src: 100hex
module x_border_cross_curves(n = 4, angle = 90, w = 0.4)
{
    axiom = "Z+Z+Z+Z";
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYX" ];
    L_system2(axiom, rules, n, angle, w);
}

// Moore, src: 100hex
module moore_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "F=", "X=FX+FX+FXFYFX+FXFY-FY-FY-", "Y=+FX+FX+FXFY-FYFXFY-FY-FY" ];
    L_system2(axiom, rules, n, angle, w);
}

// Pajarita, src: 100hex
module pajarita(n = 4, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "F=", "X=F-F-F+F+FX++F-F-F+F+FX--F-F-F+F+FX" ];
    L_system2(axiom, rules, n, angle, w);
}

// Estrela4puntas, src: 100hex
module four_point_stars(n = 3, angle = 45, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F+F++++F+F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Cross2, src: 100hex
module cross2(n = 3, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F-F+F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Cross3, src: 100hex
module cross3(n = 2, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=FF-F-F-F-F-F+F"];
    L_system2(axiom, rules, n, angle, w);
}

// Mango Leaf, src: 100hex
module mango_leaf(n = 4, angle = 60, w = 0.4)
{
    axiom = "Y";
    rules = [ "X={F-F}{F-F}--[--X]{F-F}{F-F}--{F-F}{F-F}--", "Y=F-F+X+F-FY" ];
    L_system2(axiom, rules, n, angle, w);
}

// Maple-root9, src: 100hex
module maple_leaf(n = 3, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=F--F++F++FF--F--F++FF"];
    L_system2(axiom, rules, n, angle, w);
}

// Maple2-root9, src: 100hex
module maple_leaf2(n = 2, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=F--F++F++FF--F--F++FF--F++F++FF--F--F++F"];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos4-rosas, src: 100hex
module rose_triangles(n = 4, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=+FX+FX+FX+FX+FX+FX+", "F=FF" ];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonos1, src: 100hex
module hexagons(n = 4, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=+XF+XF+XF+XF+XF+XF", "F=FF" ];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonos2-estrelas, src: 100hex
module hexagon_star(n = 3, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=+FX+FX+FX+FX+FX+FX", "F=FFF" ];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos1-root4, src: 100hex
module triangles_var3(n = 3, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=F++FF--F"];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos2-root4, src: 100hex
module triangles_var4(n = 5, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-FYFX++FYFX-", "Y=+YFXF--YFXF+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// 5dragon-root5, src: 100hex
module dragon_root(n = 4, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = ["F=F+F+F-F-F"];
    L_system2(axiom, rules, n, angle, w);
}

// Pinched 5_dragon-root5, src: 100hex
module pinched_dragon_root(n = 4, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=YF+YF+YF-YF-YF", "Y=XF-XF-XF+XF+XF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}
// 5_Crazy dragon, src: 100hex
module crazy_dragon(n = 4, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-XF+YF-XF+YF+XF", "Y=FY-FX-FY+FX-FY+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// 5_Pine, src: 100hex
module pine_dragon(n = 4, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-YF-XF-YF+XF-YF", "Y=FX+FY-FX+FY+FX+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Lazo, src: 100hex
module trefoil_knots(n = 7, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=FF-F-"];
    L_system2(axiom, rules, n, angle, w);
}

// Root8-BrainDragon variant, src: 100hex
module brain_dragon(n = 3, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=XFXF+XF+YF-XF-YF", "Y=FX+FY+FX-FY-FYFY", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Triangular grid - root7, src: 100hex
module triangular_grid(n = 3, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-YF++XF--YF++XFXF++YF--XF-", "Y=+YF++XF--YFYF--XF++YF--XF+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Sym_7_1-root7, src: 100hex
module triangles_var5(n = 3, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=FX++FXFY++FY--FXFX--FX", "Y=FX++FXFX++FY--FYFX--FX", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// 8Filler-root8, src: 100hex
module octagons(n = 4, angle = 45, w = 0.4)
{
    axiom = "X";
    rules = [ "X=XF+YF+XF+YF+XF", "Y=YF-XF-YF-XF-YF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos-root9, src: 100hex
module triangles_var1(n = 3, angle = 60, w = 0.4)
{
    axiom = "F";
    rules = ["F=F--F++F++F--FF"];
    L_system2(axiom, rules, n, angle, w);
}
// Triangulos3-root9, src: 100hex
module triangles_var2(n = 2, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// PeanoGosper-root13, src: 100hex
module peano_gosper(n = 2, angle = 90, w = 0.4)
{
    axiom = "X";
    rules = [ "X=YF+XF-YF-YFXF+XF+YF-XF+XF+YF-XF+YF-XF-", "Y=+YF+XF-YF+XF-YF-YF+FX-YF-YFXF+XF+YF-XF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper-root13, src: 100hex
module gosper_tri(n = 2, angle = 60, w = 0.4)
{
    axiom = "X";
    rules = [ "X=YF+XF++XF-YF--YF+XFXF++XF+YF-XF+YF--YF-XF-", "Y=+YF+XF++XF-YF+XF-YF--YFYF-XF++XF+YF--YF-XF", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// DragonLobulos, src: 100hex
module dragon_lobes(n = 9, angle = 45, w = 0.4)
{
    axiom = "X";
    rules = [ "X=--FXF+F+FYF--", "Y=++FXF-F-FYF++", "F=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet6, src: 100hex
module carpet6(n = 2, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = [ "F=F-b+F-F-F-Fb-F+b-F+F+F+Fb+FF", "b=" ];
    L_system2(axiom, rules, n, angle, w);
}

// Peano variacion - root9, src: 100hex
module peano_variation1(n = 2, angle = 90, w = 0.4)
{
    axiom = "F";
    rules = [ "F=F+F-F-F-G+F+F+F-F", "G=FFF" ];
    L_system2(axiom, rules, n, angle, w);
}