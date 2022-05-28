public class Demon extends Entity{
  boolean canEvolve;
  public Demon(String nameParameter, double[] statsParameter){
    super(nameParameter, statsParameter);
    canEvolve = false;
  }

  void evolve(){
    if (killCount % 10 == 0 && killCount != 0){
      canEvolve = true;
      this.reproduce();
    }
    canEvolve = false;
  }
}
