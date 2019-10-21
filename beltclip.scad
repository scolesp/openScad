module fullClip(ht, wd, cap, t) {
    difference() {
        linear_extrude(wd)
        difference() {
            offset(r=t)
            square([cap, ht]);
            square([cap, ht]);
        }
        union() {
            translate([-1,ht/4, wd/2])
            screwHole(wd, 11, 4.5);
            translate([-1,3*ht/4, wd/2])
            screwHole(wd, 11, 4.5);
        }
        translate([cap/2,0,wd -sqrt(((cap)*(cap))/2)])
        rotate([0,-45,0])
        cube(ht);
        translate([cap/2,0,sqrt(((cap)*(cap))/2)])
        rotate([0,135,0])
        cube(ht);
    }
    
    
}

module screwHole(length, head, shank) {
    rotate([0,90,0])
    union() {
        cylinder(h=length, d=head, $fn=50);
        translate([0,0,-length])
        cylinder(h=length, d=shank, $fn=50);
    }
}
//rotate([0,90,0])
//screwHole(10, 10, 5);
fullClip(38, 20, 6, 2);


