public class Demon extends Entity{
  boolean canEvolve;
  public Demon(String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter, double startEnergy){
    super(nameParameter, statsParameter, xParameter, yParameter, color(255,0,0), startEnergy);
    race = "Demon";
    canEvolve = false;
  }
  /*
  Entity evolve(){
    if (killCount % 10 == 0 && killCount != 0){
      canEvolve = true;
      return this.reproduce();
    }
    canEvolve = false;
    return null;
  }
  */
  void attack(Adventurer Jane){
    Jane.setHP(Jane.getHP() - stats[0]);
  }
}
