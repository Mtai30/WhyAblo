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
  double[] stats;
  
  public Entity(/*String raceParameter,*/ String nameParameter, double[] statsParameter){
    //race = raceParameter;
    killCount = 0;
    age = 0;
    name = nameParameter;
    for (double i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  public void reproduce(){
    int offspringCount = (int) (Math.random() * 3);
    for (int i = 0; i < offspringCount; i++){
      //make new Entity
    }
  }
  
  public void evolve(){ 
    if (Math.random() > 0.5){
      this.reproduce();
    }
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
}
