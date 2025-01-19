// Example 2D Curve Definitions
// TODO: extract all modules to the showcase file

// Dragon Curve
function dragon_curve() = let(       //
    axiom = "FX",                    //
    rules = [ "X=X+YF+", "Y=-FX-Y" ] //
    )[axiom, rules];

module dragon_curve(n = 10, angle = 90, w = 0.4)
{
    axiom = dragon_curve()[0];
    rules = dragon_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Twin Dragon
function twin_dragon() = let(      //
    axiom = "FX+FX+",              //
    rules = [ "X=X+YF", "Y=FX-Y" ] //
    )[axiom, rules];

module twin_dragon(n = 10, angle = 90, w = 0.4)
{
    axiom = twin_dragon()[0];
    rules = twin_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Terdragon
function terdragon() = let( //
    axiom = "F",            //
    rules = ["F=F+F-F"]     //
    )[axiom, rules];

module terdragon(n = 10, angle = 120, w = 0.4)
{
    axiom = terdragon()[0];
    rules = terdragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hilbert Curve
function hilbert_curve() = let(                  //
    axiom = "A",                                 //
    rules = [ "A=-BF+AFA+FB-", "B=+AF-BFB-FA+" ] //
    )[axiom, rules];

module hilbert_curve(n = 4, angle = 90, w = 0.4)
{
    axiom = hilbert_curve()[0];
    rules = hilbert_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Moore Curve
function moore_square() = let(                   //
    axiom = "LFL+F+LFL",                         //
    rules = [ "L=-RF+LFL+FR-", "R=+LF-RFR-FL+" ] //
    )[axiom, rules];

module moore_square(n = 4, angle = 90, w = 0.4)
{
    axiom = moore_square()[0];
    rules = moore_square()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Peano Curve
function peano_curve() = let(                                        //
    axiom = "L",                                                     //
    rules = [ "L=LFRFL-F-RFLFR+F+LFRFL", "R=RFLFR+F+LFRFL-F-RFLFR" ] //
    )[axiom, rules];

module peano_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = peano_curve()[0];
    rules = peano_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve
function gosper_curve() = let(                           //
    axiom = "A",                                         //
    rules = [ "A=A-B--B+A++AA+B-", "B=+A-BB--B-A++A+B" ] //
    )[axiom, rules];

module gosper_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = gosper_curve()[0];
    rules = gosper_curve()[1];
    L_system2(axiom, rules, n, angle, w, "AB");
}

// Levy C Curve
function levy_c_curve() = let( //
    axiom = "F",               //
    rules = ["F=+F--F+"]       //
    )[axiom, rules];

module levy_c_curve(n = 10, angle = 45, w = 0.4)
{
    axiom = levy_c_curve()[0];
    rules = levy_c_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Curve
function koch_curve() = let( //
    axiom = "F",             //
    rules = ["F=F-F++F-F"]   //
    )[axiom, rules];

module koch_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = koch_curve()[0];
    rules = koch_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Type 1 Koch
function quadratic_type1_koch() = let( //
    axiom = "F",                       //
    rules = ["F=F-F+F+F-F"]            //
    )[axiom, rules];

module quadratic_type1_koch(n = 4, angle = 90, w = 0.4)
{
    axiom = quadratic_type1_koch()[0];
    rules = quadratic_type1_koch()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Type 2 Koch
function quadratic_type2_koch() = let( //
    axiom = "F",                       //
    rules = ["F=F-F+F+FF-F-F+F"]       //
    )[axiom, rules];

module quadratic_type2_koch(n = 4, angle = 90, w = 0.4)
{
    axiom = quadratic_type2_koch()[0];
    rules = quadratic_type2_koch()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Fractal 1, src: 100hex
function quadratic_fractal1() = let( //
    axiom = "F+F+F+F",               //
    rules = ["F=F+F-F-FFF+F+F-F"]    //
    )[axiom, rules];

module quadratic_fractal1(n = 2, angle = 90, w = 1.6)
{
    axiom = quadratic_fractal1()[0];
    rules = quadratic_fractal1()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Quadratic Fractal 2, src: 100hex
function quadratic_fractal2() = let(    //
    axiom = "F+F+F+F",                  //
    rules = ["F=F+FF-F-FF+F-FF+F+FF-F"] //
    )[axiom, rules];

module quadratic_fractal2(n = 2, angle = 90, w = 1.21)
{
    axiom = quadratic_fractal2()[0];
    rules = quadratic_fractal2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Fractal 3, src: 100hex
function quadratic_fractal3() = let(             //
    axiom = "F+F+F+F",                           //
    rules = ["F=F-FF+FF+F+F-F-FF+F+F-F-FF-FF+F"] //
    )[axiom, rules];

module quadratic_fractal3(n = 2, angle = 90, w = 1.21)
{
    axiom = quadratic_fractal3()[0];
    rules = quadratic_fractal3()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Triangle
function sierpinski_triangle() = let( //
    axiom = "F-G-G",                  //
    rules = [ "F=F-G+F+G-F", "G=GG" ] //
    )[axiom, rules];

module sierpinski_triangle(n = 5, angle = 120, w = 0.2)
{
    axiom = sierpinski_triangle()[0];
    rules = sierpinski_triangle()[1];
    L_system2(axiom, rules, n, angle, w, "FG");
}

// Sierpinski Arrowhead
function sierpinski_arrowhead() = let(   //
    axiom = "XF",                        //
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ] //
    )[axiom, rules];

module sierpinski_arrowhead(n = 6, angle = 60, w = 0.4)
{
    axiom = sierpinski_arrowhead()[0];
    rules = sierpinski_arrowhead()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Island Curve
function island_curve() = let(                                     //
    axiom = "F-F-F-F",                                             //
    rules = [ "F=F-b+FF-F-FF-Fb-FF+b-FF+F+FF+Fb+FFF", "b=bbbbbb" ] //
    )[axiom, rules];

module island_curve(n = 10, angle = 90, w = 0.4)
{
    axiom = island_curve()[0];
    rules = island_curve()[1];
    L_system2(axiom, rules, n, angle, w, "F", "b");
}

// Penrose Tiling
function penrose_tiling() = let(       //
    axiom = "[7]++[7]++[7]++[7]++[7]", //
    rules =
        [
            "6=81++91----71[-81----61]++", "7=+81--91[---61--71]+", "8=-61++71[+++81++91]-",
            "9=--81++++61[+91++++71]--71",
            "1="
        ] //
    )[axiom, rules];

module penrose_tiling(n = 2, angle = 36, w = 0.2)
{
    axiom = penrose_tiling()[0];
    rules = penrose_tiling()[1];
    L_system2(axiom, rules, n, angle, w, "6789");
}

// Pentadendrite
function pentadendrite() = let( //
    axiom = "F-F-F-F-F",        //
    rules = ["F=F-F-F++F+F-F"]  //
    )[axiom, rules];

module pentadendrite(n = 2, angle = 72, w = 0.2)
{
    axiom = pentadendrite()[0];
    rules = pentadendrite()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Icy Pattern
function icy() = let(       //
    axiom = "F+F+F+F",      //
    rules = ["F=FF+F++F+F"] //
    )[axiom, rules];

module icy(n = 2, angle = 90, w = 0.5)
{
    axiom = icy()[0];
    rules = icy()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Tree
function tree() = let(                  //
    axiom = "F",                        //
    rules = ["F=F[+FF][-FF]F[-F][+F]F"] //
    )[axiom, rules];

module tree(n = 2, angle = 36, w = 0.1)
{
    axiom = tree()[0];
    rules = tree()[1];
    L_system2(axiom, rules, n, angle, w, "F", "F", 90);
}

// Round Star
function round_star() = let( //
    axiom = "F",             //
    rules = ["F=F++F"]       //
    )[axiom, rules];

module round_star(n = 7, angle = 77, w = 0.001)
{
    axiom = round_star()[0];
    rules = round_star()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Fractal Plant
function fractal_plant() = let(                //
    axiom = "X",                               //
    rules = [ "X=F+[[X]-X]-F[-FX]+X", "F=FF" ] //
    )[axiom, rules];

module fractal_plant(n = 4, angle = 25, w = 0.1)
{
    axiom = fractal_plant()[0];
    rules = fractal_plant()[1];
    L_system2(axiom, rules, n, angle, w, "FX");
}

// Minkowski Curve
function minkowski_curve() = let( //
    axiom = "F+F+F+F",      //
    rules = ["F=F+F-F-F+F"] //
    )[axiom, rules];

module minkowski_curve(n = 4, angle = 90, w = 0.4)
{
    axiom = minkowski_curve()[0];
    rules = minkowski_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Vicsek Fractal
function vicsek_fractal() = let( //
    axiom = "F",                 //
    rules = ["F=F-F+F+FF-F-F+F"] //
    )[axiom, rules];

module vicsek_fractal(n = 3, angle = 90, w = 0.4)
{
    axiom = vicsek_fractal()[0];
    rules = vicsek_fractal()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Island
function koch_island() = let( //
    axiom = "F++F++F++F",     //
    rules = ["F=F-F++F-F"]    //
    )[axiom, rules];

module koch_island(n = 4, angle = 60, w = 0.4)
{
    axiom = koch_island()[0];
    rules = koch_island()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Fractal Vine
function fractal_vine() = let( //
    axiom = "F",               //
    rules = ["F=F[+F]F[-F]F"]  //
    )[axiom, rules];

module fractal_vine(n = 5, angle = 25, w = 0.2)
{
    axiom = fractal_vine()[0];
    rules = fractal_vine()[1];
    L_system2(axiom, rules, n, angle, w, "F", "F");
}

// Spiral Curve
function spiral_curve() = let( //
    axiom = "F",               //
    rules = ["F=F+F-F"]        //
    )[axiom, rules];

module spiral_curve(n = 5, angle = 30, w = 0.3)
{
    axiom = spiral_curve()[0];
    rules = spiral_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonal Spiral
function hexagonal_spiral() = let( //
    axiom = "F",                   //
    rules = ["F=F+F-F"]            //
    )[axiom, rules];

module hexagonal_spiral(n = 6, angle = 60, w = 0.3)
{
    axiom = hexagonal_spiral()[0];
    rules = hexagonal_spiral()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Square Fractal
function square_fractal() = let( //
    axiom = "F+F+F+F",           //
    rules = ["F=F+F-F-F+F"]      //
    )[axiom, rules];

module square_fractal(n = 4, angle = 90, w = 0.4)
{
    axiom = square_fractal()[0];
    rules = square_fractal()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Segment Curve 1, src: 100hex
function segment_curve() = let(                                            //
    axiom = "F",                                                           //
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"] //
    )[axiom, rules];

module segment_curve(n = 2, angle = 90, w = 0.4)
{
    axiom = segment_curve()[0];
    rules = segment_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Segment Curve 2, src: 100hex
function segment_curve_2() = let(                                          //
    axiom = "F-F-F-F",                                                     //
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"] //
    )[axiom, rules];

module segment_curve_2(n = 2, angle = 90, w = 0.4)
{
    axiom = segment_curve_2()[0];
    rules = segment_curve_2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Cesaro Sweep Variant, src: 100hex
function cesaro_sweep() = let( //
    axiom = "F",               //
    rules = ["F=F+F--F+F"]     //
    )[axiom, rules];

module cesaro_sweep(n = 4, angle = 80, w = 0.4)
{
    axiom = cesaro_sweep()[0];
    rules = cesaro_sweep()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Cesaro Carpet, src: 100hex
function cesaro_carpet() = let(    //
    axiom = "X+X+X+X",             //
    rules = ["X=FXF+FXF--FXF+FXF"] //
    )[axiom, rules];

module cesaro_carpet(n = 3, angle = 90, w = 0.4)
{
    axiom = cesaro_carpet()[0];
    rules = cesaro_carpet()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Icy Fractal, src: 100hex
function icy_fractal() = let( //
    axiom = "F-F-F-F",        //
    rules = ["F=FF-F--F-F"]   //
    )[axiom, rules];

module icy_fractal(n = 3, angle = 90, w = 0.4)
{
    axiom = icy_fractal()[0];
    rules = icy_fractal()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Heighway's Dragon Curve, src: 100hex
function heighways_dragon() = let(   //
    axiom = "FX",                    //
    rules = [ "X=X+YF+", "Y=-FX-Y" ] //
    )[axiom, rules];

module heighways_dragon(n = 8, angle = 90, w = 0.4)
{
    axiom = heighways_dragon()[0];
    rules = heighways_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Polya Sweep, src: 100hex
function polya_sweep() = let(                  //
    axiom = "X",                               //
    rules = [ "X=+FX-FY-", "Y=-FX+FY+", "F=" ] //
    )[axiom, rules];

module polya_sweep(n = 8, angle = 90, w = 0.4)
{
    axiom = polya_sweep()[0];
    rules = polya_sweep()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonal Dragon, src: 100hex
function hexagonal_dragon() = let(   //
    axiom = "X-X-X-X-X-X",           //
    rules = [ "X=X+YF+", "Y=-FX-Y" ] //
    )[axiom, rules];

module hexagonal_dragon(n = 5, angle = 60, w = 0.4)
{
    axiom = hexagonal_dragon()[0];
    rules = hexagonal_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Hexagonal Dragon Estrela, src: 100hex
function hexagonal_dragon_estrela() = let(      //
    axiom = "Z-Z-Z--Z-Z-Z",                     //
    rules = [ "X=X+YF+", "Y=-FX-Y", "Z=FX+FX" ] //
    )[axiom, rules];

module hexagonal_dragon_estrela(n = 7, angle = 60, w = 0.4)
{
    axiom = hexagonal_dragon_estrela()[0];
    rules = hexagonal_dragon_estrela()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Twin Dragon, src: 100hex
function twin_dragon() = let(      //
    axiom = "FX+FX+",              //
    rules = [ "X=X+YF", "Y=FX-Y" ] //
    )[axiom, rules];

module twin_dragon(n = 8, angle = 90, w = 0.4)
{
    axiom = twin_dragon()[0];
    rules = twin_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Terdragon, src: 100hex
function terdragon() = let( //
    axiom = "F",            //
    rules = ["F=F+F-F"]     //
    )[axiom, rules];

module terdragon(n = 5, angle = 120, w = 0.4)
{
    axiom = terdragon()[0];
    rules = terdragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Inverted Terdragon, src: 100hex
function inverted_terdragon() = let(    //
    axiom = "F",                        //
    rules = ["F=F-F+F + F-F+F - F-F+F"] //
    )[axiom, rules];

module inverted_terdragon(n = 2, angle = 120, w = 0.4)
{
    axiom = inverted_terdragon()[0];
    rules = inverted_terdragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Mandelbrot Quartet - Root 5, src: 100hex
function mandelbrot_quartet() = let(                         //
    axiom = "+X",                                            //
    rules = [ "X=-FYFX+FX+FY-FX", "Y=FY+FX-FY-FYFX+", "F=" ] //
    )[axiom, rules];

module mandelbrot_quartet(n = 3, angle = 90, w = 0.4)
{
    axiom = mandelbrot_quartet()[0];
    rules = mandelbrot_quartet()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hilbert Curve, src: 100hex
function hilbert_curve() = let(                  //
    axiom = "X",                                 //
    rules = [ "X=-YF+XFX+FY-", "Y=+XF-YFY-FX+" ] //
    )[axiom, rules];

module hilbert_curve(n = 5, angle = 90, w = 0.4)
{
    axiom = hilbert_curve()[0];
    rules = hilbert_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Moore Curve, src: 100hex
function moore_square2() = let(                  //
    axiom = "F-XFX-F-XFX",                       //
    rules = [ "X=+YF-XFX-FY+", "Y=-XF+YFY+FX-" ] //
    )[axiom, rules];

module moore_square2(n = 4, angle = 90, w = 0.4)
{
    axiom = moore_square2()[0];
    rules = moore_square2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Peano Curve, src: 100hex
function peano_curve() = let(                                        //
    axiom = "X",                                                     //
    rules = [ "X=XFYFX-F-YFXFY+F+XFYFX", "Y=YFXFY+F+XFYFX-F-YFXFY" ] //
    )[axiom, rules];

module peano_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = peano_curve()[0];
    rules = peano_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve, src: 100hex
function gosper_curve() = let(                                               //
    axiom = "X",                                                             //
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ] //
    )[axiom, rules];

module gosper_curve(n = 4, angle = 60, w = 0.4)
{
    axiom = gosper_curve()[0];
    rules = gosper_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Inner-Flip Gosper Curve, src: 100hex
function inner_flip_gosper_curve() = let( //
    axiom = "X",                          //
    rules =
        [
            "X=FZ-FY--FY+FZ++FZFZ+FY-", "Y=FW+XF++XF-WF--WFWF-XF+", "Z=-WF+XFXF++XF+WF--WF-XF",
            "W=+FY-FZF--ZF-FY++FY+FZ", "F="
        ] //
    )[axiom, rules];

module inner_flip_gosper_curve(n = 3, angle = 60, w = 0.4)
{
    axiom = inner_flip_gosper_curve()[0];
    rules = inner_flip_gosper_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Curve Tree, src: 100hex
function gosper_curve_tree() = let(                                          //
    axiom = "X--X--X",                                                       //
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=" ] //
    )[axiom, rules];

module gosper_curve_tree(n = 3, angle = 60, w = 0.4)
{
    axiom = gosper_curve_tree()[0];
    rules = gosper_curve_tree()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper Hex, src: 100hex
function gosper_hex() = let( //
    axiom = "X",             //
    rules =
        [
            "X=-F++F-X-F--F+Y---F--F+Y+F++F-X+++F++F-X-F++F-X+++F--F+Y--",
            "Y=+F++F-X-F--F+Y+F--F+Y---F--F+Y---F++F-X+++F++F-X+++F--F+Y", "F="
        ] //
    )[axiom, rules];

module gosper_hex(n = 4, angle = 30, w = 0.4)
{
    axiom = gosper_hex()[0];
    rules = gosper_hex()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Quadratic Gosper, src: 100hex
function quadratic_gosper() = let( //
    axiom = "XF",                  //
    rules =
        [
            "X=XFX-YF-YF+FX+FX-YF-YFFX+YF+FXFXYF-FX+YF+FXFX+YF-FXYF-YF-FX+FX+YFYF-",
            "Y=+FXFX-YF-YF+FX+FXYF+FX-YFYF-FX-YF+FXYFYF-FX-YFFX+FX+YF-YF-FX+FX+YFY"
        ] //
    )[axiom, rules];

module quadratic_gosper(n = 3, angle = 90, w = 0.4)
{
    axiom = quadratic_gosper()[0];
    rules = quadratic_gosper()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Gosper Variation, src: 100hex
function gosper_variation() = let(                                            //
    axiom = "X",                                                              //
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ] //
    )[axiom, rules];

module gosper_variation(n = 5, angle = 60, w = 0.4)
{
    axiom = gosper_variation()[0];
    rules = gosper_variation()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Koch Snowflake Inverted, src: 100hex
function koch_snowflake_inverted() = let( //
    axiom = "F+F+F+F+F+F",                //
    rules = ["F=F+F--F+F"]                //
    )[axiom, rules];

module koch_snowflake_inverted(n = 2, angle = 60, w = 0.4)
{
    axiom = koch_snowflake_inverted()[0];
    rules = koch_snowflake_inverted()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Reflected Koch, src: 100hex
function reflected_koch() = let(                                             //
    axiom = "X",                                                             //
    rules = [ "X=XF+YF--XF-XF--XF--YFXF", "Y=XFYF++YF++YF+YF++XF-YF", "F=" ] //
    )[axiom, rules];

module reflected_koch(n = 3, angle = 60, w = 0.4)
{
    axiom = reflected_koch()[0];
    rules = reflected_koch()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead, src: 100hex
function sierpinski_arrowhead() = let(           //
    axiom = "X",                                 //
    rules = [ "X=YF+XF+YF", "Y=XF-YF-XF", "F=" ] //
    )[axiom, rules];

module sierpinski_arrowhead(n = 5, angle = 60, w = 0.4)
{
    axiom = sierpinski_arrowhead()[0];
    rules = sierpinski_arrowhead()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead Hexagon, src: 100hex
function sierpinski_arrowhead_hexagon() = let(                                    //
    axiom = (n % 2 == 0) ? "FYFF+FYFF+FYFF+FYFF+FYFF+FYFF" : "YF-YF+YF-YF+YF-YF", //
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ]                                          //
    )[axiom, rules];

module sierpinski_arrowhead_hexagon(n = 5, angle = 60, w = 0.4)
{
    axiom = sierpinski_arrowhead_hexagon()[0];
    rules = sierpinski_arrowhead_hexagon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Sierpinski Arrowhead Star, src: 100hex
function sierpinski_arrowhead_star() = let(                           //
    axiom = (n % 2 == 0) ? "YF-YF-YF-YF-YF-YF" : "YF+YF+YF+YF+YF+YF", //
    rules = [ "X=YF+XF+Y", "Y=XF-YF-X" ]                              //
    )[axiom, rules];

module sierpinski_arrowhead_star(n = 4, angle = 60, w = 0.4)
{
    axiom = sierpinski_arrowhead_star()[0];
    rules = sierpinski_arrowhead_star()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Lace, src: 100hex
function lace() = let(                                                                     //
    axiom = "X",                                                                           //
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ] //
    )[axiom, rules];

module lace(n = 6, angle = 30, w = 0.4)
{
    axiom = lace()[0];
    rules = lace()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Lace triangle, src: 100hex
function lace_triangle() = let(                                                            //
    axiom = "X",                                                                           //
    rules = [ "X=---W++F++YFW-", "Y=+ZFX--F--Z+++", "W=+++X--F--ZFX+", "Z=-YFW++F++Y---" ] //
    )[axiom, rules];

module lace_triangle(n = 5, angle = 30, w = 0.4)
{
    axiom = lace_triangle()[0];
    rules = lace_triangle()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Peano curve - root9, src: 100hex
function peano_curve() = let(       //
    axiom = "F",                    //
    rules = ["F=F+F-F-F-F+F+F+F-F"] //
    )[axiom, rules];

module peano_curve(n = 2, angle = 90, w = 0.4)
{
    axiom = peano_curve()[0];
    rules = peano_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Peano round corners, src: 100hex
function peano_round_corners() = let(                                                //
    axiom = "X",                                                                     //
    rules = [ "X=FX+FY+FX-FY-FX-FY-FX-FY-FX+FY+FX+FY+FX+FY+FX-FY-FX", "Y=FY", "F=" ] //
    )[axiom, rules];

module peano_round_corners(n = 3, angle = 45, w = 0.4)
{
    axiom = peano_round_corners()[0];
    rules = peano_round_corners()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Krishna, src: 100hex
function krishna() = let(  //
    axiom = "X",           //
    rules = ["X=XFX--XFX"] //
    )[axiom, rules];

module krishna(n = 4, angle = 45, w = 0.4)
{
    axiom = krishna()[0];
    rules = krishna()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet3, src: 100hex
function carpet3() = let(       //
    axiom = "F",                //
    rules = ["F=F+F-F-F-F++FF"] //
    )[axiom, rules];

module carpet3(n = 3, angle = 90, w = 0.4)
{
    axiom = carpet3()[0];
    rules = carpet3()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet5, src: 100hex
function carpet5() = let(                                                       //
    axiom = "L",                                                                //
    rules = [ "L=LF+RFR+FL-F-LFLFL-FRFR+", "R=-LFLF+RFRFR+F+RF-LFL-FR", "F=F" ] //
    )[axiom, rules];

module carpet5(n = 3, angle = 90, w = 0.4)
{
    axiom = carpet5()[0];
    rules = carpet5()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Pentaplexity, src: 100hex
function pentaplexity() = let(       //
    axiom = "F",                     //
    rules = ["F=F++F++F+++++F-F++F"] //
    )[axiom, rules];

module pentaplexity(n = 4, angle = 36, w = 0.4)
{
    axiom = pentaplexity()[0];
    rules = pentaplexity()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Pentadendrite, src: 100hex
function pentadendrite() = let( //
    axiom = "F",                //
    rules = ["F=F-F-F++F+F-F"]  //
    )[axiom, rules];

module pentadendrite(n = 3, angle = 72, w = 0.4)
{
    axiom = pentadendrite()[0];
    rules = pentadendrite()[1];
    L_system2(axiom, rules, n, angle, w);
}

// McWorter's Pentigree, src: 100hex
function mcworters_pentigree() = let(  //
    axiom = "F",                       //
    rules = ["F=+F++F----F--F++F++F-"] //
    )[axiom, rules];

module mcworters_pentigree(n = 4, angle = 36, w = 0.4)
{
    axiom = mcworters_pentigree()[0];
    rules = mcworters_pentigree()[1];
    L_system2(axiom, rules, n, angle, w);
}

// A bush, src: 100hex
function bush() = let(      //
    axiom = "F",            //
    rules = ["F=F-F+F+F-F"] //
    )[axiom, rules];

module bush(n = 4, angle = 90, w = 0.4)
{
    axiom = bush()[0];
    rules = bush()[1];
    L_system2(axiom, rules, n, angle, w);
}

// X-border2 - Joined Cross Curves, src: 100hex
function x_border_cross_curves() = let(                               //
    axiom = "Z+Z+Z+Z",                                                //
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYX" ] //
    )[axiom, rules];

module x_border_cross_curves(n = 4, angle = 90, w = 0.4)
{
    axiom = x_border_cross_curves()[0];
    rules = x_border_cross_curves()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Moore, src: 100hex
function moore_curve() = let(                                                    //
    axiom = "X",                                                                 //
    rules = [ "F=", "X=FX+FX+FXFYFX+FXFY-FY-FY-", "Y=+FX+FX+FXFY-FYFXFY-FY-FY" ] //
    )[axiom, rules];

module moore_curve(n = 3, angle = 90, w = 0.4)
{
    axiom = moore_curve()[0];
    rules = moore_curve()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Pajarita, src: 100hex
function pajarita() = let(                                   //
    axiom = "X",                                             //
    rules = [ "F=", "X=F-F-F+F+FX++F-F-F+F+FX--F-F-F+F+FX" ] //
    )[axiom, rules];

module pajarita(n = 4, angle = 60, w = 0.4)
{
    axiom = pajarita()[0];
    rules = pajarita()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Estrela4puntas, src: 100hex
function four_point_stars() = let( //
    axiom = "F",                   //
    rules = ["F=F+F+F++++F+F+F"]   //
    )[axiom, rules];

module four_point_stars(n = 3, angle = 45, w = 0.4)
{
    axiom = four_point_stars()[0];
    rules = four_point_stars()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Cross2, src: 100hex
function cross2() = let(    //
    axiom = "F",            //
    rules = ["F=F+F-F+F+F"] //
    )[axiom, rules];

module cross2(n = 3, angle = 90, w = 0.4)
{
    axiom = cross2()[0];
    rules = cross2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Cross3, src: 100hex
function cross3() = let(         //
    axiom = "F",                 //
    rules = ["F=FF-F-F-F-F-F+F"] //
    )[axiom, rules];

module cross3(n = 2, angle = 90, w = 0.4)
{
    axiom = cross3()[0];
    rules = cross3()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Mango Leaf, src: 100hex
function mango_leaf() = let(                                                  //
    axiom = "Y",                                                              //
    rules = [ "X={F-F}{F-F}--[--X]{F-F}{F-F}--{F-F}{F-F}--", "Y=F-F+X+F-FY" ] //
    )[axiom, rules];

module mango_leaf(n = 4, angle = 60, w = 0.4)
{
    axiom = mango_leaf()[0];
    rules = mango_leaf()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Maple-root9, src: 100hex
function maple_leaf() = let(            //
    axiom = "F",                        //
    rules = ["F=F--F++F++FF--F--F++FF"] //
    )[axiom, rules];

module maple_leaf(n = 3, angle = 60, w = 0.4)
{
    axiom = maple_leaf()[0];
    rules = maple_leaf()[1];
    L_system2(axiom, rules, n, angle, w);
}
// Maple2-root9, src: 100hex
function maple_leaf2() = let(                              //
    axiom = "F",                                           //
    rules = ["F=F--F++F++FF--F--F++FF--F++F++FF--F--F++F"] //
    )[axiom, rules];

module maple_leaf2(n = 2, angle = 60, w = 0.4)
{
    axiom = maple_leaf2()[0];
    rules = maple_leaf2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos4-rosas, src: 100hex
function rose_triangles() = let(                //
    axiom = "X",                                //
    rules = [ "X=+FX+FX+FX+FX+FX+FX+", "F=FF" ] //
    )[axiom, rules];

module rose_triangles(n = 4, angle = 60, w = 0.4)
{
    axiom = rose_triangles()[0];
    rules = rose_triangles()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonos1, src: 100hex
function hexagons() = let(                     //
    axiom = "X",                               //
    rules = [ "X=+XF+XF+XF+XF+XF+XF", "F=FF" ] //
    )[axiom, rules];

module hexagons(n = 4, angle = 60, w = 0.4)
{
    axiom = hexagons()[0];
    rules = hexagons()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Hexagonos2-estrelas, src: 100hex
function hexagon_star() = let(                  //
    axiom = "X",                                //
    rules = [ "X=+FX+FX+FX+FX+FX+FX", "F=FFF" ] //
    )[axiom, rules];

module hexagon_star(n = 3, angle = 60, w = 0.4)
{
    axiom = hexagon_star()[0];
    rules = hexagon_star()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos1-root4, src: 100hex
function triangles_var3() = let( //
    axiom = "F",                 //
    rules = ["F=F++FF--F"]       //
    )[axiom, rules];

module triangles_var3(n = 3, angle = 60, w = 0.4)
{
    axiom = triangles_var3()[0];
    rules = triangles_var3()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos2-root4, src: 100hex
function triangles_var4() = let(                         //
    axiom = "X",                                         //
    rules = [ "X=-FYFX++FYFX-", "Y=+YFXF--YFXF+", "F=" ] //
    )[axiom, rules];

module triangles_var4(n = 5, angle = 60, w = 0.4)
{
    axiom = triangles_var4()[0];
    rules = triangles_var4()[1];
    L_system2(axiom, rules, n, angle, w);
}

// 5dragon-root5, src: 100hex
function dragon_root() = let( //
    axiom = "F",              //
    rules = ["F=F+F+F-F-F"]   //
    )[axiom, rules];

module dragon_root(n = 4, angle = 90, w = 0.4)
{
    axiom = dragon_root()[0];
    rules = dragon_root()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Pinched 5_dragon-root5, src: 100hex
function pinched_dragon_root() = let(                        //
    axiom = "X",                                             //
    rules = [ "X=YF+YF+YF-YF-YF", "Y=XF-XF-XF+XF+XF", "F=" ] //
    )[axiom, rules];

module pinched_dragon_root(n = 4, angle = 90, w = 0.4)
{
    axiom = pinched_dragon_root()[0];
    rules = pinched_dragon_root()[1];
    L_system2(axiom, rules, n, angle, w);
}

// 5_Crazy dragon, src: 100hex
function crazy_dragon() = let(                                 //
    axiom = "X",                                               //
    rules = [ "X=-XF+YF-XF+YF+XF", "Y=FY-FX-FY+FX-FY+", "F=" ] //
    )[axiom, rules];

module crazy_dragon(n = 4, angle = 90, w = 0.4)
{
    axiom = crazy_dragon()[0];
    rules = crazy_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// 5_Pine, src: 100hex
function pine_dragon() = let(                                  //
    axiom = "X",                                               //
    rules = [ "X=-YF-XF-YF+XF-YF", "Y=FX+FY-FX+FY+FX+", "F=" ] //
    )[axiom, rules];

module pine_dragon(n = 4, angle = 90, w = 0.4)
{
    axiom = pine_dragon()[0];
    rules = pine_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Lazo, src: 100hex
function trefoil_knots() = let( //
    axiom = "F",                //
    rules = ["F=FF-F-"]         //
    )[axiom, rules];

module trefoil_knots(n = 7, angle = 60, w = 0.4)
{
    axiom = trefoil_knots()[0];
    rules = trefoil_knots()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Root8-BrainDragon variant, src: 100hex
function brain_dragon() = let(                                   //
    axiom = "X",                                                 //
    rules = [ "X=XFXF+XF+YF-XF-YF", "Y=FX+FY+FX-FY-FYFY", "F=" ] //
    )[axiom, rules];

module brain_dragon(n = 3, angle = 90, w = 0.4)
{
    axiom = brain_dragon()[0];
    rules = brain_dragon()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangular grid - root7, src: 100hex
function triangular_grid() = let(                                                    //
    axiom = "X",                                                                     //
    rules = [ "X=-YF++XF--YF++XFXF++YF--XF-", "Y=+YF++XF--YFYF--XF++YF--XF+", "F=" ] //
    )[axiom, rules];

module triangular_grid(n = 3, angle = 60, w = 0.4)
{
    axiom = triangular_grid()[0];
    rules = triangular_grid()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Sym_7_1-root7, src: 100hex
function triangles_var5() = let(                                             //
    axiom = "X",                                                             //
    rules = [ "X=FX++FXFY++FY--FXFX--FX", "Y=FX++FXFX++FY--FYFX--FX", "F=" ] //
    )[axiom, rules];

module triangles_var5(n = 3, angle = 60, w = 0.4)
{
    axiom = triangles_var5()[0];
    rules = triangles_var5()[1];
    L_system2(axiom, rules, n, angle, w);
}

// 8Filler-root8, src: 100hex
function octagons() = let(                                   //
    axiom = "X",                                             //
    rules = [ "X=XF+YF+XF+YF+XF", "Y=YF-XF-YF-XF-YF", "F=" ] //
    )[axiom, rules];

module octagons(n = 4, angle = 45, w = 0.4)
{
    axiom = octagons()[0];
    rules = octagons()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos-root9, src: 100hex
function triangles_var1() = let( //
    axiom = "F",                 //
    rules = ["F=F--F++F++F--FF"] //
    )[axiom, rules];

module triangles_var1(n = 3, angle = 60, w = 0.4)
{
    axiom = triangles_var1()[0];
    rules = triangles_var1()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Triangulos3-root9, src: 100hex
function triangles_var2() = let(                                                     //
    axiom = "X",                                                                     //
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ] //
    )[axiom, rules];

module triangles_var2(n = 2, angle = 60, w = 0.4)
{
    axiom = triangles_var2()[0];
    rules = triangles_var2()[1];
    L_system2(axiom, rules, n, angle, w);
}

// PeanoGosper-root13, src: 100hex
function peano_gosper() = let(                                                                               //
    axiom = "X",                                                                                             //
    rules = [ "X=YF+XF-YF-YFXF+XF+YF-XF+XF+YF-XF+YF-XF-", "Y=+YF+XF-YF+XF-YF-YF+FX-YF-YFXF+XF+YF-XF", "F=" ] //
    )[axiom, rules];

module peano_gosper(n = 2, angle = 90, w = 0.4)
{
    axiom = peano_gosper()[0];
    rules = peano_gosper()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Gosper-root13, src: 100hex
function gosper_tri() = let(                                                                                         //
    axiom = "X",                                                                                                     //
    rules = [ "X=YF+XF++XF-YF--YF+XFXF++XF+YF-XF+YF--YF-XF-", "Y=+YF+XF++XF-YF+XF-YF--YFYF-XF++XF+YF--YF-XF", "F=" ] //
    )[axiom, rules];

module gosper_tri(n = 2, angle = 60, w = 0.4)
{
    axiom = gosper_tri()[0];
    rules = gosper_tri()[1];
    L_system2(axiom, rules, n, angle, w);
}

// DragonLobulos, src: 100hex
function dragon_lobes() = let(                             //
    axiom = "X",                                           //
    rules = [ "X=--FXF+F+FYF--", "Y=++FXF-F-FYF++", "F=" ] //
    )[axiom, rules];

module dragon_lobes(n = 9, angle = 45, w = 0.4)
{
    axiom = dragon_lobes()[0];
    rules = dragon_lobes()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Carpet6, src: 100hex
function carpet6() = let(                              //
    axiom = "F",                                       //
    rules = [ "F=F-b+F-F-F-Fb-F+b-F+F+F+Fb+FF", "b=" ] //
    )[axiom, rules];

module carpet6(n = 2, angle = 90, w = 0.4)
{
    axiom = carpet6()[0];
    rules = carpet6()[1];
    L_system2(axiom, rules, n, angle, w);
}

// Peano variacion - root9, src: 100hex
function peano_variation1() = let(             //
    axiom = "F",                               //
    rules = [ "F=F+F-F-F-G+F+F+F-F", "G=FFF" ] //
    )[axiom, rules];

module peano_variation1(n = 2, angle = 90, w = 0.4)
{
    axiom = peano_variation1()[0];
    rules = peano_variation1()[1];
    L_system2(axiom, rules, n, angle, w);
}