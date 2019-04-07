//Globals

PImage dinoRun1, dinoRun2, dinoJump, smallCactus, manySmallCactus, bigCactus;


Dino d;
ArrayList<Obstacle> obstacleArray;
int obstacleTimer = 0, minDistance = 150, randomNum;
int score=0;


//-----------------------------------------------------------------------------------
void setup()
{
  frameRate(60);
  dinoRun1 = loadImage("dinorun0000.png");
  dinoRun2 = loadImage("dinorun0001.png");
  dinoJump = loadImage("dinoJump0000.png");
  
  smallCactus = loadImage("cactusSmall0000.png");
  bigCactus = loadImage("cactusBig0000.png");
  manySmallCactus = loadImage("cactusSmallMany0000.png");
  
  size(1000,500);
 d = new Dino();
 obstacleArray= new ArrayList<Obstacle>();
  
}
//---------------------------------------------------------------------------------
void draw()
{
  background(255);
  fill(255);
  rect(-10,450, 1100, 100);
  if(d.isAlive()){
    addObstacles();

  }
  d.updateSprite();
  d.drawSprite();
  updateObstacles();
  
  drawScore();
            

}
//---------------------------------------------------------------------------------------
public void drawScore(){
 text("Score:"+score, 930, 20); 
 if(d.isAlive()){
 score++;
 }
}
//------------------------------------------------------------------------------------
public void addObstacles()
{
  obstacleTimer++;
  randomNum = (int)random(75);
  //println("timer:" +obstacleTimer);
  if(obstacleTimer>minDistance+randomNum)
  {
    
    obstacleArray.add(new Obstacle((int)random(4)));
    obstacleTimer=0;
  }
}
//-----------------------------------------------------------------------------------
public void updateObstacles(){
ArrayList<Obstacle> removedObstacles= new ArrayList<Obstacle>();
for(Obstacle o:obstacleArray){
  o.update();
  if(o.getX() <-1*(o.getX())){
    removedObstacles.add(o);
  }
  if(d.isCollided(o.getX(), o.getY(), o.getW(), o.getH())){
   d.setAlive(false);
   d.setVelocity(0);
  }
  if(!d.isAlive()){
    o.setSpeed(0);
  }
// println("size:"+obstacleArray.size());
}

for(Obstacle o: removedObstacles){
  obstacleArray.remove(o);
}
}
//-----------------------------------------------------------------------------------------
public void reset()
{
 d.setAlive(true);
 score =0;
 obstacleArray.clear();
 d.setDinoY(400);
  
}

//---------------------------------------------------------------------------------
void keyPressed()
 {
   //print("A");
   if(keyCode==32&& d.getDinoY()>=400){
   
     d.setJump(true);
     
    }
   if(keyCode==ENTER){
    reset();
   }
 
 }
