/*
 * 100hex.scad
 *
 * https://tecnoloxia.org/100hex/
 *
 * PDF: https://tecnoloxia.org/docs/100hex/L_system_100hex.pdf
 * Models: https://tecnoloxia.org/docs/100hex/L_system_100hex.scad
 */

use <../L-Systems.scad>

/****************************/
/* Parameters */
/****************************/

hex = 60; // side of the hexagon
h = 2;    // height of the hexagon
$fn = 32; // resolution

// Toggle select curve mode
module curva()
{
    if (polygon == false)
    {
        L_system2(axiom, rules, n, angle, w);
    }
    else
    {
        L_system_polygon(axiom, rules, n, angle, w);
    }
}

// Hexagon construction
linear_extrude(height = h)

    if (hexagono == true)
{

    if (diferenza == 0)
    {
        union()
        {
            difference()
            {
                circle(r = hex, $fn = 6);
                circle(r = hex - bordo / cos(30), $fn = 6);
            }
            if (lina > 0)
            { // para engadir liÃ±as
                translate([ -hex + bordo, -w / 2, 0 ]) union()
                {
                    square([ lina - w / 4, w ], center = false);
                    translate([ lina - w / 2, w / 2, 0 ]) circle(d = w);
                };
                translate([ hex - bordo - lina, -w / 2, 0 ]) union()
                {
                    translate([ w / 4, 0, 0 ]) square([ lina, w ], center = false);
                    translate([ w / 4, w / 2, 0 ]) circle(d = w);
                }
            }
            intersection()
            {
                circle(r = hex, $fn = 6);
                rotate(rot) translate([ xc, yc, 0 ]) curva();
            }
        }
    }

    else if (diferenza == 1)
    {
        difference()
        {
            circle(r = hex, $fn = 6);
            rotate(rot) translate([ xc, yc, 0 ]) curva();
        }
    }

    else if (diferenza == 2)
    {
        union()
        {
            difference()
            {
                circle(r = hex, $fn = 6);
                rotate(rot) translate([ xc, yc, 0 ]) L_system_polygon(axiom, rules, n, angle, w);
            }
            intersection()
            {
                circle(r = hex, $fn = 6);
                rotate(rot) translate([ xc, yc, 0 ]) L_system2(axiom, rules, n, angle, w);
            }
        }
    }
}
else
{
    rotate(rot) translate([ xc, yc, 0 ]) curva();
}