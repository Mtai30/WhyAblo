import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  //String race;
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
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    //race = raceParameter;
    stats = new double[6];
    killCount = 0;
    age = 0;
    name = nameParameter;
    xCoordinate = xParameter;
    yCoordinate = yParameter;
    displayColor = colorParameter;
    HP = 100;
    for (int i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  void reproduce(){
    double statModifier = (0.15 * Math.random()) + 0.9;
    double[] childStats = new double[6];
    for (int i = 0; i < 6; i++){
      childStats[i] = stats[i] * statModifier;
    }
    if (stats[5] > 7 && stats[5] < 14){
      Entity child = new Entity(name + "'s child", childStats, xCoordinate - 1, yCoordinate - 1, displayColor);
    } else if (stats[5] > 14){
      Entity child1 = new Entity(name + "'s child", childStats, xCoordinate - 1, yCoordinate - 1, displayColor);
      Entity child2 = new Entity(name + "'s child", childStats, xCoordinate - 1, yCoordinate - 1, displayColor);
    }
  }
  
  void evolve(){ 
    if (Math.random() > 0.5){
      this.reproduce();
    }
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
  
  void display(){
    fill(displayColor);
    ellipse(xCoordinate, yCoordinate, 10, 10);
  }
  
  void wanderingMovement(){
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
  
  void setStats(double[] statsArray){
    for (int i = 0; i < 6; i++){
      stats[i] = statsArray[i];
    }
  }
}
