function offset() = [0,7,5,0];
function step(wd) = wd/4;
function polyPts(wd, d) = [[-d/2, offset()[0]], [step(wd), offset()[1]],[2*step(wd), offset()[2]],[3*step(wd)+d/2, offset()[3]]];


module knuckle(wd, ht, t) {
    
   
    for(i=[0:3]){
        translate([offset()[i], i*step(wd),offset()[i]])
        resize(newsize=[offset()[i]+(0.8*wd),2*ht,offset()[i]+2*ht])
        sphere(d=(2*ht));
    }
}

module mask (wd) {
    
    hull() {
        for(i=[0:3]){
            translate(concat([-wd/2],polyPts(wd,step(wd)-2)[i]))
            rotate([0,90,0])
            cylinder(h=wd, d=8);
        }
    }
    for(i=[0:3]){
        translate([offset()[i]+(0.3*wd), i*step(wd),offset()[i]])
        rotate([0,90,0])
        cylinder(h=wd, d=step(wd)-2);
    }
}
mask(100);
#knuckle(100, 30, 3);

        