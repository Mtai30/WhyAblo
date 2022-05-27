import java.util.*;
import java.io.*;
import java.lang.*;
color c;
public class Tile{
  //String terrainType;
  int xCoordinate, yCoordinate;
  
  public Tile(/*String type,*/ int x, int y){
    //terrainType = type;
    xCoordinate = x;
    yCoordinate = y;
  }
  
  //public String getTerrainType(){
    //return terrainType;
  //}
  
  public color getColor(){
    return c;
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
  
  public String getRandomTerrainType(){
    String[] terrainType = {"Forest", "Plains", "Mountain", "Ocean", "Swamp"};
    return terrainType[(int) (Math.random() * terrainType.length)];
  }
   public void applyEffect(){}
}
