module crookHandle(length, opening, diameter, holeD) {
    $fn = 120;
    difference() {
        union() {
            rotate_extrude(angle=210, convexity=10)
               translate([(opening+diameter)/2, 0]) 
                circle(d=diameter);
            rotate([90,0,0])
            translate([(opening+diameter)/2, 0]) 
            difference() {
                cylinder(h=(length-((opening/2)+diameter)), d=diameter);
                translate([0,0,(length-(opening+diameter)/2)-20])
                cylinder(h=21, d=holeD);
            }
        }
        translate([-1/3*opening,0,-diameter])
        rotate([0,0,225])
        cube([opening, 2*diameter, 2*diameter]);
    }
}

module tip (id, od, len) {
    $fn=120;
    translate([0,0,-(len-1)])
    cylinder (h=len, d=id);
    cylinder(h=len, d1=od, d2=3/4*od);
}

//measurements from my crap umbrella
//tip(10.03, 14, 20);
//crookHandle(178, 88, 22, 14);