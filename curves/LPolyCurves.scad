use <../L_system.scad>;

/**
 * Example Module Definitions
 *
 * Below are examples of various L-systems implemented as modules.
 * Each module calls the L_system2 or L_system_polygon functions with specific rules.
 * Uncomment and adjust parameters as needed.
 */

// Koch Snowflake
module koch_snowflake(n = 4, angle = 60)
{
    L_system_polygon("F++F++F", ["F=F-F++F-F"], n, angle);
}