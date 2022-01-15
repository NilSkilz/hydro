

$fn=36*4;

threaded_rod = 8;

pipe_outer_radius = 104 / 2;
pipe_inner_radius = 96.5 / 2;

module end_cap() {
    
    wall_thickness = 2;
    lip_height = 10;
    bearing_radius = 22/2;
    
    // Base
    difference() {
        cylinder(h=wall+thickness, r=pipe_outer_radius+wall_thickness);
        cylinder(h=wall+thickness, r=pipe_inner_radius-wall_thickness);
    }
    
    // Outer wall
    difference() {
        cylinder(h=lip_height, r=pipe_outer_radius+wall_thickness);
        cylinder(h=lip_height, r=pipe_outer_radius);
    }
    
    // Inner wall
    difference() {
        cylinder(h=lip_height, r=pipe_inner_radius);
        cylinder(h=lip_height, r=pipe_inner_radius-wall_thickness);
    }
    
    // Center Bar
    
    difference() {
        translate([-pipe_inner_radius-2 + (2 * 2), -10, 0]) {
            cube([(pipe_inner_radius-2) * 2, 20, lip_height]);
        }
        translate([-pipe_inner_radius-2 + (2 * 2), -8, wall_thickness]) {
            cube([(pipe_inner_radius-2) * 2, 16, lip_height]);
        }
        cylinder(h=lip_height, r=22/2);
    }
    
    // Center Hole
    difference() {
        cylinder(h=lip_height, r=bearing_radius+wall_thickness);
        cylinder(h=lip_height, r=bearing_radius);
    }
    
    // Drill Hole
    difference() {
        cylinder(h=wall_thickness, r=bearing_radius+wall_thickness);
        cylinder(h=wall_thickness, r=5);
    }
}




end_cap();




