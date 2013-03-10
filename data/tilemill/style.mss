

#ziptotals,
#circles {
  [purchase_n = 2][length > 100000][zoom < 9],
  [purchase_n = 1][zoom < 9]{
  ::under {
   image-filters:agg-stack-blur(3,5);
   line-color:rgba(0,0,0,1); 
   line-offset:-1;
   line-gamma:1;
   [zoom < 6 ]{ line-width:3;}
   [zoom >= 9] {line-opacity:.1;}
  }
  ::whiteblur {
    line-color:#fff;
    line-opacity:.9;
    image-filters:agg-stack-blur(3,3);
    [zoom > 6] {  line-width:2; }
    [zoom <= 6] {line-width:2; line-opacity:.5;}
    line-gamma:1;
    [zoom >= 9] {line-opacity:.1;}
    }
   ::white {
    line-color:#fff;
    line-opacity:.4;
    [zoom > 6] {  line-width:1; }
    [zoom <= 6] {line-width:1; line-opacity:.5;}
    line-gamma:1;
    [zoom >= 9] {line-opacity:.1;}

    }
  line-color:rgba(255,255,255,.8);
  line-gamma:1;
    [zoom > 6][zoom < 9] {
      line-width:1.5; 
    }
      line-width:2;
      line-opacity:.3;
  line-cap:round;
  [zoom >= 9] {line-opacity:.4;}
  }
  ::top[zoom < 9] {
  line-width:1;
  line-color:#a7eaff;
  line-opacity:.5;
  image-filters:agg-stack-blur(1,1);
  line-gamma:1;
  }
}


#zipsumsasb {
   [zoom > 8] {
    building-height: [elev] * .8;
    [elev > 100000] { building-height: [elev] * .1; }
    building-fill:#49afcd;
    building-fill-opacity:1;
  }
  
 [zoom <= 8] {
    ::under[zoom > 6] {
      image-filters:agg-stack-blur(3,5);
      line-color:rgba(0,0,0,.2); 
      line-offset:1;
      line-width:2;
      line-gamma:1;
      line-comp-op:src-out;
    }
    polygon-fill:#49afcd;
    polygon-opacity:.9;
    [zoom < 6] { line-width:.5; }
    line-width:1;
    line-color:rgba(255,255,255,.9);
  }
}
