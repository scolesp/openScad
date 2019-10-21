module wrist(majD, minD, wd, t) {
    difference() {
        intersection(){
            linear_extrude(wd+5)
            difference(){
                offset(r=t)
                scale([1,majD/minD])
                circle(d=minD);
                scale([1,majD/minD])
                circle(d=minD);
            }
        translate([-minD,0,wd/2+t/2+1])
          rotate([0,90,0])
          linear_extrude(2*minD)
          offset(r=t)
          scale([1,majD/minD+0.4])
          circle(d=wd);
        }
        translate([-minD,0,wd+5])
        rotate([0,90,0])
        scale([1,4*majD/minD])
        cylinder(h=minD, d=minD/2);
        translate([-minD,0,0])
        rotate([0,90,0])
        scale([1,4*majD/minD])
        cylinder(h=minD, d=minD/2);
       
    }
}

module lacingMask(d, ht,t) {
    
    translate([-d/2,0,ht/2])
    cube([10,10, 2*ht],center=true);
    for(i=[-1:2:1]) {
        translate([-d/2-5, -9,(ht+t)/2+i*4])
        rotate([0,90,0])
        cylinder(h=10, d=3, $fn=50);
        translate([-d/2-5, 9,(ht+t)/2+i*4])
        rotate([0,90,0])
        cylinder(h=10, d=3, $fn=50);
    }
}

//lacingMask(45,38);
difference() {
    minkowski(){
        sphere(2);
        wrist(66, 46, 37, 1);
    }
    lacingMask(46, 37,3);
}