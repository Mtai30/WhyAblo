import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  //String race;
  String name;
  int killCount;
  int age;
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
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter){
    //race = raceParameter;
    killCount = 0;
    age = 0;
    name = nameParameter;
    age = 0;
    killCount = 0;
    for (int i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  public void reproduce(){
    double statModifier = (0.15 * Math.random()) + 0.9;
    double[] childStats = new double[6];
    for (int i = 0; i < 6; i++){
      childStats[i] = stats[i] * statModifier;
    }
    if (stats[5] > 7 && stats[5] < 14){
      Entity child = new Entity(name + "'s child", childStats);
    } else if (stats[5] > 14){
      Entity child1 = new Entity(name + "'s child", childStats);
      Entity child2 = new Entity(name + "'s child", childStats);
    }
  }
  
  public void evolve(){ 
    if (Math.random() > 0.5){
      this.reproduce();
    }
  }
  
  public double[] getStats(){
    return stats;
  }
  
  public void setStats(double[] statsArray){
    for (int i = 0; i < 6; i++){
      stats[i] = statsArray[i];
    }
  }
}
