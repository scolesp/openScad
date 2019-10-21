module body(totalHt, diameter) {
    difference() {
        union() {
            cylinder (h=totalHt-3, d=diameter);
            translate([0,0,4])
            cylinder (h=totalHt-4, d=diameter-3);
            translate([0,0,totalHt])
            rotate_extrude()
            translate([(diameter-3)/2-0.4,0])
            circle(r=1.2 );
        }
        translate([0,0,4])
        cylinder (h=totalHt, d=diameter-4);
    }
}

module lid(diameter) {
    difference() {
        cylinder (h=6, d1=diameter,d2=diameter+(0.05*diameter));
        translate([0,0, -3.2])
        union() {
            cylinder (h=7, d=diameter-4);
            translate([0,0,6])
            rotate_extrude()
            translate([(diameter-3)/2-0.3,0])
            circle(r=1.1 );
        }
    }
}

lid(36);

