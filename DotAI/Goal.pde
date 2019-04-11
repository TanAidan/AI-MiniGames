public class Goal{
  
 PVector p;
 float x,y;
 
 
 public Goal(PVector p)
 {
  this.p = p; 
  x = this.p.x;
  y = this.p.y;
 }
 
 //--------------------------------------------------------------------------------------
 public PVector getP(){
   return p;
 }
 
 public void setP(PVector p){
  this.p = p; 
 }
 
 public float getY(){
  return y; 
 }
 public float getX(){
  return x;
 }
 
 public void setY(float y){
  this.y = y; 
 }
 public void setX(float x){
  this.x = x; 
 }
  
  
  
}
