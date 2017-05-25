public class Heroes {

  protected int xcor;
  protected int ycor;

  public Heroes() {
    xcor = 25;
    ycor = 25;
  }

  public Heroes(int x, int y) {
    xcor = x;
    ycor = y;
  }

  public void summonHero() {
    ellipse(xcor, ycor, 50, 50);
    fill(0);
  }

  public void moveHero() {
    if (keyPressed) {
      if (ycor > 25 && (key == 'W' || key == 'w')) {
        ycor -= 50;
        keyPressed = false;
      }
      if (xcor > 25 && (key == 'A' || key == 'a')) {
        xcor -= 50;
        keyPressed = false;
      }
      if (ycor < 775 && (key == 'S' || key == 's')) {
        ycor += 50;
        keyPressed = false;
      }
      if (xcor < 775 && (key == 'D' || key == 'd')) {
        xcor += 50;
        keyPressed = false;
      }
    }
  }
}