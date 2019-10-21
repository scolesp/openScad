function tot_dist(arr, index) = index == 0 ? arr[index] : arr[index] + tot_dist(arr, index-1);


module finger(seg_wid, seg_dist, seg_ht) {
    if(is_list(seg_wid) && 
        is_list(seg_dist) && 
        is_list(seg_ht) &&
        len(seg_wid) == len(seg_ht) &&
        len(seg_dist) == len(seg_ht) -1) {
            
          hull(){
            difference() {
               union() {
                   for(i=[0:1:len(seg_wid) -1]) {
                       if (i!=0) {
                           translate([tot_dist(seg_dist, i-1),0,0])
                           scale([1,1,seg_ht[i]/seg_wid[i]])
                           sphere(r=seg_wid[i], center=true);
                       } else {
                           scale([1,1,seg_ht[i]/seg_wid[i]])
                           sphere(r=seg_wid[i], center=true);
                       };  
                   }
                };
           }
               
           }
            
     } else {
         echo("bad parameters");
     }

}

module shell(thickness=1.5) {
    difference() {
        minkowski() {
            children(0);
            sphere(r=thickness, center=true);
        }
        children(0);
    };

}




difference() {
shell(3){   
finger(seg_wid=[38,40,50], seg_dist=[50,55], seg_ht=[25,40,30]);
};
translate([0,0,-500])
    cube(1000, center= true);

translate([180,0,0])
rotate(a=22, v=[0,1,0])
    cube([120,120 ,100], center=true);
}


