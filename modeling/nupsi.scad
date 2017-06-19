c_height = 5;
c_diam = 19;
sc_diam = 3; // screw hole diameter, 4-40 screws
gs_diam = 5; // gearshaft hole diameter
sc_offset = 6.5;

difference() {
    cylinder(c_height, c_diam / 2, c_diam / 2, false);
    
    cylinder(c_height, gs_diam / 2, gs_diam / 2, false);
    
    translate([sc_offset, 0, 0]) cylinder(c_height, sc_diam / 2, sc_diam / 2, false);
    translate([-sc_offset, 0, 0]) cylinder(c_height, sc_diam / 2, sc_diam / 2, false);
    translate([0, sc_offset, 0]) cylinder(c_height, sc_diam / 2, sc_diam / 2, false);
    translate([0, -sc_offset, 0]) cylinder(c_height, sc_diam / 2, sc_diam / 2, false);
}