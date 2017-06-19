hole_radius = 6;
hole_diameter = hole_radius*2;
hole_distance = 10;
acrylic_thickness = 2;
foam_thickness = 10;
screwhole_radius = 2;
edge_distance = 5 + screwhole_radius * 2;
num_holes = 3;
ts_length = hole_diameter*num_holes + edge_distance*2 + hole_distance* (num_holes - 1);
ts_width = 2*edge_distance + hole_diameter;
rod_radius = 2;
gap = 10;
rod_length = 10;
motor_length = 36;
motor_width = 35;
motor_height = 35;
shaft_length = 22;
shaft_diam = 5;
prettify = 1;

module tubestrip(zpos=0) {
    translate([0,0,zpos]) difference () {
    cube([
        ts_length,
        ts_width,
        acrylic_thickness]);
    translate([hole_radius + edge_distance,
        hole_radius + edge_distance,
        -prettify]) cylinder(acrylic_thickness + 2*prettify, hole_radius, hole_radius, false); 
    translate([hole_radius + edge_distance + (hole_radius*2+hole_distance) * 1,
        hole_radius + edge_distance,
        -prettify]) cylinder(acrylic_thickness + 2*prettify, hole_radius, hole_radius, false); 
    translate([hole_radius + edge_distance + (hole_radius*2+hole_distance) * 2,
        hole_radius + edge_distance,
        -prettify]) cylinder(acrylic_thickness + 2*prettify, hole_radius, hole_radius, false);  
    }
}

color("white", alpha=0.5) tubestrip(zpos=0);
color("white", alpha=0.5) tubestrip(zpos=acrylic_thickness+foam_thickness);

// end plate for the two tube strips
color("white", alpha=0.5) translate([ts_length,0,0]) cube([acrylic_thickness, ts_width, foam_thickness+2*acrylic_thickness]);

// foam strip

color("black") translate([0, 0, acrylic_thickness]) cube([ts_length, ts_width,foam_thickness]);


// circular mounting plate for aluminum motor mount
backplate_radius = ts_width/2 + 4;
color("white") rotate([0, 90, 0]) translate([-(2*3+foam_thickness)/2, ts_width/2,-3]) cylinder(3, backplate_radius, backplate_radius, false);