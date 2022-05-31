color redColor = color(255, 0, 0);
color greenColor = color(0, 255, 0);
color whiteColor = color(255);
double[] stats = {10, 10, 10, 10, 10, 10};
TileList TL = new TileList();
EntityList EL = new EntityList();
  
void setup(){
  background(255);
  size(1200, 1000);
  TL.fillBoard();
  fill(0,0,0);
  textSize(40);
  text("Menu",1046,50);
  fill(220,220,220);
  rect(1050,100,100,50);
  rect(1050,175,100,50);
  fill(0,0,0);
  textSize(20);
  text("Demon",1064,128);
  text("Human",1064,208);
}

void keyPressed(){
  if (key == ' '){
    Adventurer newAdventurer = new Adventurer("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, color(1, 4, 5));
    EL.add(newAdventurer);
  }
}

void draw(){
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      TL.tileList[i][j].display();
    }
  }
  for (int i = 0; i < EL.size(); i++){
    EL.get(i).display();
    if (frameCount % 15 == 0){
      EL.get(i).wanderingMovement();
    }
  }
}

void mouseClicked(){
  if(mouseX > 1050 && mouseY > 100 && mouseX < 1150 && mouseY < 150){
    Demon newDemon = new Demon("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, redColor);
    EL.add(newDemon);
  }
  if(mouseX > 1050 && mouseY > 175 && mouseX < 1150 && mouseY < 225){
    Adventurer newAdventurer = new Adventurer("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, greenColor);
    EL.add(newAdventurer);
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
