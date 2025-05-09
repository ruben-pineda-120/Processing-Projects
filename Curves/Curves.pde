import java.util.List;
import java.util.LinkedList;
class Player {
  int numOfCurves;
  int currentCurve;
  PVector position;
  float t;
  float speed;
  PImage image;
  Player(int numOfCurves, float speed, PImage image) {
    this.numOfCurves = numOfCurves;
    this.position = new PVector(0, 0);
    this.t = 0;
    this.speed = speed;
    this.image = image;
  }
  void draw() {
    if (t == 0) {
      position = cs.get(currentCurve).controlPoints[0];
      t += speed;
    } else {
      position.x = cs.get(currentCurve).coeficients[0].x + cs.get(currentCurve).coeficients[1].x * t + cs.get(currentCurve).coeficients[2].x * pow(t, 2) + cs.get(currentCurve).coeficients[3].x * pow(t, 3);
      position.y = cs.get(currentCurve).coeficients[0].y + cs.get(currentCurve).coeficients[1].y * t + cs.get(currentCurve).coeficients[2].y * pow(t, 2) + cs.get(currentCurve).coeficients[3].y * pow(t, 3);
      if (t >= 1) {
        currentCurve++;
        if (currentCurve >= numOfCurves) currentCurve = 0;
        t = 0;
      } else {
        t += speed;
      }
    }
    imageMode(CENTER);
    image(image, position.x, position.y, 50, 50);
  }
}
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
  public void calculateInterpolation() {
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
  public void calculateBezier() {
    // Coeficients
    coeficients[0].x = controlPoints[0].x;
    coeficients[0].y = controlPoints[0].y;


    coeficients[1].x = 3 * (controlPoints[1].x - controlPoints[0].x);
    coeficients[1].y = 3 * (controlPoints[1].y - controlPoints[0].y);

    coeficients[2].x = 3 * (controlPoints[2].x - controlPoints[1].x);
    coeficients[2].y = 3 * (controlPoints[2].y - controlPoints[1].y);

    coeficients[3].x = controlPoints[3].x - controlPoints[0].x - coeficients[1].x - coeficients[2].x;
    coeficients[3].y = controlPoints[3].y - controlPoints[0].y - coeficients[1].y - coeficients[2].y;
  }
}
List<Curve> cs = new LinkedList<>();
List<Player> ps = new LinkedList<>();
void setup() {
  size(1000, 1000);
  cs.add(new Curve(new PVector[]{
    new PVector(200, 50),
    new PVector(300, 150),
    new PVector(400, 50),
    new PVector(500, 150)
    }));
  cs.add(new Curve(new PVector[]{
    new PVector(500, 150),
    new PVector(600, 250),
    new PVector(700, 350),
    new PVector(650, 375)
    }));
  cs.add(new Curve(new PVector[]{
    new PVector(650, 375),
    new PVector(450, 250),
    new PVector(375, 275),
    new PVector(325, 375)
    }));
  cs.add(new Curve(new PVector[]{
    new PVector(325, 375),
    new PVector(275, 325),
    new PVector(225, 400),
    new PVector(200, 50)
    }));
  for (Curve c : cs) {
    c.calculateInterpolation();
  }
  ps.add(new Player(cs.size(), 0.01, loadImage("teto.jpg")));
  ps.add(new Player(cs.size(), 0.02, loadImage("teto.jpg")));
}
void draw() {
  background(255);
  for (Curve c : cs) {
    c.draw();
  }
  for (Player p : ps) {
    p.draw();
  }
}
