include <BOSL/constants.scad>
use <BOSL/transforms.scad>


module ring1(wd, ht, t=1.5) {
    
    $fn=100;
    rotate_extrude()
    translate([wd/2+t,0,0])
    circle(t);
    translate([0,0,ht])
    rotate_extrude()
    translate([wd/2+t,0,0])
    circle(t);
    
    linear_extrude(ht, twist=100)
    zring(5, wd/2+t) {
        circle(t-.5);
    }
    
    linear_extrude(ht, twist=-25)
    rotate([0,0,20])
    zring(5, wd/2+t) {
        circle(t-.5);
    }
  
    
}

module ring2(wd, ht, t=1.5) {
    
    $fn=100;
    
    difference() {
    scale(1.01) import("voronoi1.stl");
    cylinder(r=wd/2, h=ht);
    }

    
}

import("voronoi1.stl");

ring2(17.75, 15);
    
//ring1(17.75,15);