float increment = 0.01;

void setup() {
  size(640, 640);
}

void draw() {
  loadPixels();

  float yoff = 0.0;
  for (int y = 0; y < width * (height); y++) {
    yoff += increment;
    float xoff = 0.0;
    for (int x = 0; x < width; x++) {
      xoff += increment;
      float bright = noise(xoff, yoff) * 255;
      pixels[x+y] = color(bright, 160, 125);
    }
    y = y + (width-1);
  }
  updatePixels();
}