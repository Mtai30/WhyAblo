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
  
  void adjacentEnemy(){
    // detect if there are enemies on adjacent tiles; if they are, make them fight
    for (int row = 0; row < 100; row++){
      for (int col = 0; col < 100; col++){
        if (this.get(row, col) != null){
          String race = this.get(row, col).getRace();
          // index 0 is top left, then goes clockwise (top, top right, middle right, etc.)
          Entity[] adjacentEntities = {null, null, null, null, null, null, null, null};
          if (row != 0){
            adjacentEntities[1] = this.get(row - 1, col);
            if (col != 0){
              adjacentEntities[0] = this.get(row - 1, col - 1);
            }
            if (col != 99){
              adjacentEntities[2] = this.get(row - 1, col + 1);
            }
          }
          if (row != 99){
            adjacentEntities[5] = this.get(row + 1, col);
            if (col != 0){
              adjacentEntities[6] = this.get(row + 1, col - 1);
            }
            if (col != 99){
              adjacentEntities[4] = this.get(row + 1, col + 1);
            }
          }
          if (col != 0){
            adjacentEntities[7] = this.get(row, col - 1);
          }
          if (col != 99){
            adjacentEntities[3] = this.get(row, col + 1);
          }
          for (int i = 0; i < 8; i++){
            if (adjacentEntities[i] != null && adjacentEntities[i].getRace() != race){
              adjacentEntities[i].fight(this.get(row, col));
              this.get(row, col).fight(adjacentEntities[i]);
            }
          }
        }
      }
    }
  }
  
  void removeDead(){
    Entity deadEntity = null;
    for (int row = 0; row < 100; row++){
      for (int col = 0; col < 100; col++){
        if (entityList[row][col] != null && entityList[row][col].getHP() <= 0){
          entityList[row][col] = deadEntity;
        }
      }
    }
  }
}
