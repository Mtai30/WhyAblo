public class Adventurer extends Entity{
  boolean canEvolve;
  public Adventurer(String nameParameter, double[] statsParameter, int xParameter, int yParameter, color colorParameter, double startEnergy){
    super(nameParameter, statsParameter, xParameter, yParameter, color(0,255,0), startEnergy);
    race = "Adventurer";
    canEvolve = false;
  }
  /*
  Entity evolve(){
    if (age % 5 == 0 && age != 0){
      canEvolve = true;
      return this.reproduce();
    }
    canEvolve = false;
    return null;
  }
  */
  void attack(Demon Kai){
    Kai.setHP(Kai.getHP() - stats[0]);
  }
}
