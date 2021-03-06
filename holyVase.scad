scaleFactor = 1;

resolution = 25 ;

holeHeight = .35;

holeSpaceing = .35;

segmentSize = holeSpaceing * 10 * scaleFactor;

roundingError  = .04;

wallThickness = .05;

module coulum(height = segmentSize , holeSpaceing = .3, holeHeight = .35, coulumGap = 1, wallThickness  = .05, bottomRadius = 10, topRadius = 9
){
    holeWidth = (bottomRadius+ topRadius)/6;
    
    difference(){
        translate([0,0,0])
        cylinder(h = height, r1 = bottomRadius, r2 = topRadius, $fn = resolution);
        translate([0,0,-roundingError/2])
        cylinder(h = height + roundingError , r1 = bottomRadius - wallThickness, r2 = topRadius - wallThickness, $fn = resolution);
        
    
        
        //resize([10,7,height], auto = true){
        for (stack = [height/2:-holeSpaceing:-holeSpaceing]){
            echo(stack);
            x = stack + stack ; 
            
            
            translate([-bottomRadius/1.5,-holeWidth* coulumGap, x ])
            cube([(bottomRadius + topRadius)/1.3, holeWidth,holeHeight ], center = true);
            
            translate([-bottomRadius/1.5,holeWidth*coulumGap, x - holeSpaceing])
            cube([(bottomRadius+ topRadius)/1.3, holeWidth,holeHeight], center = true);
        }
    //}
   }
   
   
 //////////////////////////////
   

        
}



module coulumHoleFill(height = segmentSize , holeSpaceing = .3, holeHeight = .35, coulumGap = 1, wallThickness  = .05, bottomRadius = 10, topRadius = 9
){
    holeWidth = (bottomRadius+ topRadius)/6;
    

   
   
 //////////////////////////////
   
   translate([0,0,holeSpaceing]){
   
   intersection(){
       difference(){
        translate([0,0,0])
        cylinder(h = height, r1 = bottomRadius, r2 = topRadius, $fn = resolution);
        translate([0,0,-roundingError/2])
        cylinder(h = height + roundingError , r1 = bottomRadius - wallThickness, r2 = topRadius - wallThickness, $fn = resolution);
       }     
    
        
        //resize([10,7,height], auto = true){
        for (stack = [height/2:-holeSpaceing:-holeSpaceing]){
            echo(stack);
            x = stack + stack ; 
            
            
            translate([-bottomRadius/1.5,-holeWidth* coulumGap, x ])
            cube([(bottomRadius + topRadius)/1.3, holeWidth,holeHeight ], center = true);
            
            translate([-bottomRadius/1.5,holeWidth*coulumGap, x - holeSpaceing])
            cube([(bottomRadius+ topRadius)/1.3, holeWidth,holeHeight], center = true);
        }
    //}
   
    }
}
        
}




union(){



   
points = [4,4,1,1.5,3,7,12,15,16,15,13,8,4,2,1,1];  

for (i = [0:1:len(points) -2]) {
   translate([0,0,segmentSize  * i]){
   coulum(bottomRadius = points[i] * scaleFactor, topRadius = points[i +1] * scaleFactor, holeSpaceing = holeSpaceing, holeHeight = holeHeight, wallThickness = wallThickness );
    //echo(i);
       
if (points[i] >= points[i + 1] ) { 
        translate([wallThickness*2,0,0])
   coulumHoleFill(bottomRadius = points[i] * scaleFactor, topRadius = points[i +1] * scaleFactor, holeSpaceing = holeSpaceing, holeHeight = holeHeight, wallThickness = wallThickness );
    
    }
    
if (points[i] < points[i + 1] ) { 
        translate([-wallThickness*2,0,0])
   coulumHoleFill(bottomRadius = points[i] * scaleFactor, topRadius = points[i +1] * scaleFactor, holeSpaceing = holeSpaceing, holeHeight = holeHeight, wallThickness = wallThickness );
    
    }
    
    
   }       
}
    
   
}












