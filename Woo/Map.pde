public class Map {

  float increment = 0.02;
  
  Map( int seed ){
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
    for (int y = 0; y < width * (height); y++) {
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
    for (int i = 0; i < width; i+=grid) {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) {
      line (0, i, width, i);
    }
    fill(255);
  }
}