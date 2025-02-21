public class Vector2{
    public float x;
    public float y;
    public float speed;
    public Vector2(float x, float y, float speed) {
        this.x = x;
        this.y = y;
        this.speed = speed;
    }
    public Vector2() {
        
    }
    public void Lerp(Vector2 other) {
        x = (1.0f - speed) * x + speed * other.x;
        y = (1.0f - speed) * y + speed * other.y;
    }
    public void DrawEllipse() {
        fill(255, 0, 0);
        ellipse(x, y, width / 20, height / 20);
    }
}

public float speed = 0.001f;

public Vector2 playerPosition, enemyPosition, enemyPosition2;
public Vector2[] enemies = new Vector2[5];

void setup() {
    size(500, 500);
    background(0);
    enemies[0] = new Vector2(width / 2, width / 2, 0.2);
    enemies[1] = new Vector2(width / 4, width / 4, 0.1);
    enemies[2] = new Vector2(width / 8, width / 8, 0.05);
    enemies[3] = new Vector2(width / 4, width / 4, -0.1);
    enemies[4] = new Vector2(width / 8, width / 8, -0.2);
    playerPosition = new Vector2();
}

void draw() {
    background(0);
    playerPosition.x = mouseX;
    playerPosition.y = mouseY;
    for (Vector2 v : enemies){
        v.Lerp(playerPosition);
        v.DrawEllipse();
    }
    /*
    enemyPosition.x = (1.0f - speed) * enemyPosition.x + speed * playerPosition.x;
    enemyPosition.y = (1.0f - speed) * enemyPosition.y + speed * playerPosition.y;
    enemyPosition2.x = (1.0f - speed) * enemyPosition2.x + speed * playerPosition.x;
    enemyPosition2.y = (1.0f - speed) * enemyPosition2.y + speed * playerPosition.y;
    fill(255, 0, 0);
    ellipse(enemyPosition.x, enemyPosition.y, width/20, height/20);
    fill(0, 255, 0);
    ellipse(enemyPosition.x, enemyPosition.y, width/20, height/20);
    fill(0, 255, 0);
    ellipse(enemyPosition2.x, enemyPosition2.y, width/20, height/20);
    */
}
