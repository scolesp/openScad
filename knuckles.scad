include <BOSL/constants.scad>
use <BOSL/transforms.scad>

function step(wd) = wd/4;
$fn=120;

module profile(wd) {
    
  
    translate([step(wd),0])
    circle(step(wd));
    translate([2*step(wd),0])
    circle(step(wd)+7);
    translate([3*step(wd),0])
    circle(step(wd)+5);
    translate([4*step(wd),0])
    circle(step(wd));


}

module knuckle(wd) {
    
    rotate([-90,0,0])
    rotate_extrude(angle=120)
    rotate([0,0,90])
    translate([3,0,0])
    back_half(planar=true, s=3*wd)

    difference() {
        hull() {
            offset(3)
            profile(wd);
        }
       
        hull() {
            profile(wd);
        } 
    }
}

knuckle(105);

        
