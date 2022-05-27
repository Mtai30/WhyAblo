public class Adventurer extends Entity{
  boolean canEvolve;
  public Adventurer(String nameParameter, double[] statsParameter){
    super(nameParameter, statsParameter);
    canEvolve = false;
  }
  
  void evolve(){
    if (age % 5 == 0 && age != 0){
      canEvolve = true;
      this.reproduce();
    }
    canEvolve = false;
  }
}
