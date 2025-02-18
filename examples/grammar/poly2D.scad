// Example 2D Polygon Definitions
// TODO: extract all modules to the showcase file

// Koch Snowflake
function koch_snowflake() = let( //
    axiom = "F++F++F",           //
    rules = ["F=F-F++F-F"]       //
    )[axiom, rules];

module koch_snowflake(n = 4, angle = 60)
{
    axiom = koch_snowflake()[0];
    rules = koch_snowflake()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Segment Curve II, src: 100hex
function segment_x() = let(                                                //
    axiom = "F-F-F-F",                                                     //
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"] //
    )[axiom, rules];

module segment_x(n = 2, angle = 90)
{
    axiom = segment_x()[0];
    rules = segment_x()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Gosper Variation Tree, src: 100hex
function gosper_variation_tree() = let(                                       //
    axiom = "X--X--X",                                                        //
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ] //
    )[axiom, rules];

module gosper_variation_tree(n = 3, angle = 60)
{
    axiom = gosper_variation_tree()[0];
    rules = gosper_variation_tree()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Koch Snowflake Variant, src: 100hex
function koch_snowflake_variant() = let( //
    axiom = "F--F--F--F--F--F",          //
    rules = ["F=-F++F--F+"]              //
    )[axiom, rules];

module koch_snowflake_variant(n = 3, angle = 30)
{
    axiom = koch_snowflake_variant()[0];
    rules = koch_snowflake_variant()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Square Sierpinski, src: 100hex
function square_sierpinski() = let(    //
    axiom = "F+XF+F+XF",               //
    rules = ["X=XF-F+F-XF+F+XF-F+F-X"] //
    )[axiom, rules];

module square_sierpinski(n = 3, angle = 90)
{
    axiom = square_sierpinski()[0];
    rules = square_sierpinski()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// X-border - Joined Cross Curves, src: 100hex
function x_border_joined_cross_curves() = let(                            //
    axiom = "Z+Z+Z+Z",                                                    //
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYXYXYX" ] //
    )[axiom, rules];

module x_border_joined_cross_curves(n = 3, angle = 90)
{
    axiom = x_border_joined_cross_curves()[0];
    rules = x_border_joined_cross_curves()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Jaggy-Cross2, src: 100hex
function jaggy_cross() = let(                                 //
    axiom = "X+X+X+X",                                        //
    rules = [ "X=-YF-YFXF+XF+XF", "Y=FY-FY-FYFX+FX+", "F= " ] //
    )[axiom, rules];

module jaggy_cross(n = 4, angle = 90)
{
    axiom = jaggy_cross()[0];
    rules = jaggy_cross()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// Triángulos3a-root9, src: 100hex
function triangles_var6() = let(                                                     //
    axiom = "X++X++X",                                                               //
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ] //
    )[axiom, rules];

module triangles_var6(n = 2, angle = 60)
{
    axiom = triangles_var6()[0];
    rules = triangles_var6()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}

// root16-fractal1, src: 100hex
function fractal_var1() = let(                       //
    axiom = "X++X++X",                               //
    rules = [ "X=-YF+XF+XF-", "Y=+FY-FY-FX+", "F=" ] //
    )[axiom, rules];

module fractal_var1(n = 5, angle = 60)
{
    axiom = fractal_var1()[0];
    rules = fractal_var1()[1];
    L_System2D(axiom, rules, n, angle, poly = true);
}