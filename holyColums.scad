resolution = 5 ;
coulumRadius = 10;

coulumHeight = 20;



module coulum(height = 20, holeSpaceing = .5, radius = 10, wallThickness  = .05, holeWidth = 3
){
    union(){
    difference(){
        translate([0,0,-height /4])
        cylinder(h = height, r1 = radius, r2 = radius, $fn = resolution);
        translate([0,0,-.5 - height/4])
        cylinder(h = height + 1, r1 = radius - wallThickness, r2 = radius - wallThickness, $fn = resolution);
        
    
        
        resize([10,7,height], auto = true){
        for (gap = [height/3:-holeSpaceing:0]){
            echo(gap);
            gapp = gap + gap * gap * .8;
            Gapp = gap /2 /gap * gap;
            up = (gapp + Gapp) /5;
            translate([-radius/1.8,-holeWidth*.9,gapp])
            cube([radius,holeWidth,Gapp ], center = true);
            
            translate([-radius/1.8,holeWidth*.9,gapp + up])
            cube([radius,holeWidth,Gapp], center = true);
        }
    }
   }

   }
   difference(){
       translate([radius * .01,0,-.2])
cylinder(h = .1, r1 = radius* 1.01, r2 = radius *1.01, $fn = resolution);   
       translate([0,0,-.5 - height/4])
       cylinder(h = height + 1, r1 = radius - wallThickness, r2 = radius - wallThickness, $fn = resolution);
   }      
}
coulum();

