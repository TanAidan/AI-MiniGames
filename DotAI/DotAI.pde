Population test;
public Goal g;
ObstaclePop p;

void setup(){
 size(800,800); 
p = new ObstaclePop();
 test= new Population(1000);
 g = new Goal(new PVector(400,10));
 
 p.addObstacle(400,600,400,10);
p.addObstacle(0,200,400,10);
p.addObstacle(200,400,300,10);
  
}
void draw(){
  background(255);
  fill(255,0,0);
  ellipse(g.getX(), g.getY(), 10,10);
  
 // fill(0,0,255);
 // rect(100,300,600,10);
  p.show();
  if(test.allDotsDead()){
    test.calculateFitness();
    test.naturalSelection();
    test.mutatePop();
    
  }
  test.update();
  test.show();
  
}
//-----------------------------------------------------------------------
