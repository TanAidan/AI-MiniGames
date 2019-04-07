public class Obstacle{
private float x=1100, y=400;
private float w =30,h =30;
PImage p;
private double speed=5;
int size;


public Obstacle(int size){
  this.size = size;
  switch(size){
    
    case 0: 
       w = 30;
       h = 25;
       break;
    case 1:
       w = 25;
       h = 35;
       break;
    case 2:
       w = 35;
       h = 45;
       break;
    case 3:
       y = 390;
       w = 20;
       h = 20;
       break;
       
  }
}
//-----------------------------------------------------------------------

public void update(){
  x-=speed;
  
  fill(0);
  if(size!=3){
  rect(x,450-h,w,h);
  }
  else{
  rect(x,y,w,h);
  }  

}

//----------------------------------------------------------------------------
public void setX(int x){
  this.x = x;
}

public void setY(int y){
  this.y=y;
}

public float getX(){
  return x;
}

public float getY(){
  if(size!=3){
  return 450-h;
  }
  else{
    return y;
  }
}

public float getW()
{
return w;  
}

public float getH(){
 return h; 
}
public void setSpeed(int s){
  speed = s;
}

}
