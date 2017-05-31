public class Heroes {

  //Data
  protected int xcor; //pixel location
  protected int ycor; //pixel location

  protected int adjXcor; //scaled down version of pixel location
  protected int adjYcor; //scaled down version of pixel location

  protected int moves; //amount of moves you have left in your turn
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

    adjXcor = xcor/50;
    adjYcor = ycor/50;

    alive = true;
    moves = 5;
  }

  public Heroes(int x, int y) {
    xcor = x;
    ycor = y;

    adjXcor = xcor/50;
    adjYcor = ycor/50;

    moves = 5;
    alive = true;
  }

  public void resetMoves() {
    moves = 5;
  }

  public void summonHero() {
    ellipse(xcor, ycor, 50, 50);
    fill(0);
  }

  /*   
   Use the W A S D keys to move your hero around the board
   */
  public void moveHero() {

    //check that this hero still has moves left
    if ( moves > 0) {

      //check if a key was pressed
      if (keyPressed) {

        //if the key was W, move north one space
        //prevent hero from leaving board space
        if (ycor > 25 && (key == 'W' || key == 'w')) {
          ycor -= 50;
          adjYcor--; 
          moves--;
          keyPressed = false;
        }

        //if the key was A, move west one space
        //prevent hero from leaving board space
        if (xcor > 25 && (key == 'A' || key == 'a')) {
          xcor -= 50;
          adjXcor--; 
          moves--;
          keyPressed = false;
        }

        //if the key was S, move south one space
        //prevent hero from leaving board space
        if (ycor < (height - 426) && (key == 'S' || key == 's')) {
          ycor += 50;
          adjYcor++; 
          moves--;
          keyPressed = false;
        }

        //if the key was D, move east one space
        //prevent hero from leaving board space
        if (xcor < (width - 26) && (key == 'D' || key == 'd')) {
          xcor += 50;
          adjXcor++; 
          moves--;
          keyPressed = false;
        }
      }
    }
  }

  /*
check if this hero can interact with another hero
   if this hero is adjacent to another hero, 
   then this hero can interact with the other hero
   */
  public boolean interact(Heroes hero) {
    return dist(this.adjXcor, this.adjYcor, hero.adjXcor, hero.adjYcor) == 1;
  }
}