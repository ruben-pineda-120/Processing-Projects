import java.util.*;
import java.awt.Color;
public class Wall{
  public PVector minVector, maxVector;
  public Wall(PVector minVector, PVector maxVector){
    this.minVector = minVector;
    this.maxVector = maxVector;
  }
  public void draw(){
    println("Draw");
    rectMode(CORNERS);
    fill(153);
    rect(minVector.x, minVector.y, maxVector.x, maxVector.y);
  }
}
final int NUM_OF_WALLS = 12;
final int WALL_WIDTH = 10, WALL_HEIGHT = 20;
List<Wall> walls;
boolean isColliding;

void setup() {
    size(500, 500);
    background(255);
    InitCharacters();
}

void InitCharacters() {
  walls = new LinkedList<Wall>();
  for(int i = 0; i < NUM_OF_WALLS; i++){
    PVector tempMinVector = new PVector(width / 2, height / 2);
    Wall tempWall = new Wall(tempMinVector, new PVector(tempMinVector.x + WALL_WIDTH, tempMinVector.y + WALL_HEIGHT));
    walls.add(tempWall);
  }
  walls.get(0).draw();
}

void draw() {
    background(0);

}

void mouseMoved() {
    
}
