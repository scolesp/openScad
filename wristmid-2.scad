module wrist(majD, minD, wd, t) {
    intersection(){
        linear_extrude(wd+5)
        difference(){
            offset(r=t)
            scale([1,majD/minD])
            circle(d=minD);
            scale([1,majD/minD])
            circle(d=minD);
        }
        difference(){
            translate([minD,0,wd-minD/2+5])
            rotate([0,-90,0])
            linear_extrude(2*minD)
            union() {
                scale([1,.3+majD/minD])
                circle(d=minD);
                translate([-wd/2,0,0])
                scale([1,1+majD/minD])
                square([wd,minD], center=true);
            }
            translate([-(majD+10)/2, 0,((majD+10)/2+wd/2+13)])
            cube(majD+10, center=true);
        }
    }
}

module lacingMask(d, ht,t) {
    
    translate([-d/2,0,ht/2])
    cube([10,10, 2*ht],center=true);
    for(i=[1:3]) {
        translate([-d/2-5, -9,(3*ht+2*t)/4-i*8])
        rotate([0,90,0])
        cylinder(h=10, d=3, $fn=50);
        translate([-d/2-5, 9,(3*ht+2*t)/4-i*8])
        rotate([0,90,0])
        cylinder(h=10, d=3, $fn=50);
    }
}
difference(){
wrist(68, 48, 37, 4);
lacingMask(48, 37, 4);
}