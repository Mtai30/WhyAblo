import java.util.*;
import java.io.*;
import java.lang.*;
public class Entity{
  //String race;
  String name;
  /*
  stats[0] = strength;
  stats[1] =  dexterity;
  stats[2] =  constitution;
  stats[3] =  intelligence;
  stats[4] =  wisdom;
  stats[5] =  charisma;
  */
  double[] stats;
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter){
    //race = raceParameter;
    name = nameParameter;
    for (int i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  public void reproduce(){
    int offspringCount = (int) (Math.random() * 3);
    for (int i = 0; i < offspringCount; i++){
      //make new Entity
    }
    if (Math.random() > 0.5){
      this.reproduce();
    }
  }
  
  public void mutate(){ 
    for (int i = 0; i < 6; i++){
      if (Math.random() > 0.5){
        if (Math.random() > 0.5){
          stats[i] *= 1.1;
        } else{
          stats[i] *= 0.9;
        }
      }
    }
  }
  
  public double[] getStats(){
    return stats;
  }
  
  public void setStats(double[] newStats){
    this.stats = newStats;
  }
}
