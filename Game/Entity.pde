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
  int[] stats;
  
  public Entity(/*String raceParameter,*/ String nameParameter, int[] statsParameter){
    //race = raceParameter;
    name = nameParameter;
    for (int i = 0; i < 6; i++){
      stats[i] = statsParameter[i];
    }
  }
  
  public void evolve(){
    
  }
}
