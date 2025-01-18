// Index file for the L-Systems library for blind import

// Global Settings with user override functionality
rounded_default = true; // Default rounded setting
fn_default = 16;        // Default fragment resolution

rounded = is_undef(USER_ROUNDED) ? rounded_default : USER_ROUNDED; // Override rounded setting
$fn = is_undef(USER_FN) ? fn_default : USER_FN;                     // Override fragment resolution

// Main file to include base library
include <src/LSystem2D.scad>;
include <src/LSystemPoly.scad>;

// Import all example curves implementations
include <examples/curves/L2Curves.scad>;
include <examples/curves/LPolyCurves.scad>;