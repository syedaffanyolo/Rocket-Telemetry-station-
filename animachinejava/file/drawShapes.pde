void makeRocket(){
      pushMatrix();  
    fill(110,106,0);
    translate( 800, 850, -100 );
    rotateX(PI/2);
    rotateX(X);
    rotateY(Z);
    rotateZ(Y);
    pushMatrix(); 
    translate( 0, 0, 200 );
    drawCylinder( 30, 30, 1, 100 );
    popMatrix();
    drawCylinder(30, 30, 30, 300 ); 
    pushMatrix();
    translate( 0, 0, -120 );
    rotateZ(PI/2);
    fill(225);
    drawCylinder( 2, 60, 30, 50 );
    popMatrix();
    pushMatrix();
    fill(225);
    translate( 0, 0, -120 );
    drawCylinder( 2, 60, 30, 50 );
    popMatrix();
    popMatrix();
}
void drawCylinder( int sides, float r1, float r2, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;

    // draw top of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);    
    }
    endShape(CLOSE);

}
