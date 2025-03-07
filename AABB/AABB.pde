import java.util.*;
import java.awt.Color;
public class Wall{
  public PVector minVector, maxVector;
  public int colorWall;
  public Wall(PVector minVector, PVector maxVector, int colorWall){
    this.minVector = minVector;
    this.maxVector = maxVector;
    this.colorWall = colorWall;
  }
  public void draw(){
    println("Draw");
    rectMode(CORNERS);
    fill(colorWall);
    rect(minVector.x, minVector.y, maxVector.x, maxVector.y);
  }
}
final int NUM_OF_WALLS = 12;
final int WALL_WIDTH = 100, WALL_HEIGHT = 50;
List<Wall> walls;
boolean isColliding;
Wall p;

void setup() {
    size(500, 500);
    background(255);
    InitCharacters();
}

void InitCharacters() {
  p = new Wall(new PVector(0, 0), new PVector(0, 0), 0);
  walls = new LinkedList<Wall>();
  for(int i = 0; i < NUM_OF_WALLS; i++){
    PVector tempMinVector = new PVector(random(0, width - WALL_WIDTH), random(0, height - WALL_HEIGHT));
    Wall tempWall = new Wall(tempMinVector, new PVector(tempMinVector.x + WALL_WIDTH, tempMinVector.y + WALL_HEIGHT), 153);
    walls.add(tempWall);
  }
}

void draw() {
  p.minVector.x = mouseX;
  p.minVector.y = mouseY;
  p.maxVector.x = p.minVector.x + WALL_WIDTH;
  p.maxVector.y = p.minVector.y + WALL_HEIGHT;
  background(255);
  for(Wall w : walls){
    w.draw();
  }
}

void mouseMoved() {
    
}
