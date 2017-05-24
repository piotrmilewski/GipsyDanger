public class Heroes {

  private int xcor;
  private int ycor;

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
      if (key == 'W' || key == 'w') {
        ycor -= 25;
      }
      if (key == 'A' || key == 'a') {
        xcor -= 25;
      }
      if (key == 'S' || key == 's') {
        ycor += 25;
      }
      if (key == 'D' || key == 'd') {
        xcor += 25;
      }
    }