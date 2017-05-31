Heroes dunce = new Heroes(75, 75);
Enemy intelligent = new Enemy(575, 575);
Map _Map = new Map(0);

void setup() {
  background(0);
  size(801, 801); 
  dunce.summonHero();
}

void draw(){
    _Map.refresh();

    //create one hero and one enemy
    dunce.summonHero();
    intelligent.summonHero();

    //check if hero can still move
    if (dunce.moves > 0) {
      dunce.moveHero(); //move hero
    }

    //check if hero's turn is over and if enemy can still move
    if (intelligent.moves > 0 && dunce.moves == 0) {
      intelligent.trackHero(dunce); //enemy moves towards hero
    }

    //check if hero and enemy are done with their turns
    if (intelligent.moves == 0 && dunce.moves == 0) {
      intelligent.resetMoves(); //reset enemy turn
      dunce.resetMoves(); //reset hero turn
    }
    System.out.println("dunce: " + dunce.adjXcor + " " +  dunce.adjYcor);
    System.out.println("intelligent: " + intelligent.adjXcor + " " +  intelligent.adjYcor);
    //  System.out.println(dunce.interact(intelligent));
}