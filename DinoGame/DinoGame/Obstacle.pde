public class Obstacle{
private float x=1100, y, ground=450;
private float w =30,h =30;
PImage p;
private double speed;
int size;


public Obstacle(int size, double speed){
  this.size = size;
  this.speed = speed;
  switch(size){
    
    case 0: 
       p = smallCactus;
       w = p.width;
       h = p.height;
       y = ground-h;
       break;
    case 1:
       p = manySmallCactus;
       w = p.width;
       h = p.height;
       y=ground-h;
       break;
    case 2:
       p  = bigCactus;
       w = p.width;
       h = p.height;
       y= ground-h;
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
  image(p, x,y);
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
