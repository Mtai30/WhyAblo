public class Demon extends Entity{
  boolean canEvolve;
  public Demon(String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter){
    super(nameParameter, statsParameter, xParameter, yParameter, color(255,0,0));
    race = "Demon";
    canEvolve = false;
  }

  Entity evolve(){
    if (killCount % 10 == 0 && killCount != 0){
      canEvolve = true;
      return this.reproduce();
    }
    canEvolve = false;
    return this;
  }
}
