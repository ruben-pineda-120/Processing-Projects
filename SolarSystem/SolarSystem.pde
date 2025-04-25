final float MAX_ANGLE = 360;
float earthAngle;
final float EARTH_SPEED = 1;
float moonAngle;
final float MOON_SPEED = 1;
float marsAngle;
final float MARS_SPEED = 5;
float jupiterAngle;
final float JUPITER_SPEED = -3;
float jupiterMoonAngle;
final float JUPITER_MOON_SPEED = 10;

void setup() {
  size(1000, 1000);
  windowTitle("Made In Heaven");
  frameRate(60);
}

void draw() {
  ellipseMode(RADIUS);
  translate(width / 2, height / 2);
  pushMatrix();
  background(100);
  fill(255, 255, 0);
  circle(0, 0, 40);
  //Earth
  if (earthAngle >= MAX_ANGLE) {
    earthAngle = earthAngle - MAX_ANGLE;
  } else {
    earthAngle += EARTH_SPEED;
  }
  rotate(radians(earthAngle));
  translate(80, 0);
  fill(0, 0, 255);
  circle(0, 0, 10);
  pushMatrix();
  //Moon
  popMatrix();
  if (moonAngle >= MAX_ANGLE) {
    moonAngle = moonAngle - MAX_ANGLE;
  } else {
    moonAngle += MOON_SPEED;
  }
  rotate(radians(moonAngle));
  translate(20, 0);
  fill(200, 200, 200);
  circle(0, 0, 5);
  //Mars
  popMatrix();
  pushMatrix();
  if (marsAngle >= MAX_ANGLE) {
    marsAngle = marsAngle - MAX_ANGLE;
  } else {
    marsAngle += MARS_SPEED;
  }
  rotate(radians(marsAngle));
  translate(150, 0);
  fill(255, 0, 0);
  circle(0, 0, 5);
  //Jupiter
  popMatrix();
  if (jupiterAngle >= MAX_ANGLE) {
    jupiterAngle = jupiterAngle - MAX_ANGLE;
  } else {
    jupiterAngle += JUPITER_SPEED;
  }
  rotate(radians(jupiterAngle));
  translate(500, 0);
  fill(255, 255, 255);
  circle(0, 0, 80);
  pushMatrix();
  pushMatrix();
  //Jupiter Moons
  popMatrix();
  if (jupiterMoonAngle >= MAX_ANGLE) {
    jupiterMoonAngle = jupiterMoonAngle - MAX_ANGLE;
  } else {
    jupiterMoonAngle += JUPITER_MOON_SPEED;
  }
  rotate(radians(jupiterMoonAngle));
  translate(100, 0);
  fill(0, 255, 0);
  circle(0, 0, 5);
  popMatrix();
  rotate(radians(jupiterMoonAngle * 2));
  translate(200, 0);
  fill(255, 0, 0);
  circle(0, 0, 5);
}
