PImage tomate;
void setup() {
  size(800, 346);
  tomate = loadImage("Tomate.jpg");
  drawImage();
}
void draw() {
}
void drawImage() {
  imageMode(CENTER);
  image(tomate, 200, 173);
  for (int i = 0; i < tomate.width; i++) {
    for (int j = 0; j < tomate.height; j++) {
      color currentPixel = tomate.get(i, j);
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      tomate.set(i, j, color(.299 * r + .587 * g + .114 * b));
    }
  }
  image(tomate, 600, 173);
}
