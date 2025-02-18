// Index file for the L-Systems library for blind import

// Global Settings with user override functionality
rounded_default = true;        // Default rounded setting
fn_default = 16;               // Default fragment resolution
debug_default = false;         // Default debug setting
debug_verbose_default = false; // Default verbose debug setting

// Adds circles to round corners when true
rounded = is_undef(USER_ROUNDED) ? rounded_default : USER_ROUNDED; // Override rounded setting
// Fragment resolution for curves
$fn = is_undef(USER_FN) ? fn_default : USER_FN; // Override fragment resolution
// Debug mode for library
debug = is_undef(USER_DEBUG) ? debug_default : USER_DEBUG; // Override debug setting
// Verbose debug mode for library (prints full coordinates)
debug_verbose =
    is_undef(USER_DEBUG_VERBOSE) ? debug_verbose_default : USER_DEBUG_VERBOSE; // Override verbose debug setting

// Main file to include base library
include <src/LSystem2D.scad>;

// Import all example curves implementations
include <examples/grammar/lines2d.scad>;
include <examples/grammar/poly2D.scad>;