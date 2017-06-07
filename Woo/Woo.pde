import java.util.ArrayList;
/*
Heroes player1 = new Heroes(75, 75, 1);
 Heroes player2 = new Heroes(25, 25, 2);
 Heroes player3 = new Heroes(75, 25, 3);
 Heroes player4 = new Heroes(25, 75, 4);
 */

Heroes player1;
Heroes player2;
Heroes player3;
Heroes player4;

Enemy enemy1 = new Enemy(575, 375);
Enemy enemy2 = new Enemy(525, 375);
Enemy enemy3 = new Enemy(575, 325);
Enemy enemy4 = new Enemy(525, 325);

int currTeamChoice = 1;

boolean startMenu = true;
boolean mainMenu = false;
boolean selecMenu = false;
boolean characMenu = false;
boolean yourTurn = true;

Map _Map = new Map(0);
String turn = "player";
Heroes curPlayer;
Heroes trackedPlayer = player1;

ArrayList<Heroes> allCharacters = new ArrayList<Heroes>();
ArrayList<Heroes> allPlayers = new ArrayList<Heroes>();
ArrayList<Enemy> allEnemies = new ArrayList<Enemy>();


void setup() {
  background(15, 135, 71);
  size(801, 801);
  addAllCharacters();
  
  allPlayers.add(player1);
  allPlayers.add(player2);
  allPlayers.add(player3);
  allPlayers.add(player4);

  allEnemies.add(enemy1);
  allEnemies.add(enemy2);
  allEnemies.add(enemy3);
  allEnemies.add(enemy4);
}

void draw() {
  for (Enemy x : allEnemies){
    System.out.println(x);
  }
  if (startMenu) {
    _Map.startMenu();
    if (keyPressed || mousePressed) {
      startMenu = false;
      mainMenu = true;
    }
    delay(100);
  } else if (mainMenu) {
    _Map.mainMenu();
    if (keyPressed) { //opens wave selection
      if (key == '1') {
        mainMenu = false;
        selecMenu = true;
      }
      if (key == '2') { //opens team manager
        mainMenu = false;
        characMenu = true;
        delay(500);
      }
      if (key == '3') { //closes program
        exit();
      }
    }
    delay(100);
  } else if (selecMenu) {
    _Map.waveSelection();
    if (keyPressed) {
      if (Character.getNumericValue(key) <= (_Map.currAvailWaves + 1)) {
        _Map = new Map(Character.getNumericValue(key));
        selecMenu = false;
      }
    }
    delay(100);
  } else if (characMenu) {
    _Map.characSelection(currTeamChoice);
    if (keyPressed) {
      int hold = Character.getNumericValue(key);
      if (hold == 0 && allPlayers.get(3) != null) {
        characMenu = false;
        mainMenu = true;
      }
      if (hold > 0 && hold < 11) {
        if (currTeamChoice == 1) {
          allPlayers.set(0, allCharacters.get(hold));
          currTeamChoice++;
          trackedPlayer = allPlayers.get(0);
          delay(100);
        } else if (currTeamChoice == 2) {
          allPlayers.set(1, allCharacters.get(hold));
          currTeamChoice++;
          delay(100);
        } else if (currTeamChoice == 3) {
          allPlayers.set(2, allCharacters.get(hold));
          currTeamChoice++;
          delay(100);
        } else if (currTeamChoice == 4) {
          allPlayers.set(3, allCharacters.get(hold));
          currTeamChoice = 1;
          characMenu = false;
          mainMenu = true;
          delay(100);
          setPositions();
        }
      }
      delay(1000);
    }
  } else {
    background(15, 135, 71);
    _Map.refresh();
    selectPlayer();
    drawCharacters();
    if (turn == "player") {
      playersTurn();
      clickEndTurn();
    }
    enemiesTurn();
    _Map.refresh();
    selectPlayer();
    drawCharacters();
    if (turn == "player") {
      playersTurn();
      clickEndTurn();
    }
    enemiesTurn();
  }
}

void setPositions() {
  allPlayers.get(0).setXY(75, 75);
  allPlayers.get(1).setXY(25, 25);
  allPlayers.get(2).setXY(25, 75);
  allPlayers.get(3).setXY(75, 25);
}

