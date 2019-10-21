include <threads.scad>
include <BOSL/constants.scad>
use <BOSL/masks.scad>

if ($preview == false) {
    $fn=120;
}
height=85;
width=40;
thickness=11;
function maskPoly(ht,wd) = [[-2,wd/2], [ht/5, wd], [4*(ht/5), 4*(wd/5)], [4*(ht/5)+0.15*ht, 2*wd], [-2, 2*wd]];

module outsideMask(ht,wd, t) {
    translate([0,0,-t])
        union(){
            difference() {
                linear_extrude(3*t)
                polygon(points = maskPoly(ht+5,wd));
                
                translate([4*(ht/5)+4, 4*(wd/5)])
                rotate([0,0,175])
                fillet_angled_edge_mask(h=t*4, r=5.5, ang=106, $fn=32, center=false);
            }
            translate([ht/5, wd, -t-3])
            rotate([0,0,-4])
            fillet_angled_edge_mask(h=t*4, r=20.0, ang=130, $fn=32, center=false);
        }
    
}

function jawProfile(ht, wd) = [[0,0], [0,wd], [.75*ht,wd], [ht, 0.6*wd], [ht,0]];

module topJaw(ht, wd, t) {
    linear_extrude(t)
    polygon(points=jawProfile(ht, wd));
}

module topShaft(ht,wd, t, clearance=.2, thread=false) {
    translate ([ht/3+3.5+t+3,-t/2-clearance/2, 1.5])
    cube([ht-(ht/3+3.5+t+3) +clearance, t+clearance, t-3+clearance]);
    translate([10-clearance, 0, t/2+clearance/2])
    rotate([0,90,0])
    if (thread == true) {
        metric_thread (diameter=t-4, pitch=2, length=ht/2, internal=false, square=true, leadin=3, test=$preview);
    } else {
        cylinder(h=ht-10+clearance, d=t-4+clearance, $fn=120);
    }
}

module insideMask(ht,wd, t) {
    translate([ht/3-(3.5+t)/2, -(t+3)/2, -1.5])
    cube(3+t);
    topShaft(ht,wd,t);
}

module adjustmentNut(t, clearance=.3) {
    difference() {
        cylinder(h=t+3 - clearance, d=t+3 - clearance, $fn=12);
        translate([0,0,-0.5])
        metric_thread (diameter=t-4+clearance, pitch=2, length=t+4, internal=true, square=true, leadin=3, test=$preview);
        
    }
}

module wrenchBody(ht,wd, t) {
    difference() {
        cube([ht,wd,t]);
        translate([0,2*wd/5,0])
        insideMask(ht,wd, t);
        union() {
            translate([0,-wd/5,0])
            outsideMask(ht,wd,t);
            translate([0,wd,t])
            rotate([180,0,0])
            outsideMask(ht,wd,t);
            }
    }
    
}
//$fn=120;
//translate([height/3-(3.2+thickness)/2, 5*(thickness-4)/2-1.5, 2+(thickness-4)/2])
//rotate([0,90,0])
//adjustmentNut(thickness);
translate([height,0,0])
topJaw(10, width, thickness);
translate([0+.2,2*width/5,0])
topShaft(height, width, thickness, clearance=0, thread=true);

//$vpr = [$t*(90), 20+$t*60, $t * (88)];

//insideMask(height, width, thickness);
//render(){
//wrenchBody(height, width, thickness);
//}