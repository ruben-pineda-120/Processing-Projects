PImage tomate, tomate2, tomate3;
void setup() {
  size(800, 346);
  tomate = loadImage("Tomate.jpg");
  tomate2 = loadImage("Tomate.jpg");
  tomate3 = loadImage("Tomate.jpg");
  drawImage();
}
void draw() {
}
void drawImage() {
  imageMode(CENTER);
  image(tomate, 200, 173);
  for (int i = 0; i < tomate2.width; i++) {
    for (int j = 0; j < tomate2.height; j++) {
      color currentPixel = tomate2.get(i, j);
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      tomate2.set(i, j, color(.299 * r + .587 * g + .114 * b));
    }
  }
  //image(tomate2, 600, 173);
  for (int i = 0; i < tomate3.width; i++) {
    for (int j = 0; j < tomate3.height; j++) {
      color currentPixel = tomate3.get(i, j);
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      float y = 0;
      //if(r + g + b > 382) y = 255;
      if(r > 127 || g > 127 || b > 127) y = 255;
      tomate3.set(i, j, color(y));
    }
  }
  image(tomate3, 600, 173);
}
