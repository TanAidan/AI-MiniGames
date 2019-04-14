class Population{
Dot[] dots;
float fitnessSum=0;
int gen = 0;
ArrayList<Integer> bestScores;

boolean complete = false;

int bestDot = 0;
int bestSteps = 400;

Population(int size){
 dots = new Dot[size];
 bestScores = new ArrayList<Integer>();
 for(int i =0; i<dots.length;i++){
  dots[i] = new Dot(); 
 }
}

//-------------------------------------------------------------------------------------

void show(){
 for(int i=1;i<dots.length;i++)
 {
   dots[i].show();
 }
 dots[0].show();
}

//---------------------------------------------------------------------------------------

void update(){
 for(int i =0; i<dots.length;i++)
 {
  if(dots[i].brain.step>bestSteps){
    dots[i].dead =true;
  }
  else{
  dots[i].update();
  }
 }
  
}
  
  //-----------------------------------------------------------------------------------
  
  void calculateFitness(){
   for(int i =0; i<dots.length; i++){
    dots[i].calculateFitness(); 
   }
  }
  
  //------------------------------------------------------------------------------------------
  
  boolean allDotsDead(){
   for(int i=0; i<dots.length;i++){
     if(!dots[i].dead && !dots[i].reachedGoal){
       return false;
     }
   }
   return true;
  }
  
  //-------------------------------------------------------------------------------------------------
  

  
  //------------------------------------------------------------------------------------------------
  
  public void naturalSelection(){
    
    if(calculateDifference()){  
    complete = true;
    }
    if(complete){
    Dot[] lastDot = new Dot[1];
    lastDot[0]= dots[0].getBaby();
    dots= lastDot;
    dots[0].isBest = true;
    
    }
    else{
   Dot[] newDots = new Dot[dots.length];
   selectBestDot();
   calculateFitnessSum();
   
   newDots[0] = dots[bestDot].getBaby();
   newDots[0].isBest = true;
   for(int i =1; i<newDots.length;i++){
     //select parent based on fitness
     Dot parent = selectParent();     
     
     //get a mutated new generation from them
     newDots[i] = parent.getBaby();
   }
   
   dots = newDots;
   gen++;
    }
  }
  
  //----------------------------------------------------------------------------------------------------
 
   void calculateFitnessSum(){
    fitnessSum = 0;
    
    for(int i =0; i<dots.length; i++){
     fitnessSum+= dots[i].fitness;
    }
     
   }
  
  
  //---------------------------------------------------------------------------------------------------------------
  Dot selectParent(){
    float rand = random(fitnessSum);
    
    float runningSum = 0;
    
    for(int i = 0; i<dots.length; i++){
      runningSum+=dots[i].fitness;
      if(runningSum>rand){
       return dots[i]; 
      }
    }
    
    //should never get to this point
    
    return null;
    
    
  }
  
  
  //-------------------------------------------------------------------------------------------
  
  void mutatePop(){
    for(int i = 1; i<dots.length; i++){
     dots[i].brain.mutate();
    }
    
    
    
  }
  //---------------------------------------------------------------------------------------------------------
  //selects the best dot and makes it live to the next generation so that all the dots dont degrade
    public void selectBestDot(){
    Dot best = dots[0];
   for(int i=0; i<dots.length;i++){
    if(dots[i].fitness>best.fitness){
      best = dots[i];
      bestDot = i;
    }
   }
   
   if(dots[bestDot].reachedGoal){
    bestSteps =dots[bestDot].brain.step; 
    println("Best Dot's Steps:"+bestSteps);
   }
   
   addScores(dots[bestDot].brain.step);
  // println(bestScores);
   
  }
  
  //------------------------------------------------------------------------------------
  
  //adds thes previous best score to the arrayList while limiting it to 5
  public void addScores(int score){
    if(bestScores.size()>=150){
      bestScores.add(0,score);
      bestScores.remove(bestScores.size()-1);
    }
    else{
    bestScores.add(score);
    }
  }
  
  //--------------------------------------------------------------------------------------
  //calculates the range of the arrayList
  public boolean calculateDifference(){
    if(bestScores.size()>=5&&!complete){
    int bestScore = bestScores.get(0);
    int worstScore = bestScores.get(0);
    for(int i: bestScores){
      if(i>bestScore){
        bestScore = i;
      }
      if(i<worstScore){
       worstScore = i; 
      }
    }
    return ((bestScore - worstScore) <=1 && (bestScore-worstScore)>=0)  ? true:false;
    }
    return false;
  }
  //From each population, selects a random parent based on fitness, 100x parents
  // copies the brains into the children and mutates 1% of their vectors
  // rinse and repeat :)
  
  //saves the best dot from the previous generation and doesn't allow any dots with more steps to survive
  
  
  
  
  
  
  
  
  
  
  
}
