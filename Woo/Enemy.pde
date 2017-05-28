public class Enemy extends Heroes {

  public Enemy(int x, int y) {
    xcor = x;
    ycor = y;
  }

  public void summonHero() {
    fill(255, 0, 0);
    ellipse(xcor, ycor, 50, 50);
    delay(10);
  }

  public void moveHero() {
    int moveThere = (int)(Math.random()*4);
    
    if ( moves > 0) {
      if (ycor > 25 && moveThere == 0) {
        ycor -= 50;
      }
      if (xcor > 25 && moveThere == 1) {
        xcor -= 50;
      }
      if (ycor < 775 &&  moveThere == 2) {
        ycor += 50;
      }
      if (xcor < 775 &&  moveThere == 3) {
        xcor += 50;
      }
    }
    moves--;
  }
}