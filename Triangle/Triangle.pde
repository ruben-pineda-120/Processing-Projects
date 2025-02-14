int points = 0;
float[] trianglePointTopLeft = new float[6];
float[] trianglePointTopRight = new float[6];
float[] trianglePointBottomLeft = new float[6];
float[] trianglePointBottomRight = new float[6];
void setup() {
    size(500, 500);
    background(255, 255, 255);
}

void draw() {
    
}

void mouseClicked() {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(10);
    point(mouseX, mouseY);
    println("Points: " + points);
    point(width - mouseX, mouseY);
    point(mouseX, height - mouseY);
    point(width - mouseX, height - mouseY);
    if (points == 0) {
        trianglePointTopLeft[0] = mouseX;
        trianglePointTopLeft[1] = mouseY;
        //
        trianglePointTopRight[0] = width - mouseX;
        trianglePointTopRight[1] = mouseY;
        //
        trianglePointBottomLeft[0] = mouseX;
        trianglePointBottomLeft[1] = height - mouseY;
        //
        trianglePointBottomRight[0] = width - mouseX;
        trianglePointBottomRight[1] = height - mouseY;
        points++;
    } else if (points == 1) {
        trianglePointTopLeft[2] = mouseX;
        trianglePointTopLeft[3] = mouseY;
        //
        trianglePointTopRight[2] = width - mouseX;
        trianglePointTopRight[3] = mouseY;
        //
        trianglePointBottomLeft[2] = mouseX;
        trianglePointBottomLeft[3] = height - mouseY;
        //
        trianglePointBottomRight[2] = width - mouseX;
        trianglePointBottomRight[3] = height - mouseY;
        points++;
    } else if (points == 2) {
        trianglePointTopLeft[4] = mouseX;
        trianglePointTopLeft[5] = mouseY;
        //
        trianglePointTopRight[4] = width - mouseX;
        trianglePointTopRight[5] = mouseY;
        //
        trianglePointBottomLeft[4] = mouseX;
        trianglePointBottomLeft[5] = height - mouseY;
        //
        trianglePointBottomRight[4] = width - mouseX;
        trianglePointBottomRight[5] = height - mouseY;
        points++;
        points = 0;
        triangle(trianglePointTopLeft[0], trianglePointTopLeft[1], trianglePointTopLeft[2], trianglePointTopLeft[3], trianglePointTopLeft[4], trianglePointTopLeft[5]);
        triangle(trianglePointTopRight[0], trianglePointTopRight[1], trianglePointTopRight[2], trianglePointTopRight[3], trianglePointTopRight[4], trianglePointTopRight[5]);
        triangle(trianglePointBottomLeft[0], trianglePointBottomLeft[1], trianglePointBottomLeft[2], trianglePointBottomLeft[3], trianglePointBottomLeft[4], trianglePointBottomLeft[5]);  
        triangle(trianglePointBottomRight[0], trianglePointBottomRight[1], trianglePointBottomRight[2], trianglePointBottomRight[3], trianglePointBottomRight[4], trianglePointBottomRight[5]);    
    }
}
