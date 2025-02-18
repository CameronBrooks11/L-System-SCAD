use <../L-Systems.scad>;

// Lévy Dragon
module levy_dragon(n = 10, angle = 45, w = 0.4)
{
    L_system2("F", ["F=+F--F+"], n, angle, w);
}

linear_extrude(1) levy_dragon(n = 11, angle = 45, w = 0.6);