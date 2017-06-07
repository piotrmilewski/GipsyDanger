public class Map {

  float increment = 0.02;
  int currAvailWaves;
  PImage img;

  Map( int seed ) {
    setup( seed);
    currAvailWaves = seed;
  }

  void setup(int seed) { //add "int seed" as a parameter after adding into woo
    noiseSeed(seed); //uncomment after adding to Woo
    noiseSeed(0);
    noiseDetail(5, 0.6);
  }

  void startMenu() {
    background(0);
    textSize(30);
    fill(255);
    text("Press any key to begin", 250, 400);
  }

  void mainMenu() {
    background(0);
    textSize(30);
    fill(255);
    text("1. Select Wave", 250, 200);
    text("2. Manage your Team", 250, 300);
    text("3. Leave Game", 250, 400);
  }

  void waveSelection(){
    background(0);
    textSize(22);
    fill(255);
   for (int i = 1; i <= currAvailWaves + 1; i++){
     text(i + ". Trial " + i, 350, 200 + (10 * i));
   }
  }
  
  void characSelection() {
    
  }

  void refresh() { //rename to refresh after adding to Woo
    loadPixels();

    float yoff = 0.0;
    for (int y = 0; y < (width * height) - 321201; y++) {
      yoff += increment;
      float xoff = 0.0;
      for (int x = 0; x < width; x++) {
        xoff += increment;
        float bright = noise(xoff, yoff);
        float r = bright * 200;
        float b = bright * 64;
        pixels[x+y] = color(r, 100, b);
      }
      y = y + (width-1);
    }
    updatePixels();
    int grid = 50; // change this number to 20 or 50, etc., if you want fewer grid lines
    stroke(255);
    //vertical lines
    for (int i = 0; i < width; i+=grid) {
      line (i, 0, i, height-401);
    }
    //horizontal lines
    for (int i = 0; i < height-400; i+=grid) {
      line (0, i, width, i);
    }
    fill(255);
    img = loadImage("menu.JPG");
    image(img, 201, 401, 601, 401);
    printStats();
    sideMenu();
  }

  void sideMenu() {
    int grid = 80;
    stroke(255);
    //horizontal lines
    for (int i = 481; i < height; i+=grid) {
      line (0, i-1, width-601, i-1);
      line (0, i, width-601, i);
      line (0, i+1, width-601, i+1);
    }
    textSize(30);
    fill(255);
    text("Swap\nPlaces", 40, 428);
    text("Danger\nZone", 40, 509);
    text("End\nTurn", 40, 590);
    text("Surrender", 40, 691);
  }

  void printStats() {
    textSize(22);
    fill(0);
    if (curPlayer != null) {
      //left stats (Str, Mag, Skill, Spd, Lck, Def, Res
      text(curPlayer.getStr(), 290, 560); //change 177 with Hero.getAccordingValue()
      text(curPlayer.getMag(), 290, 590); //EVERY 177 IS A PLACEHOLDER
      text(curPlayer.getSkill(), 290, 620);
      text(curPlayer.getSpeed(), 290, 650);
      text(curPlayer.getLuck(), 290, 680);
      text(curPlayer.getDef(), 290, 710);
      text(curPlayer.getRes(), 290, 740);
      //upper stats
      text(curPlayer.getLevel(), 425, 495);
      text(curPlayer.getExp(), 550, 495);
      text(curPlayer.getHp() + "/" + curPlayer.getHpCap(), 450, 522);
      //upper right stats
      text((int)curPlayer.getAtk(), 685, 430);
      text((int)curPlayer.getHit(), 685, 460);
      text((int)curPlayer.getCrit(), 685, 490);
      text((int)curPlayer.getAvo(), 685, 520);
      text("5", 755, 528);
      //weapon containment
      int constant = 0;
      Weapon temp;
      for (Iterator<Weapon> itr = (curPlayer._weapons).iterator(); itr.hasNext();){
        temp = itr.next();
        text(temp.getName(), 410, 560 + constant);
        text(temp.getDurability(), 740, 560 + constant);
        constant += 34;
      }
      //name
      textSize(26);
      fill(255);
      text(curPlayer.getName(), 390, 430);
    }
  }
}