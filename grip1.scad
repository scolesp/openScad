difference() {
hull() {
cylinder (r = 10, h = 10);
translate ([0,0,100])
scale([1.5, 1, 1])
  sphere(r = 10);
translate ([0,0,200])
minkowski() {
	cube([20, 10, 1], center=true);
	cylinder(r=3);
};
}


translate([-5, -2, ,-5])
cube([10, 4, 230]);
}