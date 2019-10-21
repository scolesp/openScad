
function profilePts() = [[0,0], [20,0], [12.5,30], [15, 42], [19,85], [16,100], [18,104], [12.5,130], [10, 152], [0,152]];

difference() {
    cylinder(h=166, d1=50, d2=40);
    translate([0,0,-1])
    scale ([0.8,1.1,1.1])
    rotate_extrude(){
        union(){
            square([11,150]);
            translate([4,-4])
            offset(r=-4)
            polygon(points=profilePts());
        }
    }
}
