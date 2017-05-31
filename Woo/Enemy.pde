public class Enemy extends Heroes {

  public Enemy(int x, int y) {
    xcor = x;
    ycor = y;

    adjXcor = x/50;
    adjYcor = y/50;
  }

  public void summonHero() {
    fill(255, 0, 0);
    ellipse(xcor, ycor, 50, 50);
    delay(1);
  }

  public void trackHero(Heroes hero) {
    int moveThere;

    if(hero.adjXcor < adjXcor){
        moveThere = 1;
    }
    else if(hero.adjXcor > adjXcor){
        moveThere = 3;
    }
    else if(hero.adjYcor < adjYcor){
        moveThere = 0;
    }
    else{
      moveThere = 2;
    }

    if (ycor > 25 && moveThere == 0) {
      ycor -= 50;
      adjYcor--;
    }
    if (xcor > 25 && moveThere == 1) {
      xcor -= 50;
      adjXcor--;
    }
    if (ycor < (height - 426) &&  moveThere == 2) {
      ycor += 50;
      adjYcor++;
    }
    if (xcor < (width - 26) &&  moveThere == 3) {
      xcor += 50;
      adjXcor++;
    }
    moves--;
  }
}