import java.util.*;
import java.awt.Color;
public class Vector2{
    public float x;
    public float y;
    public float speed;
    public float circleRadius;
    public Color c;
    public Vector2(float x, float y, float speed, float circleRadius) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.circleRadius = circleRadius;
        c = new Color(255, 0, 0);
    }
    public Vector2() {
        
    }
    public void Lerp(Vector2 other) {
        x = (1.0f - speed) * x + speed * other.x;
        y = (1.0f - speed) * y + speed * other.y;
    }
    public void DrawEllipse() {
        fill(c.getRed(), c.getGreen(), c.getBlue());
        ellipse(x, y, circleRadius, circleRadius);
    }
}

public List<Vector2> elements = new LinkedList<>(); 

public float speed = 0.001f;

public Vector2 player;
long collisionCounter;
boolean isColliding;

void setup() {
    size(500, 500);
    background(0);
    player = new Vector2();
    InitCharacters();
}

void InitCharacters() {
    for (int i = 0; i < 10; i++) {
        elements.add(new Vector2(random(0, height), random(0, width), 0.2, 20));
    }
}

void draw() {
    background(0);
    player.x = mouseX;
    player.y = mouseY;
    player.circleRadius = 30;
    player.DrawEllipse();
    for (Vector2 v : elements) {
        //v.Lerp(playerPosition);
        v.DrawEllipse();
    }
}

void mouseMoved() {
    for (Vector2 v : elements) {
        float x = v.x - player.x;
        float y = v.y - player.y;
        float moduleDistance = sqrt((pow(x, 2) + pow(y, 2)));
        if (moduleDistance <= (v.circleRadius + player.circleRadius)) {
            println("Collision " + collisionCounter);
            collisionCounter++;
            isColliding = true;
        } else{
            isColliding = false;
        }
    }
}
