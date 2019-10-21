function fingerPts(w,l, pfac,mfac) = [[-(w/2),0],[(w/2),0],[pfac*(w/2), l], [pfac*(w/2)-3, l+10], [-(mfac*(w/2)-3), l+10],[-mfac*(w/2), l] ];



module finger(width, length, t,pfac,mfac) {
    translate([width/2, 0,-t/2])
    linear_extrude(t)
    polygon(points=fingerPts(width, length, pfac, mfac));
    
}

module cornerMask(r, t){
    scale(1.1)
    difference(){
        cube([2*r,2*r,t+2], center=true);
        translate([r, r])
        cylinder(h=t+3, r=r, center=true, $fn=50);
    }
    
}

module full(fw, hl, t){
    offset = 5;
    difference() {
        union() {
            children(0);
            for (i=[1:3]){
                xval=i*(fw +offset);
                translate([xval,0,0])
                children(i);
            }
            translate([0,-hl,-(t/2)])
            cube([3*(fw+offset)+fw,hl,t]);
            if ($children ==5) {
                translate([0,-(hl+fw),0])
                rotate([0,0,45])
                children(4);
                translate([0,-(hl+fw),-2])
                rotate([0,0,45])
                cube([3*fw,2*fw,t]);
            }
        }
        
        union() {
            for (i=[1:3]){
                xval=i*(fw + offset)-offset/2;
                translate([xval,0,0])
                cylinder(h=6, r=offset, center=true);
            }
            translate([0,-hl])
            cornerMask(offset, t);
            translate([3*(fw+offset)+fw,-hl])
            rotate([0,180,0])
            cornerMask(offset, t);
            
        }
    }
    
}


full (20, 35,3){
    finger(20,95,3,0.6,1);
    finger(20,105,3,0.6,0.9);
    finger(20,100,3,0.9,0.6);
    finger(20,75,3,1,0.6);
}