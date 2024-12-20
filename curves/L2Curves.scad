use <../L_system.scad>;

/**
 * Example L2 Module Definitions
 *
 * Below are examples of various L-systems implemented as modules.
 * Each module calls the L_system2 or L_system_polygon functions with specific rules.
 * Uncomment and adjust parameters as needed.
 */

// Dragon Curve
module dragon_curve(n = 10, angle = 90, w = 0.4)
{
    L_system2("FX", [ "X=X+YF+", "Y=-FX-Y" ], n, angle, w);
}

// Twin Dragon
module twin_dragon(n = 10, angle = 90, w = 0.4)
{
    L_system2("FX+FX+", [ "X=X+YF", "Y=FX-Y" ], n, angle, w);
}

// Terdragon
module terdragon(n = 10, angle = 120, w = 0.4)
{
    L_system2("F", ["F=F+F-F"], n, angle, w);
}

// Hilbert Curve
module hilbert_curve(n = 4, angle = 90, w = 0.4)
{
    L_system2("A", [ "A=-BF+AFA+FB-", "B=+AF-BFB-FA+" ], n, angle, w);
}

// Moore Curve
module moore_curve(n = 4, angle = 90, w = 0.4)
{
    L_system2("LFL+F+LFL", [ "L=-RF+LFL+FR-", "R=+LF-RFR-FL+" ], n, angle, w);
}

// Peano Curve
module peano_curve(n = 3, angle = 90, w = 0.4)
{
    L_system2("L", [ "L=LFRFL-F-RFLFR+F+LFRFL", "R=RFLFR+F+LFRFL-F-RFLFR" ], n, angle, w);
}

// Gosper Curve
module gosper_curve(n = 4, angle = 60, w = 0.4)
{
    // Final pass, convert A and B to (F)orward instructions
    L_system2("A", [ "A=A-B--B+A++AA+B-", "B=+A-BB--B-A++A+B" ], n, angle, w, "AB");
}

// Levy C Curve
module levy_c_curve(n = 10, angle = 45, w = 0.4)
{
    L_system2("F", ["F=+F--F+"], n, angle, w);
}

// Koch Curve
module koch_curve(n = 4, angle = 60, w = 0.4)
{
    L_system2("F", ["F=F-F++F-F"], n, angle, w);
}

// Quadratic Type 1 Koch
module quadratic_type1_koch(n = 4, angle = 90, w = 0.4)
{
    L_system2("F", ["F=F-F+F+F-F"], n, angle, w);
}

// Quadratic Type 2 Koch
module quadratic_type2_koch(n = 4, angle = 90, w = 0.4)
{
    L_system2("F", ["F=F-F+F+FF-F-F+F"], n, angle, w);
}

// Sierpinski Triangle
module sierpinski_triangle(n = 5, angle = 120, w = 0.2)
{
    L_system2("F-G-G", [ "F=F-G+F+G-F", "G=GG" ], n, angle, w, "FG");
}

// Sierpinski Arrowhead
module sierpinski_arrowhead(n = 6, angle = 60, w = 0.4)
{
    L_system2("XF", [ "X=YF+XF+Y", "Y=XF-YF-X" ], n, angle, w);
}

// Island Curve
module island_curve(n = 10, angle = 90, w = 0.4)
{
    L_system2("F-F-F-F", [ "F=F-b+FF-F-FF-Fb-FF+b-FF+F+FF+Fb+FFF", "b=bbbbbb" ], n, angle, w, "F", "b");
}

// Penrose Tiling
module penrose_tiling(n = 2, angle = 36, w = 0.2)
{
    L_system2("[7]++[7]++[7]++[7]++[7]",
              [
                  "6=81++91----71[-81----61]++", "7=+81--91[---61--71]+", "8=-61++71[+++81++91]-",
                  "9=--81++++61[+91++++71]--71", "1="
              ],
              n, angle, w, "6789");
}

// Pentadendrite
module pentadendrite(n = 2, angle = 72, w = 0.2)
{
    L_system2("F-F-F-F-F", ["F=F-F-F++F+F-F"], n, angle, w);
}

// Icy Pattern
module icy(n = 2, angle = 90, w = 0.5)
{
    L_system2("F+F+F+F", ["F=FF+F++F+F"], n, angle, w);
}

// Tree
module tree(n = 2, angle = 36, w = 0.1)
{
    L_system2("F", ["F=F[+FF][-FF]F[-F][+F]F"], n, angle, w, "F", "F", 90);
}

// Round Star
module round_star(n = 7, angle = 77, w = 0.001)
{
    L_system2("F", ["F=F++F"], n, angle, w);
}

// Fractal Plant
module fractal_plant(n = 4, angle = 25, w = 0.1)
{
    L_system2("X", [ "X=F+[[X]-X]-F[-FX]+X", "F=FF" ], n, angle, w, "FX");
}


// New Modules

// Minkowski Curve
module minkowski_curve(n = 4, angle = 90, w = 0.4) {
    L_system2("F", ["F=F+F-F-F+F"], n, angle, w);
}

// Vicsek Fractal
module vicsek_fractal(n = 3, angle = 90, w = 0.4) {
    L_system2("F", ["F=F-F+F+FF-F-F+F"], n, angle, w);
}

// Koch Island
module koch_island(n = 4, angle = 60, w = 0.4) {
    L_system2("F++F++F++F", ["F=F-F++F-F"], n, angle, w);
}

// Fractal Vine
module fractal_vine(n = 5, angle = 25, w = 0.2) {
    L_system2("F", ["F=F[+F]F[-F]F"], n, angle, w, "F", "F");
}

// Spiral Curve
module spiral_curve(n = 5, angle = 30, w = 0.3) {
    L_system2("F", ["F=F+F-F"], n, angle, w);
}

// Hexagonal Spiral
module hexagonal_spiral(n = 6, angle = 60, w = 0.3) {
    L_system2("F", ["F=F+F-F"], n, angle, w);
}

// Square Fractal
module square_fractal(n = 4, angle = 90, w = 0.4) {
    L_system2("F+F+F+F", ["F=F+F-F-F+F"], n, angle, w);
}