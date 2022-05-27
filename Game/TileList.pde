public class TileList{
  Tile[][] tileList;
  Tile x = new Tile(10,10);
  
  public TileList(){
    tileList = new Tile[100][100];
  }
  
  public void fillBoard(){
    for(int i = 0; i < tileList.length; i++){
      for(int j = 0; j < tileList.length; j++){
        String tileType = x.getRandomTerrainType();
        if(tileType.equals("Forest")){
          Forest f = new Forest(i*10,j*10);
          tileList[i][j] = f;
        }
        if(tileType.equals("Mountain")){
          Mountain m = new Mountain(i*10,j*10);
          tileList[i][j] = m;
        }
        if(tileType.equals("Plains")){
          Plains p = new Plains(i*10,j*10);
          tileList[i][j] = p;
        }
        if(tileType.equals("Swamp")){
          Swamp s = new Swamp(i*10,j*10);
          tileList[i][j] = s;
        }
        if(tileType.equals("Ocean")){
          Ocean o = new Ocean(i*10,j*10);
          tileList[i][j] = o;
        }
      }
    } 
  }
}
