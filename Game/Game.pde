TileList TL = new TileList();
void setup(){
  size(1000, 1000);
}

void draw(){
  background(255);
  for(int i = 0; i < 100; i++){
    for(int j = 0; j < 100; j++){
      color c = TL.tileList[i][j].getColor();
    }
  }
  
}
