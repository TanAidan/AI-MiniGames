double x,y;

double gravity=0.5;
double velocity = 0;
int ground = 400;
boolean jump=false;
void setup()
{
  size(500,500);
  x= 50;
  y= 400;
  
}
void draw()
{
  background(255);
  fill(255);
  rect(-10,430, 550, 100);
  updateSprite();
            

}
void updateSprite(){
 if(y<400)
 {
 velocity +=gravity;
 }
 else if(y>=400){
  velocity=0; 
 }
 if(jump && y>=400)
 {
  velocity=-10; 
  jump=false;
 }
 y+=velocity;
 fill(0);
rect((int)x,(int)y, 30,30);

}
void keyReleased()
 {
   print("A");
   if(keyCode==32&&y>=400){
   
     jump=true;
     
    }
 
 }