void drawCharacters() {
  //create one hero and one enemy
  System.out.println(allPlayers.get(0));
  for (Heroes player : allPlayers) {
    if (player.getStatus()) {
      player.summonHero();
    }
  }
  for (Heroes enemy : allEnemies) {
    if (enemy.getStatus()) {
      enemy.summonHero();
    }
  }
}

void selectPlayer() {
  if (mousePressed) {

    int adjMouseXcor = mouseX/50;
    int adjMouseYcor = mouseY/50;
    //System.out.println("Mouse: " + adjMouseXcor + " " + adjMouseYcor);

    for (int i = 0; i < allPlayers.size(); i++) {

      if (allPlayers.get(i).adjXcor == adjMouseXcor && allPlayers.get(i).adjYcor == adjMouseYcor) {
        curPlayer = allPlayers.get(i);
      }
    }
  }
}

void playersTurn() {
  if (curPlayer != null) {
    //~~Player's turn~~\\
    if (turn == "player") {

      //check if hero can still move
      if (curPlayer.moves > 0) {
        curPlayer.moveHero(); //move hero
        for (int x = 0; x < allEnemies.size(); x++) {
          if (curPlayer.interact(allEnemies.get(x))) {
            curPlayer.attack(allEnemies.get(x)); 
            break;
          }
        }
      }

      //End player turn and start enemy turn
      if (allPlayers.get(0).moves == 0 && allPlayers.get(1).moves == 0 && allPlayers.get(2).moves == 0 && allPlayers.get(3).moves == 0 ) {
        turn = "enemy";
        allEnemies.get(0).resetMoves();
      }
    }
  }
}

void enemiesTurn() {
  //~~Enemy's turn~~\\
  if (turn == "enemy") {

    for (Heroes thisPlayer : allPlayers) {
      if (dist(trackedPlayer.adjXcor, trackedPlayer.adjYcor, allEnemies.get(0).adjXcor, allEnemies.get(0).adjYcor) < 
        dist(thisPlayer.adjXcor, thisPlayer.adjYcor, allEnemies.get(0).adjXcor, allEnemies.get(0).adjYcor) ) {
        trackedPlayer = thisPlayer;
      }
    }

    System.out.println(trackedPlayer);

    //check if hero's turn is over and if enemy can still move
    if (allEnemies.get(0).moves > 0) {
      allEnemies.get(0).trackHero(trackedPlayer); //enemy moves towards hero
    }

    //Check if enemy is adjacent to hero
    //Tell enemy to stop moving
    if (allEnemies.get(0).interact(trackedPlayer)) {
      allEnemies.get(0).moves = 0;
      allEnemies.get(0).attack(trackedPlayer);
    }

    //End enemy turn and start player turn
    if (allEnemies.get(0).moves == 0 && allEnemies.get(1).moves == 0 && allEnemies.get(2).moves == 0 && allEnemies.get(3).moves == 0) {
      turn = "player";
      allPlayers.get(0).resetMoves();
      allPlayers.get(1).resetMoves();
      allPlayers.get(2).resetMoves();
      allPlayers.get(3).resetMoves();
    }
  }
}

void clickEndTurn() {
  if (mousePressed) {
    if (mouseX > 0 && mouseX < 201 && mouseY > 565 && mouseY < 640) {
      turn = "enemy";
      allEnemies.get(0).resetMoves();
      allEnemies.get(1).resetMoves();
      allEnemies.get(2).resetMoves();
      allEnemies.get(3).resetMoves();
    }
  }
}

void addAllCharacters() {
  allCharacters.add(new Heroes()); //empty slot
  allCharacters.add(new Heroes(0, 0, 1));
  allCharacters.add(new Heroes(0, 0, 2));
  allCharacters.add(new Heroes(0, 0, 3));
  allCharacters.add(new Heroes(0, 0, 4));
  allCharacters.add(new Heroes(0, 0, 5));
  allCharacters.add(new Heroes(0, 0, 6));
  allCharacters.add(new Heroes(0, 0, 7));
  allCharacters.add(new Heroes(0, 0, 8));
  allCharacters.add(new Heroes(0, 0, 9));
  allCharacters.add(new Heroes(0, 0, 10));
}