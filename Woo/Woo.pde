Heroes dunce = new Heroes(75, 75);
Enemy intelligent = new Enemy(575, 575);
Map _Map = new Map(0);

void setup() {
  size(801, 1001); 
  dunce.summonHero();

  int grid = 50; // change this number to 20 or 50, etc., if you want fewer grid lines
  stroke(255);
  for (int i = 0; i < width; i+=grid) {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=grid) {
    line (0, i, width, i);
  }
}

void draw() {
  _Map.refresh();
  int grid = 50; // change this number to 20 or 50, etc., if you want fewer grid lines
  stroke(255);
  for (int i = 0; i < width; i+=grid) {
    line (i, 0, i, height);
  }
  for (int i = 0; i < height; i+=grid) {
    line (0, i, width, i);
  }
  fill(255);
  dunce.summonHero();
  intelligent.summonHero();
  if (dunce.moves > 0) {
    dunce.moveHero();
    intelligent.resetMoves();
  } else {
    while (intelligent.moves > 0){
    intelligent.moveHero();
    }
    dunce.resetMoves();
  }
}