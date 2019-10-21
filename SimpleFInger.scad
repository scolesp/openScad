include <BOSL/constants.scad>
use <BOSL/transforms.scad>
$fn=120;
wall = 3;
module finger(d1, d2) {
    hull() {
        children(0);
        translate([-d1,0,0])
        children(1);
        translate([-d2,0,0])
        children(2);
    }
}

module tip(w, h) {
    rotate([90,0,0])
    rotate_extrude(angle=90)
    right_half(planar=true)
    scale([2*h/w,1])
    circle(d=w);
    
}

module segment(w,h) {
    rotate([0,-90,0])
    linear_extrude(3)
    right_half(planar=true)
    scale([2*h/w,1])
    circle(d=w);
}

difference() {
    minkowski() {
        render() {
            finger(25, 50){
                tip(28, 25);
                segment(30,30);
                segment(30,25);
            }
        }
        sphere(r=wall);
    }
    translate([-wall-.1,0,-wall-.1])
    scale([1+wall/36,1,1+wall/36])
    finger(25, 50){
        tip(28, 25);
        segment(30,30);
        segment(30,25);
    }
    
}