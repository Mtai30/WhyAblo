public class Adventurer extends Entity{
  boolean canEvolve;
  public Adventurer(String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    super(nameParameter, statsParameter, xParameter, yParameter, color(255));
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
