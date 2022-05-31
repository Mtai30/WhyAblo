public class EntityList{
   Entity[][] entityList;
  
  public EntityList(){
    entityList = new Entity[100][100];
  }
  
  void add(Entity newEntity){
    int xCoordinate = newEntity.getXCoordinate();
    int yCoordinate = newEntity.getYCoordinate();
    int rowIndex = ((xCoordinate + 5) / 10) - 1;
    int colIndex = ((yCoordinate + 5) / 10) - 1;
    entityList[rowIndex][colIndex] = newEntity;
  }
  
  
  Entity get(int row, int col){
    return entityList[row][col];
  }
  
  boolean adjacentEnemy(){
    return false;
    // detect if there are enemies on adjacent tiles; if they are, make them fight
  }
  
  void removeDead(){
    for (int row = 0; row < 100; row++){
      for (int col = 0; col < 100; col++){
        if (entityList[row][col] != null && entityList[row][col].getHP() <= 0){
          entityList[row][col] = null;
        }
      }
    }
  }
}
