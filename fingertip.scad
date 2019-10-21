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

module shell(thickness=3) {
    difference() {
        minkowski() {
            children(0);
            sphere(r=thickness, center=true);
        }
        children(0);
    };

}


module genTip(seg_wid, seg_dist, seg_ht) {
    difference() {
        shell(3){   
            finger(seg_wid, seg_dist, seg_ht);
        };
     
    }
}

module genMask (l, h) {
    translate([0,0,-(h+1)])
    union(){
        difference() {
            linear_extrude(h+1)
            scale(1.1)
            projection(){
                children(0);
            }
            translate([-115,-100, h*2/3])
            linear_extrude(h/3+3, scale=1.6)
            square([100,200]);
        }
        
        translate([l+75,0,0])
        rotate(a=22, v=[0,1,0])
        cube([120,200 ,400], center=true);
    }
}
difference() {
    render() {
        genTip (seg_wid=[38,40,50], seg_dist=[50,75], seg_ht=[40,60,40]);
    }
    genMask(h=70, l=105){
        genTip (seg_wid=[38,40,50], seg_dist=[50,75], seg_ht=[40,60,40]);
    }
}

