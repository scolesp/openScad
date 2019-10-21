include <BOSL/constants.scad>
use <BOSL/paths.scad>

function weightedAverage(item1, item2, weight) = item1 * (1.0 - weight) + (item2 * weight * 1.0);

function percent (partial, whole) = partial / whole;

function tot_dist(arr, index) = index == 0 ? arr[index] : arr[index] + tot_dist(arr, index-1);

function ribPts(wd, ht, r=false, rt=3) = [ for(t = [0:$fs:180]) r == true && t > 60 && t < 120 ? [cos(t)*(wd+rt) ,sin(t)*(ht+rt)] : [cos(t)*wd ,sin(t)*ht] ];


module rib(wd, ht, t=5, r=false) {
    polygon(points = concat(ribPts(wd,ht), ribPts(wd+t,ht+t,r)));
}

function fullRibPts(wd, ht, t=5, r=true) = concat(ribPts(wd,ht), ribPts(wd+t,ht+t,r));


module finger(seg_dist) {
    rotate_extrude(angle=90) 
    rotate(90, [0,0,1]) children(0);
   
    for(c = [1:1:$children-1]) {
        translate([tot_dist(seg_dist, c-1),0,0])
          rotate(180, [1,0,0]) rotate(90, [0,1,0]) children(c);
    }
    
}


module loft(s1wd, s1ht, s2wd, s2ht, dist, slices, rib=true) {
    sliceHeight = dist / slices;
    echo(sliceHeight);
    for (i = [0 : slices]) {
        translate ([0,0,sliceHeight * i])
        linear_extrude(sliceHeight)
        scale ( [ 1+weightedAverage( s1wd, s2wd, percent (i, slices))/(s1wd*slices), 
                  1+weightedAverage( s1ht, s2ht, percent (i, slices))/(s1ht*slices), 0])
        polygon (points = weightedAverage (fullRibPts(s1wd,s1ht), fullRibPts(s2wd,s2ht), (percent (i, slices))));
    }
}

module joint(wd,ht, thick) {

        linear_extrude(thick)
        rib(wd, ht, r= true);

}

function ribPts3d(wd, ht, z, r=false, rt=2) = [ for(t = [0:$fs:180]) r == true && t > 60 && t < 120 ? [cos(t)*(wd+rt) ,sin(t)*(ht+rt),z] : [cos(t)*wd ,sin(t)*ht,z] ];
    
function ribChamferPts3d(wd,ht,top=true) = concat(ribPts3d(wd+1, ht+1, 0), ribPts3d(wd-1, ht-1, 2), ribPts3d(wd+1, ht+1, 4),ribPts3d(wd-1, ht-1, 4));



function faceLen() = 180 / $fs + 1 ;
    linear_extrude(5)
    rib(20,30,r=true);
    
    


