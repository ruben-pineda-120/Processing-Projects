float x = width / 2, y = height / 2, vx = 15, vy = -20, ax, ay, m = 1, h = 0.04, fgx = 0, fgy = 9.81;
void setup(){
  size(500, 500);
  frameRate(120);
}

void draw(){
  background(0);
  ax = fgx/m;
  ay = fgy/m;
  //
  vx = vx + h * ax;
  vy = vy + h * ay;
  //
  x = x + h * vx;
  y = y + h * vy;
  fill(255);
  ellipseMode(RADIUS);
  circle(x, y, 5);
}
