// Umbrella file for the L-Systems library: engine + predefined grammar catalog.
// Definitions only -- no top-level assignments, echoes, or geometry, so this
// file works identically via use or include.
//
// Settings are $-special variables, read at point of use:
//   $ls_rounded (default true)  - round line joints and caps with circles
//   $ls_debug   (default false) - echo intermediate tables/instructions/coords

include <l_system_2d.scad>;
include <grammars_2d.scad>;
