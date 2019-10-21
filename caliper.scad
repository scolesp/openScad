module caliperShape(length) {
    difference() {
        offset(10)
        hull() {
       
        circle(d=length);
        translate([length,0])

        circle(d=20);
        }
        hull() {
       
        circle(d=length);
        translate([length,0])

        circle(d=20);
        }
    }
    translate([length+10,0])
    circle(d=20);
}

module caliperLeg(length) {
    difference(){
        caliperShape(length);
        union(){
            difference(){
                translate([0,-(3*length)/2])
                square(3*length, center=true);
                translate([length+10,0])
                circle(d=20);
            }
            translate([-length/2+12 +2,0])
            circle(d=40);
            translate([length+10,0])
            circle(d=6.4);
        }
    }
}
linear_extrude(3)
caliperLeg(150);