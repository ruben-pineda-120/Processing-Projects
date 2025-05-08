class Curve {
  PVector[] controlPoints;
  PVector[] coeficients;
  Curve(PVector[] p) {
    controlPoints = new PVector[4];
    coeficients = new PVector[4];
    for (int i = 0; i < 4; i++) {
      controlPoints[i] = p[i];
      coeficients[i] = new PVector(0, 0);
    }
    //Coeficients
    coeficients[0].x = controlPoints[0].x;
    coeficients[0].y = controlPoints[0].y;
    //1
    coeficients[1].x = -5.5 * controlPoints[0].x + 9.0 * controlPoints[1].x - 4.5 * controlPoints[2].x + controlPoints[3].x;
    coeficients[1].y = -5.5 * controlPoints[0].y + 9.0 * controlPoints[1].y - 4.5 * controlPoints[2].y + controlPoints[3].y;
    //2
    coeficients[2].x = 9 * controlPoints[0].x - 22.5 * controlPoints[1].x + 18 * controlPoints[2].x - 4.5 * controlPoints[3].x;
    coeficients[2].y = 9 * controlPoints[0].y - 22.5 * controlPoints[1].y + 18 * controlPoints[2].y - 4.5 * controlPoints[3].y;
    //3
    coeficients[3].x = -4.5 * controlPoints[0].x + 13.5 * controlPoints[1].x - 13.5 * controlPoints[2].x + 4.5 * controlPoints[3].x;
    coeficients[3].y = -4.5 * controlPoints[0].y + 13.5 * controlPoints[1].y - 13.5 * controlPoints[2].y + 4.5 * controlPoints[3].y;
  }
  void draw() {
    fill(0);
    strokeWeight(10);
    for (float t = 0; t < 1; t += 0.01f) {
      float x = coeficients[0].x + coeficients[1].x * t + coeficients[2].x * pow(t, 2) + coeficients[3].x * pow(t, 3);
      float y = coeficients[0].y + coeficients[1].y * t + coeficients[2].y * pow(t, 2) + coeficients[3].y * pow(t, 3);
      point(x, y);
    }
  }
}
Curve c;
void setup() {
  size(500, 500);
  c = new Curve(new PVector[]{
    new PVector(200, 200),
    new PVector(250, 100),
    new PVector(300, 400),
    new PVector(350, 250)
    });
}
void draw() {
  background(255);
  c.draw();
}
