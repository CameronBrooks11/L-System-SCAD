// User script showing how to override default values

// We can do this to make preview faster by disabling rounded corners
// and reducing fragment resolution which is useful while designing
USER_ROUNDED = false; // Disable rounded corners
USER_FN = 8;          // Set fragment resolution to 8
USER_DEBUG = true;    // Enable debug mode

include <../L-Systems.scad>;

// Lévy Dragon
module levy_dragon(n = 10, angle = 45, w = 0.4)
{
    L_system2("F", ["F=+F--F+"], n, angle, w);
}

levy_dragon();