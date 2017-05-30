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

  public void moveHero() {
    int moveThere;
    
    if(
    
    if ( moves > 0) {
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
    }
    moves--;
  }
}