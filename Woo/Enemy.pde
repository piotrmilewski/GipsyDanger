public class Enemy extends Heroes {

  public Enemy(int x, int y) {
    xcor = x;
    ycor = y;

    adjXcor = x/50;
    adjYcor = y/50;
    
    alive = true;
    moves = 5;

    name = "John";
    type = 0;
    lvl = 1;
    exp = 0;
    hp = 10;
    hpCap = 10;
    str = 5;
    mag = 0;
    skill = 5;
    speed = 2;
    luck = 0;
    def = 5;
    res = 0;
    _weapons.add(new Weapon("Bronze Sword", "Sword", 100, 3, 50));

    calcCombatStats();
  }

  public void summonHero() {
    fill(255, 0, 0);
    ellipse(xcor, ycor, 50, 50);
  }

  /*
Track the user's hero
   */
  public void trackHero(Heroes hero) {
    int moveThere;
    int dist = (int)dist(hero.adjXcor, hero.adjYcor, adjXcor, adjYcor);

    //if the hero is to the west of this enemy, move west
    if (hero.adjXcor < adjXcor) {
      moveThere = 1;
    }

    //if the hero is to the east of this enemy, move east
    else if (hero.adjXcor > adjXcor) {
      moveThere = 3;
    }

    //if the hero is to the north of this enemy, move north
    else if (hero.adjYcor < adjYcor) {
      moveThere = 0;
    }

    //if the hero is to the south of this enemy, move south
    else {
      moveThere = 2;
    }

    //move enemy north
    if (dist == 1) {
      moves = 0;
    } else {
      if (ycor > 25 && moveThere == 0) {
        for (Enemy x : allEnemies) {
          if (ycor - 50 == x.ycor) {
            moves = 0;
          } else {
            ycor -= 50;
            adjYcor--;
          }
        }
      }

      //move enemy west
      if (xcor > 25 && moveThere == 1) {
        for (Enemy x : allEnemies) {
          if (xcor - 50 == x.xcor) {
            moves = 0;
          } else {
            xcor -= 50;
            adjXcor--;
          }
        }
      }

      //move enemy south
      if (ycor < (height - 426) &&  moveThere == 2) {
        for (Enemy x : allEnemies) {
          if (ycor + 50 == x.ycor) {
            moves = 0;
          } else {
            ycor += 50;
            adjYcor++;
          }
        }
      }

      //move enemy east
      if (xcor < (width - 26) &&  moveThere == 3) {
        for (Enemy x : allEnemies) {
          if (xcor + 50 == x.xcor) {
            moves = 0;
          } else {
            xcor += 50;
            adjXcor++;
          }
        }
      }
      moves--;
    }
  }
}