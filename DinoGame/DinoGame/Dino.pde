import java.awt.Rectangle;
public class Dino{
private int dinoX = 50,dinoY=400, dinoW=30, dinoH = 50, ground =450, dinoCY;
private double gravity =0.70, velocity = 0 ;
private boolean jump=false, alive = true;
private int runCount = -5;
//------------------------------------------------------------------------------
//hmm I wonder what this does??? - jkjk, it updates the sprite for gravity, and if the space bar is pressed
void updateSprite(){
 if(dinoY<400)
 {
 velocity +=gravity;
 }
  else if(jump && dinoY>=400)
 {
   println("Dino Jumps");
  velocity=-14; 
  jump=false;
 }
 else {
  velocity=0;
  dinoY=400;
 }
 dinoY+=velocity;
 fill(0);

}
//--------------------------------------------------------------------------------------------

public void drawSprite(){
 if(dinoY >= 400){
  if(runCount<0){
    image(dinoRun1, dinoX, ground-dinoRun1.height);
    dinoW = dinoRun1.width;
    dinoH = dinoRun1.height;
    dinoCY = ground-dinoRun1.height;
  }
  else{
    image(dinoRun2, dinoX, ground-dinoRun2.height);
    dinoW = dinoRun2.width;
    dinoH = dinoRun2.height;
    dinoCY = ground-dinoRun2.height;

  }
 }
 else{
   image(dinoJump, dinoX, dinoY+(ground-dinoJump.height-400));
   dinoW = dinoJump.width;
    dinoH = dinoJump.height;
    dinoCY = dinoY+(ground-dinoJump.height-400);
 }
  runCount++;
  if(runCount>5){
   runCount=-5; 
  }
 

}
//---------------------------------------------------------------------------
//encapsulation

public void setDinoY(int y){
  dinoY = y;
}
public int getDinoY(){
 return dinoY; 
}
public boolean isJump(){
  return jump;
}
public void setJump(boolean j){
 jump=j; 
}
public void setAlive(boolean a)
{
  alive= a;
}
public boolean isAlive(){
 return alive; 
}
public void setVelocity(double v){
  velocity = v;
}
//----------------------------------------------------------------------
//collision method

public boolean isCollided(float cX, float cY, float cW, float cH)
{
  Rectangle r1 = new Rectangle((int)cX,(int)cY,(int)cW,(int)cH);
  Rectangle r2 = new Rectangle((int)dinoX+10,(int)dinoCY+10,(int)dinoW-40,(int)dinoH-20);
stroke(255,0,0);
fill(0,0);
  rect((int)dinoX+10,(int)dinoCY+10,(int)dinoW-40,(int)dinoH-20);
  rect((int)cX,(int)cY,(int)cW,(int)cH);
if(r1.intersects(r2))
{
  return true;
}
return false;
}
  
  //stroke(255,0,0, 0);
  
  /*
  float obstacleLeft = cX;
  float obstacleRight = cX+cW;
  float obstacleUp = cY;
  float obstacleDown = cY+cH;
  
  float dinoLeft = dinoX;
  float dinoRight = dinoX+dinoW;
  float dinoUp = dinoCY;
  float dinoDown = dinoCY+dinoH;
  rect(dinoLeft, dinoUp, dinoW, dinoH);
  if((dinoLeft<=obstacleRight && dinoRight>=obstacleLeft)|| (obstacleLeft<=dinoRight && obstacleRight>=dinoLeft)){
    if((dinoDown>=obstacleUp&& dinoUp<=obstacleDown) || (obstacleDown>=dinoUp && obstacleUp<=dinoDown))
   {
     return true;
   }
  }
  return false;
}
*/
}
