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
}
