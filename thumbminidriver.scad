include <BOSL/constants.scad>
use <BOSL/masks.scad>

module cylinder_outer(height,radius,fn){
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);}
   
module circle_outer(radius,fn){
     fudge = 1/cos(180/fn);
     circle(r=radius*fudge,$fn=fn);}

module miniDriver() {
    difference() {
        union() {
            
            translate([0,0,10.19])
            cylinder(h=15.14, d=12.56);   
            translate([0,0,10.2])
            rotate([180,0,0])
            chamfer_hole_mask(d=12.5, chamfer=2);
            cylinder(h=10.2, d=27.86);
        }
        translate([0,0,15.14+10.19])
        chamfer_cylinder_mask(12.56/2, chamfer=.3);
        //translate([0,0,-.1])
        //cylinder(h=12, d=5.1);
    }
}

module deburTool() {
    translate([0,0,17.67]) 
    cylinder(h=6, d1=12.36);
    translate([0,0,11.68]) 
    difference() {
        cylinder(h=6, d=12.36);
        rotate([180,0,0])
        fillet_cylinder_mask(r=12.36/2, fillet=.5);
        
    }
    cylinder(h=11.7, d=7.36);
}

//%cutout();

module cutout() {
    scale(1.03)
    miniDriver();
    translate([0,0,24.05])
    scale(1.05)
    deburTool();
}
//miniDriver();

module overMold() {
    translate([0,0,1])
    cylinder(h=10, d=34.1, $fn=12);
    translate([0,0,11])
    cylinder(h=25, d1=34.1, d2=12.5, $fn=12);
}

difference() {
    overMold();
    cutout();
}


