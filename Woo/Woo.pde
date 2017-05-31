Heroes dunce = new Heroes(75, 75);
Enemy intelligent = new Enemy(375, 375);
Map _Map = new Map(0);
String turn = "player";

void setup() {
  background(0);
  size(801, 801); 
  dunce.summonHero();
}

void draw() {
  _Map.refresh();

  //create one hero and one enemy
  dunce.summonHero();
  intelligent.summonHero();

  //~~Player's turn~~\\
  if (turn == "player") {

    //check if hero can still move
    if (dunce.moves > 0) {
      dunce.moveHero(); //move hero
    }

    //End player turn and start enemy turn
    if (dunce.moves == 0) {
      turn = "enemy";
      intelligent.resetMoves();
    }
  }

  //~~Enemy's turn~~\\
  if (turn == "enemy") {

    //check if hero's turn is over and if enemy can still move
    if (intelligent.moves > 0) {
      intelligent.trackHero(dunce); //enemy moves towards hero
    }

    //Check if enemy is adjacent to hero
    //Tell enemy to stop moving
    if (intelligent.interact(dunce)) {
      intelligent.moves = 0;
    }

    //End enemy turn and start player turn
    if (intelligent.moves == 0) {
      turn = "player";
      dunce.resetMoves();
    }
  }

  System.out.println("dunce: " + dunce.adjXcor + " " +  dunce.adjYcor);
  System.out.println("intelligent: " + intelligent.adjXcor + " " +  intelligent.adjYcor);
  //  System.out.println(dunce.interact(intelligent));
}