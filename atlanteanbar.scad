module atlantean (wd, taper=false, hole=false) {
    unit = wd/19;
    
    bar(unit,hole);
    translate([0, 2*unit, 0])
    bar(unit);
    translate([0, -2*unit, 0])
    bar(unit);
    translate([14*unit, -(4*unit)/2, 0])
    triangle(unit, taper);
    translate([-5*unit, 3*unit, 0])
    rotate(a=180 )
    triangle(unit, taper);
    difference() {
        base(unit);
        cutout(unit);
    }
    
}

module bar(unit, mid=false) {
    if(mid) {
        difference() {
            cube([9*unit, unit, unit]);
            translate([(9*unit)/2,unit/2, -0.5])
            cylinder(h=unit+1, d=unit/2, $fn=25);
        }
    } else {
        cube([9*unit, unit, unit]);
    }
    translate([unit+(9*unit), 0, 0])
    cube([3*unit, unit, unit]);
    translate([-unit- 3*unit, 0, 0])
    cube([3*unit, unit, unit]);
}

function triPts(unit) = [[0,0], [0,5*unit], [6*unit, (5*unit)/2]];

function taperTriPts(unit) = concat(triPts(unit), [[0,0,unit], [0,5*unit, unit], [6*unit, (5*unit)/2, unit-(unit/golden())]]);
function golden() = (1+sqrt(5))/2;


module triangle(unit, fade=false) {
    if (fade) {
        polyhedron(points=taperTriPts(unit), faces=[[0,2,1], [3,4,5], [0,3,5,2],[1,2,5,4], [0,1,4,3]]);
    } else {
        linear_extrude(unit)
        polygon(points=triPts(unit));
    }
    
}

module base(unit) {
    translate([-13.5*unit, -3*unit, -golden()*unit])
    cube([36*unit, 7*unit, golden()*unit]);
    
}

module cutout(unit) {
    translate([20*unit+unit/4, unit/2, -2.5*unit])
    cylinder(h=5*unit, d=unit/2, $fn=25);
    translate([-11*unit-unit/4, unit/2, -2.5*unit])
    cylinder(h=5*unit, d=unit/2, $fn=25);
    translate([-11.25*unit, unit/4, -golden()*unit-1])
    cube([31.5*unit, unit/2, unit+1]);
}

atlantean(100, hole=true, taper=true);
