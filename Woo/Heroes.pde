public class Heroes {

  //Data
  protected int xcor; //pixel location
  protected int ycor; //pixel location

  protected int adjXcor; //scaled down version of pixel location
  protected int adjYcor; //scaled down version of pixel location

  protected int moves; //amount of moves you have left in your turn
  protected boolean alive; 

  //Stats
  protected int lvl;
  protected int exp;
  protected int hp;
  protected int hpCap;
  protected int atk;
  protected int def;
  protected float hit;
  protected float crit;
  protected float avo;
  protected int str;
  protected int res;
  protected int mag;
  protected int skill;
  protected int speed;
  protected int luck;

  //Default constructor for testing purposes only
  public Heroes() {
    xcor = 25;
    ycor = 25;

    adjXcor = xcor/50;
    adjYcor = ycor/50;

    alive = true;
    moves = 5;

    //Instantiate stats
    lvl = 0;
    exp = 0;
    hp = 10;
    hpCap = 10;
    def = 1;
    str = 1;
    res = 0;
    mag = 0;
    skill = 1;
    speed = 1;
    luck = 0;

    if (str > 0) {
      atk = str;
    } else if (mag > 0) {
      atk = mag;
    }
    hit = ((skill*3) + luck)/2;
    crit = (skill/2);
    avo = ((speed*3) + luck)/2;
  }

  public Heroes(int x, int y, int type) {
    xcor = x;
    ycor = y;

    adjXcor = xcor/50;
    adjYcor = ycor/50;

    moves = 5;
    alive = true;

    //Instantiate stats

    //Lord (1)
    if (type == 1) {
      lvl = 1;
      exp = 0;
      hp = 18;
      hpCap = 18;
      atk = 6;
      def = 7;
      hit = 0.9;
      crit = 0.2;
      avo = 0.5;
      str = 6;
      res = 0;
      mag = 0;
      skill = 5;
      speed = 6;
      luck = 0;
    }

    //Tactician (2)
    if (type == 2) {
      lvl = 1;
      exp = 0;
      hp = 16;
      hpCap = 16;
      atk = 4;
      def = 5;
      hit = 0.9;
      crit = 0.2;
      avo = 0.5;
      str = 4;
      res = 3;
      mag = 0;
      skill = 5;
      speed = 5;
      luck = 0;
    }

    //Cavelier (3)
    if (type == 3) {
      lvl = 1;
      exp = 0;
      hp = 18;
      hpCap = 18;
      atk = 6;
      def = 7;
      hit = 0.9;
      crit = 0.2;
      avo = 0.5;
      str = 6;
      res = 0;
      mag = 0;
      skill = 5;
      speed = 6;
      luck = 0;
    }

    //Knight (4)
    if (type == 4) {
      hp = 18;
      hpCap = 18;
      def = 11;
      str = 8;
      res = 0;
      mag = 0;
      skill = 4;
      speed = 4;
      luck = 0;
    }

    //Myrmidon (5)
    if (type == 5) {
      hp = 16;
      hpCap = 16;
      def = 4;
      str = 4;
      res = 1;
      mag = 1;
      skill = 9;
      speed = 10;
      luck = 0;
    }

    //Thief (6)
    if (type == 6) {
      hp = 16;
      hpCap = 16;
      def = 2;
      str = 3;
      res = 0;
      mag = 0;
      skill = 6;
      speed = 8;
      luck = 0;
    }

    //Fighter (7)
    if (type == 7) {
      hp = 20;
      hpCap = 20;
      def = 4;
      str = 8;
      res = 0;
      mag = 0;
      skill = 5;
      speed = 5;
      luck = 0;
    }

    //Mercenary (8)
    if (type == 8) {
      hp = 18;
      hpCap = 18;
      def = 5;
      str = 5;
      res = 0;
      mag = 0;
      skill = 8;
      speed = 7;
      luck = 0;
    }

    //Archer (9)
    if (type == 9) {
      hp = 16;
      hpCap = 16;
      def = 5;
      str = 5;
      res = 0;
      mag = 0;
      skill = 8;
      speed = 6;
      luck = 0;
    }

    //Mage (10)
    if (type == 10) {
      hp = 16;
      hpCap = 16;
      def = 0;
      str = 0;
      res = 3;
      mag = 4;
      skill = 3;
      speed = 4;
      luck = 0;
    }

    if (str > 0) {
      atk = str;
    } else if (mag > 0) {
      atk = mag;
    }
    hit = ((skill*3) + luck)/2;
    crit = (skill/2);
    avo = ((speed*3) + luck)/2;
  }
  
  public boolean getStatus(){
   return alive; 
  }
  
  public void toggleStatus(){
   alive = !alive; 
  }
  
  public int getLevel(){
    return lvl; 
  }
  
  public int getExp(){
     return exp; 
  }

  public int getHp() {
    return hp;
  }
  
  public int setHp(int newHp){
    int prevHp = hp;
    hp= newHp;
    return prevHp;
  }

  public int getHpCap() {
    return hpCap;
  }

  public int getDef() {
    return def;
  }

  public int getStr() {
    return str;
  }

  public int getRes() {
    return res;
  }

  public int getMag() {
    return mag;
  }

  public int getSkill() {
    return skill;
  }

  public int getSpeed() {
    return speed;
  }

  public int getLuck() {
    return luck;
  }

  public int subtractHp(int damage) {
    if (hp > 0) {
      hp -= damage;
    }
    return hp;
  }
  
  public float getAtk(){
    return atk; 
  }
  
  public float getCrit(){
    return crit; 
  }

public float getHit(){
  return hit;
}

public float getAvo(){
   return avo; 
}
  public void resetMoves() {
    moves = 5;
  }

  public void summonHero() {
    fill(255);
    ellipse(xcor, ycor, 50, 50);
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

  public void attack(Heroes hero) {
    if (hero.getStatus()){
      hero.subtractHp(atk);
      if (hero.getHp() <= 0){
        hero.setHp(0);
        hero.toggleStatus();
      }
    }
  }
}