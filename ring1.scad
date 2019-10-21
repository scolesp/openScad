include <BOSL/constants.scad>
use <BOSL/transforms.scad>


module ring1(wd, ht, t=1.5) {
    $fn=50;
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


    
ring1(17.75, 15);