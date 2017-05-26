public class Heroes {

  //Data
  protected int xcor;
  protected int ycor;
  protected int moves;
  protected boolean alive;

  //Stats
  /*protected int lvl;
   protected int exp;
   protected int hp;
   protected int atk;
   protected int def;
   protected float hit;
   protected float crit;
   protected float avo;
   protected int str;
   protected int res;
   protected int mag;
   protected float skill;
   protected float speed;
   protected float luck;
   */


  public Heroes() {
    xcor = 25;
    ycor = 25;
    alive = true;
    moves = 5;
  }

  public Heroes(int x, int y) {
    xcor = x;
    ycor = y;
    moves = 5;
    alive = true;
  }

public void resetMoves(){
   moves = 5; 
}

  public void summonHero() {
    ellipse(xcor, ycor, 50, 50);
    fill(0);
  }

  public void moveHero() {
    if ( moves > 0) {
      if (keyPressed) {
        if (ycor > 25 && (key == 'W' || key == 'w')) {
          ycor -= 50;
          moves--;
          keyPressed = false;
        }
        if (xcor > 25 && (key == 'A' || key == 'a')) {
          xcor -= 50;
          moves--;
          keyPressed = false;
        }
        if (ycor < 775 && (key == 'S' || key == 's')) {
          ycor += 50;
          moves--;
          keyPressed = false;
        }
        if (xcor < 775 && (key == 'D' || key == 'd')) {
          xcor += 50;
          moves--;
          keyPressed = false;
        }
      }
    }
  }
}