import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  //String race;
  String name;
  int killCount;
  int age;
  int xCoordinate;
  int yCoordinate;
  color displayColor;
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
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    //race = raceParameter;
    stats = new double[6];
    killCount = 0;
    age = 0;
    name = nameParameter;
    age = 0;
    xCoordinate = xParameter;
    yCoordinate = yParameter;
    killCount = 0;
    displayColor = colorParameter;
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
  
  void display(){
    fill(displayColor);
    ellipse(xCoordinate, yCoordinate, 10, 10);
  }
  
  void wanderingMovement(){
    int i = 0;
    int direction1 = (((int) (Math.random() * 3)) - 1);
    int direction2 = (((int) (Math.random() * 3)) - 1);
    while (xCoordinate > 5 && xCoordinate < 995 && i < 10){
        xCoordinate += direction1;
        i++;
    }
    i = 0;
    while (yCoordinate > 5 && yCoordinate < 995 && i < 10){
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
