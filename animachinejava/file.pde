Table RAW_DATA;
float X,Y,Z;
float a,b,c;
int i = 0;
float mag = 0;
float theta;
float[] norm = {0,0,0};
float[] Q0 = {1,0,0,0};
float[] rotation = {0,0,0,0};
boolean oneloop = true;
import processing.opengl.*;
void setup() {
  size(450, 450, OPENGL);
  b = 0;
  RAW_DATA = loadTable("GYRO_DATA_RAW.csv", "header");
}
void draw(){

      background(0, 128, 255);
  lights();
  //translate(width/2, height/2);
    fill(255, 128, 0);

  

  TableRow row = RAW_DATA.getRow(i);
  
  float wX = row.getFloat("X");
  float wY = row.getFloat("Y");
  float wZ = row.getFloat("Z");
  float dt = row.getFloat("TIME");

  c = (dt - b)/1000.0;
  b = dt;
 //println("dt = "+ dt, "past dt = "+ b, "elapsed = "+ c);
  i++;
  
   mag = sqrt(sq(wX)+sq(wY)+sq(wZ));
   norm[0] = wX/mag;
   norm[1] = wY/mag;
   norm[2] = wZ/mag;
   theta = (mag * c);
   
   float[] Q1 = {cos(theta/2.0), -(norm[0] * sin(theta/2.0)), -(norm[1] * sin(theta/2.0)), -(norm[2] * sin(theta/2.0))};
    //
    //println();
    
         // Hamiltonion: Q1 * Q0
      
      float a1 = Q1[0], b1 = Q1[1], c1 = Q1[2], d1 = Q1[3];
      float a2 = Q0[0], b2 = Q0[1], c2 = Q0[2], d2 = Q0[3];
      
      rotation[0] = a1*a2-b1*b2-c1*c2-d1*d2;
      rotation[1] = a1*b2+b1*a2+c1*d2-d1*c2;                                  // check this 
      rotation[2] = a1*c2-b1*d2+c1*a2+d1*b2;
      rotation[3] = a1*d2+b1*c2-c1*b2+d1*a2;
      Q0[0]= Q1[0];
       Q0[1]= Q1[1];
        Q0[2]= Q1[2];
         Q0[3]= Q1[3];
   // println("w "+rotation[0],"x " + rotation[1],"y " + rotation[2],"z " + rotation[3]);
   
        float sinr_cosp = 2.0 * (rotation[0] * rotation[1] + rotation[2] * rotation[3]);
     float cosr_cosp = 1.0 - 2.0 * (rotation[1] * rotation[1] + rotation[2] * rotation[2]);
     X = atan2(sinr_cosp,cosr_cosp);
     
     // y axis
     
     float sinp = 2.0 * (rotation[0] * rotation[2] - rotation[1] * rotation[3]);
     if(sinp >= 1){
       Y = 1.571;
     }
     else if(sinp <= -1.0){                                                                                 
       Y = -1.571;
     }else{
       Y  = asin(sinp);
     }
     
     //z axis 
     
     float siny_cosp = 2.0 * (rotation[0] * rotation[3] + rotation[1] * rotation[2]);
     float cosy_cosp = 1.0-2.0 * (rotation[2] * rotation[2] + rotation[3] * rotation[3]);
     Z = atan2(siny_cosp,cosy_cosp);
     
     
     
     //cylin rotate
        pushMatrix();    
    translate( 225, 225, -100 );
  // rotateX((180/2));
   // rotateY(180/2);
    //rotateZ(180/2);
    //rotateZ(HALF_PI);
    println("X " + degrees(wX) + "Y " + degrees(wY)  + "Z " + degrees(wZ) );
    rotateX(wX);
    rotateY(wZ);
    rotateZ(wY);
    drawCylinder( 30, 30, 300 );
    popMatrix();

   
  delay(25);
}

void drawCylinder( int sides, float r, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;

    // draw top of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, halfHeight);
        vertex( x, y, -halfHeight);    
    }
    endShape(CLOSE);

}
