public class Forest extends Dry{
  public Forest(int x, int y){
    super(x, y);
  }
  
  public void applyEffect(Entity a){
    double[] stats = a.getStats();
    stats[1] = stats[1] * .9;
  }
}
