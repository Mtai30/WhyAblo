  double[] stats = {10, 10, 10, 10, 10, 10};
  Entity exampleEntity = new Entity("Aubs", stats);
  Entity demon = new Demon("DK", stats);
  
void setup(){
  size(1000, 1000);
}

void draw(){
  background(255);
  Tile exampleTile = new Tile(50, 50);
  Tile secondTile = new Tile(900, 900);
  exampleTile.display();
  secondTile.display();
  exampleEntity.display();
  demon.display();
}
