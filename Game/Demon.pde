public class Demon extends Entity{
  boolean canEvolve;
  public Demon(String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    super(nameParameter, statsParameter, xParameter, yParameter, color(0));
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
