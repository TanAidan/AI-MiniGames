public class ObstaclePop{
  ArrayList<Obstacle> o;
public ObstaclePop(){
  o = new ArrayList<Obstacle>();
}

public void addObstacle(int x, int y, int w, int h){
 o.add(new Obstacle(x,y,w,h);
}

public void show(){
 for(Obstacle ob: o){
  ob.update(); 
 }
  
}
public boolean hasCollided(int x, int y, int w, int h){
 for(Obstacle ob:o){
  if(ob.collided(x,y,w,h)){
   return true; 
  }
 }
 return false;
}

}
