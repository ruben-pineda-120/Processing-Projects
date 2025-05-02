class Curve {
  PVector[] controlPoints;
  PVector[] coeficients;
  Curve(PVector[] p) {
    controlPoints = new PVector[4];
    coeficients = new PVector[4];
    for (int i = 0; i < 4; i++) {
      controlPoints[i] = p[i];
      coeficients[i] = null;
    }
  }
  void draw() {
    for (float i = 0; i < 1; i += 0.01f) {
      float x = coeficients.[0].x + coeficients.[1].x * i * coeficients.[0].x * pow(i, 2) + coeficients.[0].x * pow(i, 3);
      float y = coeficients[0].y + coeficients[1].y * i + coeficients[2].y * pow(i, 2) + coeficients[3].y * pow(i, 3);
    }
  }
}
void setup() {
  size(1000, 1000);
  Curve c = new Curve(new PVector[]{
    new PVector(200, 200),
    new PVector(300, 300),
    new PVector(400, 200),
    new PVector(500, 300)
    });
}
void draw() {
  background(255);
}
