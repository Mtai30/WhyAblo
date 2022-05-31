color whiteColor = color(255);
double[] stats = {10, 10, 10, 10, 10, 10};
//Entity exampleEntity = new Entity("Aubs", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, redColor);
//Entity demon = new Demon("DK", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, redColor);
TileList TL = new TileList();
EntityList EL = new EntityList();
  
void setup(){
  size(1000, 1000);
  TL.fillBoard();
}

void keyPressed(){
  if (key == ' '){
    Adventurer newAdventurer = new Adventurer("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, color(1, 4, 5));
    EL.add(newAdventurer);
  }
}

void draw(){
  background(255);
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      TL.tileList[i][j].display();
    }
  }
  //exampleEntity.display();
  //demon.display();
  for (int row = 0; row < 100; row++){
    for (int col = 0; col < 100; col++){
      if (EL.get(row, col) != null){
        EL.get(row, col).display();
        // Methods relating to reproduction are super buggy, probably don't uncomment them
        //if (frameCount % 240 == 0){
          //EL.get(row, col).incrementAge();
        //}
        if (frameCount % 60 == 0){
          EL.get(row, col).wanderingMovement();
          //Entity potentialChild = EL.get(row, col).evolve();
          //if (potentialChild != EL.get(row, col) && potentialChild != null && row != 5 && row != 995 && col != 5 && col != 995){
            //EL.add(potentialChild);
          //}
        }
      }
    }
  }
  if (frameCount % 60 == 0){
    Demon newDemon = new Demon("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, color(1, 4, 5));
    EL.add(newDemon);
  }
}
