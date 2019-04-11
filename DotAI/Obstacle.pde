public class Obstacle{
 int x,y,w,h;
 
 public Obstacle(int x, int y, int w, int h){
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
 }
 public void  update(){
   fill(0,0,255);
  rect(x,y,w,h);
 }
 
 public boolean collided(int oX, int  oY, int oW, int oH){
  if(oX-oW<x+w&& oX+oW> x && oY-oH<y+h && oY+oH>y){
    return true;
  }
  return false;
 }
  
}
