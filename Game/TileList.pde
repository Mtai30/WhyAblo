public class TileList{
  Tile[][] tileList;
  Tile x = new Tile("Test",10,10);

  public TileList(){
    tileList = new Tile[100][100];
  }
  
  Tile getTile(int row, int col){
    return tileList[row][col];
  }
  
  Entity getEntityOnTile(int row, int col){
    return tileList[row][col].getEntity();
  }
  
  void setEntityOnTile(int row, int col, Entity newEntity){
    tileList[row][col].setEntity(newEntity);
  }
  
  void displayAll(){
    for (int i = 0; i < 100; i++){
      for (int j = 0; j < 100; j++){
        tileList[i][j].display();
        if (tileList[i][j].getEntity() != null){
          tileList[i][j].getEntity().display();
        }
      }
    }
  }
  
  ArrayList<Entity> getNeighbors(int row, int col){
    ArrayList<Entity> neighbors = new ArrayList<Entity>();
    if (row != 0 && this.getEntityOnTile(row - 1, col) != null){
      neighbors.add(this.getEntityOnTile(row - 1, col));
      if (col != 0 && this.getEntityOnTile(row - 1, col - 1) != null){
        neighbors.add(this.getEntityOnTile(row - 1, col - 1));
      }
      if (col != 99 && this.getEntityOnTile(row - 1, col + 1) != null){ 
        neighbors.add(this.getEntityOnTile(row - 1, col + 1));
      }
    }
    if (row != 99 && this.getEntityOnTile(row + 1, col) != null){
      neighbors.add(this.getEntityOnTile(row + 1, col));
      if (col != 0 && this.getEntityOnTile(row + 1, col - 1) != null){
        neighbors.add(this.getEntityOnTile(row + 1, col - 1));
      }
      if (col != 99 && this.getEntityOnTile(row + 1, col + 1) != null){
        neighbors.add(this.getEntityOnTile(row + 1, col + 1));
      }
    }
    if (col != 0 && this.getEntityOnTile(row, col - 1) != null){
      neighbors.add(this.getEntityOnTile(row, col - 1));
    }
    if (col != 99 && this.getEntityOnTile(row, col + 1) != null){
      neighbors.add(this.getEntityOnTile(row, col + 1));
    }
    return neighbors;
  }
  
  void interactAdjacentTiles(){
    for (int row = 0; row < 100; row++){
      for (int col = 0; col < 100; col++){
        if (tileList[row][col].getEntity() != null){
          ArrayList<Entity> neighbors = this.getNeighbors(row, col);
          for (int i = 0; i < neighbors.size(); i++){
            tileList[row][col].getEntity().fight(neighbors.get(i));
          }
        }
      }
    }
  }
  
  public void tileChange(Tile t, int i){
    String tileType = "empty";
    if (i == 0){
      tileType = "Plains";
    }
    if (i == 1){
      tileType = "Forest";
    }
    if (i == 2){
      tileType = "Mountain";
    }
    if (i == 3){
      tileType = "Ocean";
    }
    if (i == 4){
      tileType = "Swamp";
    }
    if(tileType.equals("Forest")){
      Tile f = new Tile("Forest",t.xCoordinate,t.yCoordinate);
      tileList[t.xCoordinate/10][t.yCoordinate/10] = f;
    }
    if(tileType.equals("Mountain")){
      Tile m = new Tile("Mountain",t.xCoordinate,t.yCoordinate);
      tileList[t.xCoordinate/10][t.yCoordinate/10] = m;
    }
    if(tileType.equals("Plains")){
      Tile p = new Tile("Plains",t.xCoordinate,t.yCoordinate);
      tileList[t.xCoordinate/10][t.yCoordinate/10] = p;
    }
    if(tileType.equals("Swamp")){
      Tile s = new Tile("Swamp",t.xCoordinate,t.yCoordinate);
      tileList[t.xCoordinate/10][t.yCoordinate/10] = s;
    }
    if(tileType.equals("Ocean")){
      Tile o = new Tile("Ocean",t.xCoordinate,t.yCoordinate);
     tileList[t.xCoordinate/10][t.yCoordinate/10] = o;
    }
  }

  public void fillBoard(){
    for(int i = 0; i < tileList.length; i++){
      for(int j = 0; j < tileList.length; j++){
        String tileType = x.getRandomTerrainType();
        if(tileType.equals("Forest")){
          Tile f = new Tile("Forest",i*10,j*10);
          tileList[i][j] = f;
        }
        if(tileType.equals("Mountain")){
          Tile m = new Tile("Mountain",i*10,j*10);
          tileList[i][j] = m;
        }
        if(tileType.equals("Plains")){
          Tile p = new Tile("Plains",i*10,j*10);
          tileList[i][j] = p;
        }
        if(tileType.equals("Swamp")){
          Tile s = new Tile("Swamp",i*10,j*10);
          tileList[i][j] = s;
        }
        if(tileType.equals("Ocean")){
          Tile o = new Tile("Ocean",i*10,j*10);
          tileList[i][j] = o;
        }
      }
    }/*
    for(int o = 0; o < 100; o++){
      for(int i = 0; i < tileList.length; i++){
        for(int j = 0; j < tileList.length; j++){
          int pc = 0;
          int fc = 0;
          int mc = 0;
          int oc = 0;
          int sc = 0;
          int nc = 0;
          System.out.println("testing");
          try{
            if(tileList[i-1][j-1].equals("Forest")){
              fc++;
            }
            if(tileList[i-1][j].equals("Forest")){
              fc++;
            }
            if(tileList[i-1][j+1].equals("Forest")){
              fc++;
            }
            if(tileList[i][j-1].equals("Forest")){
              fc++;
            }
            if(tileList[i][j+1].equals("Forest")){
              fc++;
            }
            if(tileList[i+1][j-1].equals("Forest")){
              fc++;
            }
            if(tileList[i+1][j].equals("Forest")){
              fc++;
            }
            if(tileList[i+1][j+1].equals("Forest")){
              fc++;
            }
            if(tileList[i-1][j-1].equals("Plains")){
              pc++;
            }
            if(tileList[i-1][j].equals("Plains")){
              pc++;
            }
            if(tileList[i-1][j+1].equals("Plains")){
              pc++;
            }
            if(tileList[i][j-1].equals("Plains")){
              pc++;
            }
            if(tileList[i][j+1].equals("Plains")){
              pc++;
            }
            if(tileList[i+1][j-1].equals("Plains")){
              pc++;
            }
            if(tileList[i+1][j].equals("Plains")){
              pc++;
            }
            if(tileList[i+1][j+1].equals("Plains")){
              pc++;
            }
            if(tileList[i-1][j-1].equals("Mountain")){
              mc++;
            }
            if(tileList[i-1][j].equals("Mountain")){
              mc++;
            }
            if(tileList[i-1][j+1].equals("Mountain")){
              mc++;
            }
            if(tileList[i][j-1].equals("Mountain")){
              mc++;
            }
            if(tileList[i][j+1].equals("Mountain")){
              mc++;
            }
            if(tileList[i+1][j-1].equals("Mountain")){
              mc++;
            }
            if(tileList[i+1][j].equals("Mountain")){
              mc++;
            }
            if(tileList[i+1][j+1].equals("Mountain")){
              mc++;
            }
            if(tileList[i-1][j-1].equals("Ocean")){
              oc++;
            }
            if(tileList[i-1][j].equals("Ocean")){
              oc++;
            }
            if(tileList[i-1][j+1].equals("Ocean")){
              oc++;
            }
            if(tileList[i][j-1].equals("Ocean")){
              oc++;
            }
            if(tileList[i][j+1].equals("Ocean")){
              oc++;
            }
            if(tileList[i+1][j-1].equals("Ocean")){
              oc++;
            }
            if(tileList[i+1][j].equals("Ocean")){
              oc++;
            }
            if(tileList[i+1][j+1].equals("Ocean")){
              oc++;
            }
            if(tileList[i-1][j-1].equals("Swamp")){
              sc++;
            }
            if(tileList[i-1][j].equals("Swamp")){
              sc++;
            }
            if(tileList[i-1][j+1].equals("Swamp")){
              sc++;
            }
            if(tileList[i][j-1].equals("Swamp")){
              sc++;
            }
            if(tileList[i][j+1].equals("Swamp")){
              sc++;
            }
            if(tileList[i+1][j-1].equals("Swamp")){
              sc++;
            }
            if(tileList[i+1][j].equals("Swamp")){
              sc++;
            }
            if(tileList[i+1][j+1].equals("Swamp")){
              sc++;
            }
          } catch(ArrayIndexOutOfBoundsException e){
            nc++;
          }
          if(tileList[i][j].equals("Plains")){
            if(nc/5+fc+mc+oc+sc > 7){
              if(Math.max(Math.max(Math.max(fc,mc),sc),oc) == fc){
                tileChange(tileList[i][j],1);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),oc) == mc){
                tileChange(tileList[i][j],2);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),oc) == oc){
                tileChange(tileList[i][j],3);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),oc) == sc){
                tileChange(tileList[i][j],4);
              }
            }
          }
          if(tileList[i][j].equals("Forest")){
            if(nc/5+pc+mc+oc+sc > 7){
              if(Math.max(Math.max(Math.max(pc,mc),sc),oc) == pc){
                tileChange(tileList[i][j],0);
              }
              if(Math.max(Math.max(Math.max(pc,mc),sc),oc) == mc){
                tileChange(tileList[i][j],2);
              }
              if(Math.max(Math.max(Math.max(pc,mc),sc),oc) == oc){
                tileChange(tileList[i][j],3);
              }
              if(Math.max(Math.max(Math.max(pc,mc),sc),oc) == sc){
                tileChange(tileList[i][j],4);
              }
            }
          }
          if(tileList[i][j].equals("Mountain")){
            if(nc/5+fc+pc+oc+sc > 7){
              if(Math.max(Math.max(Math.max(fc,pc),sc),oc) == fc){
                tileChange(tileList[i][j],1);
              }
              if(Math.max(Math.max(Math.max(fc,pc),sc),oc) == pc){
                tileChange(tileList[i][j],0);
              }
              if(Math.max(Math.max(Math.max(fc,pc),sc),oc) == oc){
                tileChange(tileList[i][j],3);
              }
              if(Math.max(Math.max(Math.max(fc,pc),sc),oc) == sc){
                tileChange(tileList[i][j],4);
              }
            }
          }
          if(tileList[i][j].equals("Ocean")){
            if(nc/5+fc+mc+pc+sc > 7){
              if(Math.max(Math.max(Math.max(fc,mc),sc),pc) == fc){
                tileChange(tileList[i][j],1);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),pc) == mc){
                tileChange(tileList[i][j],2);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),pc) == pc){
                tileChange(tileList[i][j],0);
              }
              if(Math.max(Math.max(Math.max(fc,mc),sc),pc) == sc){
                tileChange(tileList[i][j],4);
              }
            }
          }
          if(tileList[i][j].equals("Swamp")){
            if(nc/5+fc+mc+oc+pc > 7){
              if(Math.max(Math.max(Math.max(fc,mc),pc),oc) == fc){
                tileChange(tileList[i][j],1);
              }
              if(Math.max(Math.max(Math.max(fc,mc),pc),oc) == mc){
                tileChange(tileList[i][j],2);
              }
              if(Math.max(Math.max(Math.max(fc,mc),pc),oc) == oc){
                tileChange(tileList[i][j],3);
              }
              if(Math.max(Math.max(Math.max(fc,mc),pc),oc) == pc){
                tileChange(tileList[i][j],0);
              }
            }
          }
        }
      }
    }
    */
    //Attempted Optimization, but it doesn't work
  }
}
