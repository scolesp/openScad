//158 total len
//116 top len
//42 mm bottom len
//20mm bottom dia

//printed like 22 mm toolong
// slot was way small
// real slot is like 16x5.5
//
//difference(){
//linear_extrude(20)
//
//scale([30/20,1])
//offset(r=3,$fn=120)
//circle(d=14, $fn=6);
//    translate([0,0,-1])
//linear_extrude(25)
//square([17,6.1], center=true);
//}

difference() {
    union(){
translate([0,0,8])
hull(){

    
translate([0,0,150])
linear_extrude(1)
scale([30/20,1])
offset(r=3,$fn=120)
circle(d=15, $fn=6);
translate([0,0,90])
linear_extrude(6)
offset(r=3,$fn=120)
scale([33/25, 1])
circle(d=18, $fn=8);
linear_extrude(1)
circle(d=21.5, $fn=120);
}
linear_extrude(8)
difference() {
circle(d=19.5, $fn=120);
circle(d=7);
}
}
//printed slot was 10.2x5.3
translate([0,0,7])
linear_extrude(158)
//origninal was 11,5.8
square([17,6.1], center=true);
}