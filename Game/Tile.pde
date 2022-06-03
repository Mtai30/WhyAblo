import java.util.*;
import java.io.*;
import java.lang.*;
public class Tile{
  String terrainType;
  int xCoordinate, yCoordinate;
  color c;
  color plainsColor = color(161,210,105);
  color forestColor = color(42,126,25);
  color mountainColor = color(220,220,220);
  color oceanColor = color(2,7,93);
  color swampColor = color(101,116,50);
  ArrayList<Integer> biomeMaker = new ArrayList<Integer>();
  Entity entityOnTile;

  public Tile(String type, int x, int y){
    terrainType = type;
    xCoordinate = x;
    yCoordinate = y;
  }
  
  public color getColor(){
    return c;
  }
  /*
  public int getTerrainType(){
    if (terrainType.equals("Plains")){
      return 0;
    }
    if (terrainType.equals("Forest")){
      return 1;
    }
    if (terrainType.equals("Mountain")){
      return 2;
    }
    if (terrainType.equals("Ocean")){
      return 3;
    }
    if (terrainType.equals("Swamp")){
      return 4;
    }
    return 111111;
  }
  */
  
  public void setColor(color anything){
    c = anything;
  }
  
  public String[] getAdjacentTiles(){
    String[] output;
    if (this.xCoordinate == 0 && this.yCoordinate == 0 || this.xCoordinate == 0 && this.yCoordinate == 990 || this.xCoordinate == 990 && this.yCoordinate == 0 || this.xCoordinate == 990 && this.yCoordinate == 990){
      output = new String[3];
    } else if (this.xCoordinate == 0 || this.yCoordinate == 0 || this.xCoordinate == 990 || this.yCoordinate == 990){
      output = new String[5];
    } else{
      output = new String[8];
    }
    return output;
  }
  
  Entity getEntity(){
    return entityOnTile;
  }
  
  void setEntity(Entity theEntity){
    entityOnTile = theEntity;
  }
  
  void interactAdjacentTiles(){
    
  }
  
  void display(){
    if (terrainType.equals("Plains")){
      setColor(plainsColor);
    }
    if (terrainType.equals("Forest")){
      setColor(forestColor);
    }
    if (terrainType.equals("Mountain")){
      setColor(mountainColor);
    }
    if (terrainType.equals("Ocean")){
      setColor(oceanColor);
    }
    if (terrainType.equals("Swamp")){
      setColor(swampColor);
    }
    fill(c);
    noStroke();
    square(xCoordinate, yCoordinate, 10);
  }

  public String getRandomTerrainType(){
    String[] terrainTypes = {"Plains", "Forest", "Mountain", "Ocean", "Swamp"};
    int x = (int) (Math.random() * terrainTypes.length);
    int pc = 0;
    int fc = 0;
    int mc = 0;
    int oc = 0;
    int sc = 0;
    if (biomeMaker.size()>101 && biomeMaker.size()%100 != 1 && biomeMaker.size()%100 != 99){
      int topLeft = biomeMaker.get(biomeMaker.size()-101);
      int topMiddle = biomeMaker.get(biomeMaker.size()-100);
      int topRight = biomeMaker.get(biomeMaker.size()-99);
      int middleLeft = biomeMaker.get(biomeMaker.size()-1);
      if (topLeft == 0){
        pc++;
      }
      if (topMiddle == 0){
        pc++;
      }
      if (topRight == 0){
        pc++;
      }
      if (middleLeft == 0){
        pc++;
      }
      if (topLeft == 1){
        fc++;
      }
      if (topMiddle == 1){
        fc++;
      }
      if (topRight == 1){
        fc++;
      }
      if (middleLeft == 1){
        fc++;
      }
      if (topLeft == 2){
        mc++;
      }
      if (topMiddle == 2){
        mc++;
      }
      if (topRight == 2){
        mc++;
      }
      if (middleLeft == 2){
        mc++;
      }
      if (topLeft == 3){
        oc++;
      }
      if (topMiddle == 3){
        oc++;
      }
      if (topRight == 3){
        oc++;
      }
      if (middleLeft == 3){
        oc++;
      }
      if (topLeft == 4){
        sc++;
      }
      if (topMiddle == 4){
        sc++;
      }
      if (topRight == 4){
        sc++;
      }
      if (middleLeft == 4){
        sc++;
      }
      for(int i = 0; i < 8; i++){
        int xyz = (int)(Math.random()*100);
        if (xyz > 0 && xyz < pc*20){
          x = 0;
        }
        if (xyz > pc*20 && xyz < pc*20+fc*20){
          x = 1;
        }
        if (xyz > pc*20+fc*20 && xyz < pc*20+fc*20+mc*20){
          x = 2;
        }
        if (xyz > pc*20+fc*20+mc*20 && xyz < pc*20+fc*20+mc*20+oc*20){
          x = 3;
        }
        if (xyz > pc*20+fc*20+mc*20+oc*20 && xyz < pc*20+fc*20+mc*20+oc*20+sc*20){
          x = 4;
        }
      }
    } else if(biomeMaker.size() > 101 && biomeMaker.size() > 1){
      int middleLeft = biomeMaker.get(biomeMaker.size()-1);
      int xyz = (int)Math.random()*100;
      if (middleLeft == 0){
        if (xyz < 80){
          x = 0;
        }
      }
      if (middleLeft == 1){
        if (xyz < 80){
          x = 1;
        }
      }
      if (middleLeft == 2){
        if (xyz < 80){
          x = 2;
        }
      }
      if (middleLeft == 3){
        if (xyz < 80){
          x = 3;
        }
      }
      if (middleLeft == 4){
        if (xyz < 80){
          x = 4;
        }
      }
    }
    biomeMaker.add(x);
    return terrainTypes[x];
 }
  
   public void applyEffect(){
   
   }
}
