public class Dot{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false, reachedGoal=false, isBest = false;
  
  float fitness=0;
  public Dot(){
   brain = new Brain(400);
   
   pos = new PVector(width/2, height-10);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
  }
  
  
  //---------------------------------------------------------------------------------
  
  void show(){
    if(isBest){
     fill(0,255,0); 
    }
    else{
   fill(0);
    }
   ellipse(pos.x, pos.y, 4,4);
  }
  
  //-----------------------------------------------------------------------------------
  
  void move(){
   if(brain.directions.length>brain.step){
   acc = brain.directions[brain.step];
   brain.step++;
   }
   else{
    dead = true; 
   }
   vel.add(acc); 
   vel.limit(5);
   pos.add(vel);
    
  }
  //----------------------------------------------------------------------------------------
  
public void update(){
    if(!dead && !reachedGoal){
      move();
      if(pos.x<2||pos.y<2||pos.x>width-2||pos.y>height-2)
      {
       dead=true; 
      }
      else if(dist(pos.x,pos.y, g.getX(), g.getY())<5){
        //if its reached the goal
        reachedGoal= true;
      }
      else if(p.hasCollided((int)pos.x, (int)pos.y, 2,2){
        
        
      }
    }
  
}
//----------------------------------------------------------------------------------------------
public void calculateFitness(){
  if(reachedGoal){
    fitness = 1.0/16.0+10000.0/(float)(brain.step*brain.step);
  }
  else{
  float distanceToGoal = dist(pos.x, pos.y, g.getX(), g.getY());
  fitness = 1.0/((float)Math.pow(distanceToGoal,2)); // squaring the distance amplifies the value of a small step towards the goal
  }
}

//-------------------------------------------------------------------------------------------------

Dot getBaby(){
 Dot baby = new Dot();
 baby.brain = brain.clone();
 return baby;
}
















}
