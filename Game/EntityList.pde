public class EntityList{
   ArrayList<Entity> entityList;
  
  public EntityList(){
    entityList = new ArrayList<Entity>();
  }
  
  void add(Entity newEntity){
    entityList.add(newEntity);
  }
  
  int size(){
    return entityList.size();
  }
  
  Entity get(int i){
    return entityList.get(i);
  }
}
