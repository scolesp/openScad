include <BOSL/constants.scad>
use <BOSL/transforms.scad>
$fn=120;
module frog (back, openWd, openDepth, ht) {
    swordLoop(back, openWd, openDepth, ht);
    hull(){
        translate([0,(openDepth/4) +openDepth/16])
        backPiece(back, openWd, openDepth, ht);
        mountPlate(back, openWd, openDepth, ht);
    }
    translate([0,-(openDepth/2-.2), ht/2])
    rotate([90,0,0])
    nub(3);
    
}

module swordLoop(back, openWd, openDepth, ht) {
    linear_extrude(height=ht)
    difference() {
        offset(r=2)
        intersection() {
            square([openWd-4, openDepth-4], center=true);
            scale([2,1,1])
            circle(d=openDepth-4);
        }
        offset(r=2, $fn=120)
        intersection() {
            square([openWd-8, openDepth-8], center=true);
            scale([2,1,1])
            circle(d=openDepth-8);
        }
    }
}

module mountPlate(back, openWd, openDepth, ht) {
    translate([0,(openDepth/4) +openDepth/16, 2*ht/3])
    rotate([-90,0,0])
    linear_extrude(back+back/10)
    back_half(planar=true)
    circle(d=(3*openWd)/4);
    
}

module nub (dia) {
    translate([0,0,dia])
    sphere(d=dia);
    cylinder(h=dia+.3, d1=dia, d2=dia/2);
}

module backPiece(back, openWd, openDepth, ht) {
    translate([0,0,-10])
    linear_extrude(height=ht+10, scale=[1,4])
    back_half(planar=true)
    offset(r=3)
    square([openWd-6, back/4], center=true);
}

frog (20, 35, 30, 30);
//nub(3);
//backPiece(25, 30, 25, 20);