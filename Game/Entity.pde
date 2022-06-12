import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  String race;
  /*
  stats[0] = strength;
  stats[1] = constitution;
  stats[2] = metabolism;
  stats[3] = intelligence;
  */
  // implement temp stats for when an Entity enters a stat-modifying tile
  double[] stats;
  int killCount;
  int age;
  String name;
  int xCoordinate;
  int yCoordinate;
  color displayColor;
  double HP;
  boolean canMove;
  double energy;
  double maxEnergy;
  
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //https://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places
  //https://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places
  public double round(double value, int places) {
    if (places < 0) throw new IllegalArgumentException();

    long factor = (long) Math.pow(10, places);
    value = value * factor;
    long tmp = Math.round(value);
    return (double) tmp / factor;
  }
  //https://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places
  //https://stackoverflow.com/questions/2808535/round-a-double-to-2-decimal-places
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  //GOT THIS ROUND METHOD FROM THE INTERNET
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    //race = raceParameter;
    stats = new double[4];
    killCount = 0;
    age = 0;
    name = nameParameter;
    xCoordinate = xParameter;
    yCoordinate = yParameter;
    displayColor = colorParameter;
    canMove = true;
    for (int i = 0; i < 4; i++){
      stats[i] = statsParameter[i];
    }
    HP = stats[1] * 10;
    maxEnergy = (stats[2] * 10);
    energy = maxEnergy;
  }
   void forage(){
     double x = Math.random() * stats[3] * 2;
   }
    
   void energyLoss(){
     energy = energy - maxEnergy *.06;
   }
   
   void demonFeed(){
     energy = energy + maxEnergy *.4;
     if (energy > maxEnergy){
       energy = maxEnergy;
     }
   }
   
   void feed(){
     energy = energy + maxEnergy *.1;
     if (energy > maxEnergy){
       energy = maxEnergy;
     }
   }
  void fight(Adventurer Jane, Demon Kai){
    Jane.attack(Kai);
    Kai.attack(Jane);
    if(Jane.death()){
      Kai.killCount++;
      Kai.demonFeed();
    }
    System.out.println(Kai.killCount);
    if(Kai.death()){
      Jane.killCount++;
    }
  }
  
  float nearestAdventurerDist(){
    float minDist = 2000;
    for(Entity e: Game.EL){
      if (e instanceof Adventurer){
        minDist = Math.min(dist(e.xCoordinate, e.yCoordinate,  xCoordinate, yCoordinate),minDist);
      }
    }
    return minDist;
  }
  
  Adventurer nearestAdventurer(){
    float minDist = nearestAdventurerDist();
    for(Entity e: Game.EL){
      if(dist(e.xCoordinate, e.yCoordinate,  xCoordinate, yCoordinate) == minDist && e instanceof Adventurer){
        return (Adventurer)e;
      }
    }
    return null;
  }
  
  float nearestDemonDist(){
    float minDist = 2000;
    for(Entity e: Game.EL){
      if (e instanceof Demon){
        minDist = Math.min(dist(e.xCoordinate, e.yCoordinate,  xCoordinate, yCoordinate),minDist);
      }
    }
    return minDist;
  }
  
  Demon nearestDemon(){
    float minDist = nearestDemonDist();
    for(Entity e: Game.EL){
      if(dist(e.xCoordinate, e.yCoordinate,  xCoordinate, yCoordinate) == minDist && e instanceof Demon){
        return (Demon)e;
      }
    }
    return null;
  }
  
   Adventurer advReproduce(){
    Adventurer child;
    double statModifier = (0.15 * Math.random()) + 0.9;
    double[] childStats = new double[4];
    for (int i = 0; i < 4; i++){
      childStats[i] = stats[i] * statModifier;
    }
    child = new Adventurer(name + "'s child", childStats, xCoordinate, yCoordinate, displayColor);
    return child;
  }
  
  Demon demReproduce(){
    Demon child;
    double statModifier = (0.15 * Math.random()) + 0.9;
    double[] childStats = new double[4];
    for (int i = 0; i < 4; i++){
      childStats[i] = stats[i] * statModifier;
    }
    child = new Demon(name + "'s child", childStats, xCoordinate, yCoordinate, displayColor);
    return child;
  }
    /*
    if (stats[5] > 13){
      if (xCoordinate != 5 && yCoordinate != 5){
        child = new Entity(name + "'s child", childStats, xCoordinate, yCoordinate, displayColor);
        return child;
      } else{
        return null;
      }
    } else{
      return null;
    }
    */
    //System.out.println(name + "'s child");
  Entity evolve(){ 
    if (this instanceof Adventurer){
      if (this.age % 10 == 0 && this.age > 0){
        //System.out.println("Adventurer");
        return this.advReproduce();
      }
    }
    if (this instanceof Demon){
      if (this.killCount % 5 == 0 && this.killCount > 0){
        //System.out.println("Demon");
        return this.demReproduce();
      }
    }
    return null;
  }
  
  double getHP(){
    return HP;
  }
  
  void setHP(double HPParameter){
    HP = HPParameter;
  }
  
  double[] getStats(){
    return stats;
  }
  
  int getAge(){
    return age;
  }
  
  double getEnergy(){
    energy = round(energy, 2);
    return energy;
  }
  
  boolean death(){
    return this.getHP() <= 0;
  }
  
  boolean energyDeath(){
    return this.getEnergy() <= 0;
  }
    
  void setAge(int newAge){
    age = newAge;
  }
  
  int getXCoordinate(){
    return xCoordinate;
  }
  
  int getYCoordinate(){
    return yCoordinate;
  }
  
  void ageUp(){
    age++;
  }
  
  String getRace(){
    return race;
  }
  
  void display(){    
    fill(displayColor);
    ellipse(xCoordinate, yCoordinate, 10, 10);
  }
  
  void wanderingMovement(){
    if (canMove){
      int i = 0;
      int direction1 = (((int) (Math.random() * 3)) - 1);
      int direction2 = (((int) (Math.random() * 3)) - 1);
      if (xCoordinate == 5){
        direction1 = 1;
      }
      if (xCoordinate == 995){
        direction1 = -1;
      }
      if (yCoordinate == 5){
        direction2 = 1;
      }
      if (yCoordinate == 995){
        direction2 = -1;
      }
      while (xCoordinate >= 5 && xCoordinate <= 995 && i < 10){
        xCoordinate += direction1;
        i++;
      }
      i = 0;
      while (yCoordinate >= 5 && yCoordinate <= 995 && i < 10){
        yCoordinate += direction2;
        i++;
      }
    }
  }
  
  void setStats(double[] statsArray){
    for (int i = 0; i < 4; i++){
      stats[i] = statsArray[i];
    }
  }
  /*
  void fight(Entity other){
    canMove = false;
    while (this.getHP() > 0 && other.getHP() > 0){
      other.setHP(other.getHP() - (int) this.stats[0]);
    }
    if (this.getHP() > 0){
      killCount++;
      canMove = true;
    }
  }
  */
}
