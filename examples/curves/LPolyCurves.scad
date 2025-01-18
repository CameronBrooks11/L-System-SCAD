// Example 3D Polygons Definitions

// Koch Snowflake
module koch_snowflake(n = 4, angle = 60)
{
    axiom = "F++F++F";
    rules = ["F=F-F++F-F"];
    L_system_polygon(axiom, rules, n, angle);
}

// Segment Curve II, src: 100hex
module segment_x(n = 2, angle = 90)
{
    axiom = "F-F-F-F";
    rules = ["F=F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F"];
    L_system_polygon(axiom, rules, n, angle);
}

// Gosper Variation Tree, src: 100hex
module gosper_variation_tree(n = 3, angle = 60)
{
    axiom = "X--X--X";
    rules = [ "X=FX+YF++YF-FX--FXFX-YF+", "Y=-FX+YFYF++YF+FX--FX-FY", "F=F" ];
    L_system_polygon(axiom, rules, n, angle);
}

// Koch Snowflake Variant, src: 100hex
module koch_snowflake_variant(n = 3, angle = 30)
{
    axiom = "F--F--F--F--F--F";
    rules = ["F=-F++F--F+"];
    L_system_polygon(axiom, rules, n, angle);
}

// Square Sierpinski, src: 100hex
module square_sierpinski(n = 3, angle = 90)
{
    axiom = "F+XF+F+XF";
    rules = ["X=XF-F+F-XF+F+XF-F+F-X"];
    L_system_polygon(axiom, rules, n, angle);
}

// Square Sierpinski 45, src: 100hex
module square_sierpinski(n = 9, angle = 45)
{
    axiom = "X--F--X--F";
    rules = [ "X=+Y-F-Y+", "Y=-X+F+X-" ];
    L_system_polygon(axiom, rules, n, angle);
}

// X-border - Joined Cross Curves, src: 100hex
module x_border_joined_cross_curves(n = 3, angle = 90)
{
    axiom = "Z+Z+Z+Z";
    rules = [ "F=", "X=FX+FX+FXFY-FY-", "Y=+FX+FXFY-FY-FY", "Z=XYXYXYX" ];
    L_system_polygon(axiom, rules, n, angle);
}

// Jaggy-Cross2, src: 100hex
module jaggy_cross(n = 4, angle = 90)
{
    axiom = "X+X+X+X";
    rules = [ "X=-YF-YFXF+XF+XF", "Y=FY-FY-FYFX+FX+", "F= " ];
    L_system_polygon(axiom, rules, n, angle);
}

// Triángulos3a-root9, src: 100hex
module triangles_var6(n = 2, angle = 60)
{
    axiom = "X++X++X";
    rules = [ "X=-YFXF++XFYFXF++XFYF--YFXF-", "Y=+YFXF++XFYF--YFXFYF--YFXF+", "F=" ];
    L_system_polygon(axiom, rules, n, angle);
}

// root16-fractal1, src: 100hex
module fractal_var1(n = 5, angle = 60)
{
    axiom = "X++X++X";
    rules = [ "X=-YF+XF+XF-", "Y=+FY-FY-FX+", "F=" ];
    L_system_polygon(axiom, rules, n, angle);
}