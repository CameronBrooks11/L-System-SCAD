use <../L-Systems.scad>;

axiom = moore_square()[0];
rules = moore_square()[1];
n = 4;
angle = 80;
w = 1;
L_system2(axiom, rules, n, angle, w);