int points = 0;
float[] trianglePoints = new float[6];
void setup() {
    size(500, 500);
    background(255, 255, 255);
}

void draw() {

}

void windowMoved(){
  background(random(0, 255), random(0, 255), random(0, 255));
}

void mouseClicked(){
    stroke(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(10);
    point(mouseX, mouseY);
    point(width - mouseX, mouseY);
    point(mouseX, height - mouseY);
    point(width - mouseX, height - mouseY);
}
