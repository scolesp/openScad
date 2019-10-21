include <BOSL/constants.scad>
use <BOSL/transforms.scad>
$fn=120;
height=35;
module insideGusset(dia) {
    front_half(planar=true)
    rotate([0,0,45])
    translate([-1.5*dia/2, -1.5*dia/2])
    difference(){
    square(1.5*dia);
    circle(d=dia+2);
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

module screwHoles(dia) {
    mirror_copy([1,0,0]){
        translate([1.5*dia/2-1,-dia/4+1,height/4])
        rotate(a=-90, v=[1,1])
        screwHole(3.7,7.1, 29);
        translate([1.5*dia/2-1,-dia/4+1,3*height/4])
        rotate(a=-90, v=[1,1])
        screwHole(3.7,7.1, 29);
    }
}

module braceBody(dia){
    linear_extrude(height)
    difference() {
        insideGusset(dia);
        translate([0,-dia/2])
        offset(-3)
        back_half(planar=true)
        translate([0, -dia/2])
        rotate([0,0,45])
        square(1.5*dia);
       
    }
   
}

module fullCorner(dia, gusset=false) {
    difference() {
        union(){
            braceBody(dia);
            if (gusset==true) {
                translate([0,0,height/2-2])
                linear_extrude(4) 
                insideGusset(dia);
            }
        }
        screwHoles(dia);
    }
}

fullCorner(28);
