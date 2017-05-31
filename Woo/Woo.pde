Heroes dunce = new Heroes(75, 75);
Enemy intelligent = new Enemy(575, 575);
Map _Map = new Map(0);

void setup() {
  background(0);
  size(801, 1001); 
  dunce.summonHero();
}

void draw() {
  _Map.refresh();

  dunce.summonHero();
  intelligent.summonHero();
  if (dunce.moves > 0) {
    dunce.moveHero();
  }
  if (intelligent.moves > 0 && dunce.moves == 0) {
    intelligent.trackHero(dunce);
  }
  if (intelligent.moves == 0 && dunce.moves == 0) {
    intelligent.resetMoves();  
    dunce.resetMoves();
  }
  System.out.println("dunce: " + dunce.adjXcor + " " +  dunce.adjYcor);
  System.out.println("intelligent: " + intelligent.adjXcor + " " +  intelligent.adjYcor);
//  System.out.println(dunce.interact(intelligent));
}