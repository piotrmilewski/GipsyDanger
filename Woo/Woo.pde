import java.util.ArrayList;

Heroes player1 = new Heroes(75, 75, 1);
Enemy enemy1 = new Enemy(375, 375);
Map _Map = new Map(0);
String turn = "player";
Heroes curPlayer;
ArrayList<Heroes> allPlayers = new ArrayList<Heroes>();
ArrayList<Enemy> allEnemies = new ArrayList<Enemy>();


void setup() {
  background(0);
  size(801, 801);
  allPlayers.add(curPlayer);
  allEnemies.add(enemy1);
}



void draw() {
  _Map.refresh();

  if (mousePressed) {

    int adjMouseXcor = mouseX/50;
    int adjMouseYcor = mouseY/50;
    System.out.println(adjMouseXcor + " " + adjMouseYcor);

    for (int i = 0; i < allPlayers.size() - 1; i++) {
      if (allPlayers.get(i).adjXcor == adjMouseXcor && allPlayers.get(i).adjYcor == adjMouseYcor) {
        curPlayer = allPlayers.get(i);
      }
    }
  }

  //create one hero and one enemy
  player1.summonHero();
  enemy1.summonHero();
  
if(curPlayer != null){
  //~~Player's turn~~\\
  if (turn == "player") {

    //check if hero can still move
    if (curPlayer.moves > 0) {
      curPlayer.moveHero(); //move hero
    }

    //End player turn and start enemy turn
    if (curPlayer.moves == 0) {
      turn = "enemy";
      enemy1.resetMoves();
    }
  }

  //~~Enemy's turn~~\\
  if (turn == "enemy") {

    //check if hero's turn is over and if enemy can still move
    if (enemy1.moves > 0) {
      enemy1.trackHero(curPlayer); //enemy moves towards hero
    }

    //Check if enemy is adjacent to hero
    //Tell enemy to stop moving
    if (enemy1.interact(curPlayer)) {
      enemy1.moves = 0;
    }

    //End enemy turn and start player turn
    if (enemy1.moves == 0) {
      turn = "player";
      curPlayer.resetMoves();
    }
  }

  System.out.println("curPlayer: " + curPlayer.adjXcor + " " +  curPlayer.adjYcor);
  //System.out.println("enemy1: " + enemy1.adjXcor + " " +  enemy1.adjYcor);
  //  System.out.println(curPlayer.interact(enemy1));
  System.out.println(curPlayer);
}
}