module ring2(wd, ht, t=1.5) {
    
    $fn=100;
    
    difference() {
        cylinder(r=wd/2, h=ht);
        scale(1.01) import("voronoi1.stl");
        translate([0,0,-2])
        cylinder(r=wd/2 - t, h=ht+5);
    }

    translate([0,0, ht])
    difference(){
        cylinder(r=wd/2+0.25, h=t, center=true);
        cylinder(r=wd/2 - t, h=t+5, center=true);
    }
    
translate([0,0, t/2])
    difference(){
        cylinder(r=wd/2+0.25, h=t, center=true);
        cylinder(r=wd/2 - t, h=t+5, center=true);
    }
    
}


ring2(17.75, 15);