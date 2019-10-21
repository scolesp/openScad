include <BOSL/constants.scad>
use <BOSL/transforms.scad>

$fn=120;

module fullCorner(dia, height) {
    difference() {
        cornerSupport(dia,height);
        union() {
            screwHoles(dia,height);
            rotate([0,0,45])
            //translate([0,0,dia/4-1])
            cube(dia, center=true);
        }
    }
}

module screwHole(body, head, ht, countersink = false) {
    if (countersink==true) {
        cylinder(h=3, d1=body, d2=head);
        translate([0,0,2.9])
        cylinder(h=ht-2, d=head);
    } else {
        cylinder(h=ht, d=head);
    }
    translate([0,0,-4])
    cylinder(h=5, d=body);
    
}
module screwHoles(dia, height) {
    mirror_copy([1,0,0]){
        translate([dia-3,-dia/2+3,height/2])
        rotate(a=-90, v=[1,1])
        screwHole(3.7,7.1, 29);
    }
}

module cornerSupport (dia, height) {
    front_half()
    translate([0,-dia/4 -dia/8, 0])
    rotate([0,0,45])
    linear_extrude(height)
    difference() {
        translate([dia/4, dia/4])
        square(dia*2, center = true);
        circle(d=dia);
    }
}

fullCorner(28,12);
