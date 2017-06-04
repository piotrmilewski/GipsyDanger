public class Map {

  float increment = 0.02;
  PImage img;

  Map( int seed ) {
    setup( seed);
  }

  void setup(int seed) { //add "int seed" as a parameter after adding into woo
    noiseSeed(seed); //uncomment after adding to Woo
    noiseSeed(0);
    noiseDetail(5, 0.6);
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
  }

  void printStats() { //add argument Heroes Hero after testing
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
      text(curPlayer.getAtk(), 665, 430);
      text(curPlayer.getHit(), 665, 460);
      text(curPlayer.getCrit(), 665, 490);
      text(curPlayer.getAvo(), 665, 520);
      text("17", 749, 528);
      //weapon containment
      text("177", 410, 560);
      text("177", 410, 594);
      text("177", 410, 628);
      text("177", 410, 662);
      text("177", 410, 696);   
      //weapon durability
      text("177", 740, 560);
      text("177", 740, 594);
      text("177", 740, 628);
      text("177", 740, 662);
      text("177", 740, 696);
      //name
      textSize(26);
      fill(255);
      text("Levi", 390, 430);
    }
  }
}