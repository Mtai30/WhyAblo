import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  String race;
  /*
  stats[0] = strength;
  stats[1] =  dexterity;
  stats[2] =  constitution;
  stats[3] =  intelligence;
  stats[4] =  wisdom;
  stats[5] =  charisma;
  */
  // implement temp stats for when an Entity enters a stat-modifying tile
  double[] stats;
  int killCount;
  int age;
  String name;
  int xCoordinate;
  int yCoordinate;
  color displayColor;
  int HP;
  boolean canMove;
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    //race = raceParameter;
    stats = new double[6];
    killCount = 0;
    age = 0;
    name = nameParameter;
    xCoordinate = xParameter;
    yCoordinate = yParameter;
    displayColor = colorParameter;
    HP = 20;
    canMove = true;
    for (int i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  Entity reproduce(){
    Entity child;
    double statModifier = (0.15 * Math.random()) + 0.9;
    double[] childStats = new double[6];
    for (int i = 0; i < 6; i++){
      childStats[i] = stats[i] * statModifier;
    }
    if (stats[5] > 13){
      if (xCoordinate != 5 && yCoordinate != 5){
        child = new Entity(name + "'s child", childStats, xCoordinate - 10, yCoordinate - 10, displayColor);
        return child;
      } else{
        return null;
      }
    } else{
      return null;
    }
  }
  
  Entity evolve(){ 
    if (Math.random() > 0.5){
      return this.reproduce();
    } else{
      return this;
    }
  }
  
  int getHP(){
    return HP;
  }
  
  void setHP(int HPParameter){
    HP = HPParameter;
  }
  
  double[] getStats(){
    return stats;
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
    for (int i = 0; i < 6; i++){
      stats[i] = statsArray[i];
    }
  }
  
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
}
