use <../L-Systems.scad>;

// Lévy Dragon
module levy_dragon(n = 10, angle = 45, w = 0.4)
{
    L_System2D("F", ["F=+F--F+"], n, angle, w);
}

levy_dragon();