color redColor = color(255, 0, 0);
color greenColor = color(0, 255, 0);
double[] stats = {10, 10, 10, 10};
double[] dstats = {30,30,30,30};
TileList TL = new TileList();
//EntityList EL = new EntityList();
int year = 0;
static ArrayList<Entity> EL = new ArrayList<Entity>();
ArrayList<Entity> babyEL = new ArrayList<Entity>();
  
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
  text("Year",1064,368);
}
/*
void keyPressed(){
  if (key == ' '){
    Adventurer newAdventurer = new Adventurer("No Name", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, color(1, 4, 5));
    EL.add(newAdventurer);
  }
}
*/

void draw(){
  fill(255,255,255);
  noStroke();
  rect(1050,960,100,50);
  rect(1050,375,100,50);
  fill(0,0,0);
  text(frameRate,1064,990);
  text(year,1064,408);
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      TL.tileList[i][j].display();
    }
  }
  if(frameCount % 60 == 0){
    for(int i = 0; i < EL.size(); i++){
      if(EL.get(i) instanceof Demon){
        if (EL.get(i).nearestAdventurerDist() < 20){
          EL.get(i).fight(EL.get(i).nearestAdventurer(),(Demon)EL.get(i));
        }
      } /*else {
        if (EL.get(i).nearestDemonDist() < 20){
          EL.get(i).fight((Adventurer)EL.get(i),EL.get(i).nearestDemon());
        }
      }*/
      if(EL.get(i).death()){
        System.out.println("death");
        EL.remove(i);
      }
      if(EL.get(i).energyDeath()){
        System.out.println("energyDeath");
        EL.remove(i);
      }
    }
  }
  for (int i = 0; i < EL.size(); i++){
    EL.get(i).display();
    if (frameCount % 60 == 0){
      EL.get(i).wanderingMovement();
      EL.get(i).ageUp();
      EL.get(i).energyLoss();
    }
    if (frameCount % 60 == 0){
      Entity x = EL.get(i).evolve();
      if (x != null){
        babyEL.add(x);
      }
    }
  }
  if (frameCount % 60 == 0){
    for(int i = babyEL.size()-1; i >= 0;i--){
      EL.add(babyEL.get(i));
      babyEL.remove(i);
      //System.out.println("test");
    }
    year++;
  }

  /*
  for (int row = 0; row < 100; row++){
    for (int col = 0; col < 100; col++){
      if (EL.get(row, col) != null){
        EL.get(row, col).display();
        // Methods relating to reproduction are super buggy, probably don't uncomment them
        //if (frameCount % 240 == 0){
          //EL.get(row, col).incrementAge();
        //}
        if (frameCount % 60 == 0){
          EL.get(row, col).ageUp();
          Entity x = EL.get(row, col).evolve();
          if (x != null){
            babyEL.add(x);
          }
          EL.get(row, col).wanderingMovement();
          //Entity potentialChild = EL.get(row, col).evolve();
          //if (potentialChild != EL.get(row, col) && potentialChild != null && row != 5 && row != 995 && col != 5 && col != 995){
            //EL.add(potentialChild);
          //}
        }
      }
    }
  }
  */
  /*
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      if(EL.entityList[i][j] != null){
        EL.entityList[i][j].display();
        if (frameCount % 15 == 0){
          EL.entityList[i][j].wanderingMovement();
        }
      }
    }
  }
  */
  //exampleEntity.display();
  //demon.display();
  //EL.adjacentEnemy();
  //EL.removeDead();        
}

void mouseClicked(){
  if(mouseX > 1050 && mouseY > 100 && mouseX < 1150 && mouseY < 150){
    Demon newDemon = new Demon("Kai", dstats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, redColor);
    EL.add(newDemon);
  }
  if(mouseX > 1050 && mouseY > 175 && mouseX < 1150 && mouseY < 225){
    Adventurer newAdventurer = new Adventurer("Jane", stats, (10 * (((int) (Math.random() * 100)) + 1)) - 5, (10 * (((int) (Math.random() * 100)) + 1)) - 5, greenColor);
    EL.add(newAdventurer);
  }
  for(int i = 0; i < EL.size(); i++){
    if(EL.get(i) != null){
      if(mouseX < EL.get(i).getXCoordinate() + 10 && mouseY < EL.get(i).getYCoordinate() + 10 && mouseX > EL.get(i).getXCoordinate() - 10 && mouseY > EL.get(i).getYCoordinate() - 10){
        fill(255,255,255);
        rect(1001,460,1000,1000);
        fill(0,0,0);
        text("Age:" + EL.get(i).getAge(),1064,488);
        text("Energy:" + EL.get(i).getEnergy(),1064,520);
      }
    }
  }
}
