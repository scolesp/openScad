
//OD of 3/4 pvc is 27mm +1for learance = 28
module pipeLegBracket(dia) {
        difference() {
            hull() {
                translate([0,0,dia/2])
                cylinder(h=2, d= dia+6);
                linear_extrude(3)
                offset(r=12)
                square(dia, center=true);
            }
            translate([0,0,-1])
            cylinder(h=dia+2, d=dia);
            translate([-dia/2-3, -dia/2-3,3])
            screwHole(6.75,12.7, 29);
            translate([dia/2+3, -dia/2-3,3])
            screwHole(6.75,12.7, 29);
            translate([-dia/2-3, dia/2+3,3])
            screwHole(6.75,12.7, 29);
            translate([dia/2+3, dia/2+3,3])
            screwHole(6.75,12.7, 29);
        }
}

//1/4 free clear hole is 6.75mm ish
//head is 12.7 ish
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
pipeLegBracket(28);
//screwHole(6.75,12.7, 29);