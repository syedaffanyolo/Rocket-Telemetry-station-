import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import grafica.*; 
import processing.opengl.*; 
import java.io.File; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class file extends PApplet {





PImage back;
public String file;
ControlP5 gui1;
ControlP5 gui2;
ControlP5 gui3;
ControlP5 gui4;
ControlP5 gui5;
ControlP5 gui6;
ControlP5 gui7;
ControlP5 gui8;
ControlP5 gui9;
ControlP5 gui10;
ControlP5 gui11;
ControlP5 gui12;
ControlP5 gui13;
ControlP5 gui14;
ControlP5 gui15;
ControlP5 gui16;
ControlP5 gui17;
ControlP5 gui18;
Table RAW_DATA;
float X,Y,Z;
int etaIncrement;
float dt, prevtime, curtime;
int i = 0;
int count;
boolean oneloop2 = true;
float mag = 0;
float theta;
float[] norm = {0,0,0};
float[] Q0 = {1,0,0,0};
float[] rotation = {0,0,0,0};
float biasz; // gyro drift value biased to z axis
float biasy; // gyro drift value biased to y axis
float biasx; // gyro drift value biased to x axis
boolean oneloop = true;
boolean start = false; //starts presenting data 
boolean restart = false;
boolean fileSelected = false;
boolean windowOpened = false;
float wXsum; 
float wYsum;
float wZsum; 
float angleConverter = 1, timeConverter = 1; // converts given parameters to different units.
GPlot Xplot;
GPlot Yplot;
GPlot Zplot;
GPlot Altplot;  //setting plots
GPlot axplot;
GPlot ayplot;
GPlot azplot;

public void setup() {
  
  
 PFont p = createFont("Times",10); 
ControlFont font = new ControlFont(p);
PFont Q = createFont("Times",20); 
ControlFont font2 = new ControlFont(Q);
  
  


addbutton(font,font2);
size(1800, 1000, OPENGL);
//surface.setResizable(true);
prevtime = 0;
//print(file);

back = loadImage("back.jpeg"); // background image
 
  back.resize(4000,4000);
Xplot = new GPlot(this);
Yplot = new GPlot(this);
Zplot = new GPlot(this);
Altplot = new GPlot(this);     // init plots
axplot = new GPlot(this);
ayplot = new GPlot(this);
azplot = new GPlot(this);
setPointsForPlots();

}

public void fileSelected(File selection) {
 
  if (selection == null) {
    //println("Window was closed or the user hit cancel.");
  } else {
   // println("User selected " + selection.getAbsolutePath());
    file = selection.getAbsolutePath();
    fileSelected = true;
     
  }
  }


public void draw(){
  background(0);
  lights();
  fill(255, 128, 0);
  if (start == true && restart == false){
   RAW_DATA = loadTable(file, "header"); // raw data from csv
 // println(file);
  

 //read data for bias
  TableRow rowforbias;
 TableRow row = RAW_DATA.getRow(i);
 while(oneloop2 == true){
 for(count = 0;count<100;count++){
       rowforbias = RAW_DATA.getRow(count);
       wXsum += rowforbias.getFloat("X")* angleConverter; // rad/s
       wYsum += rowforbias.getFloat("Y")* angleConverter; // rad/s
       wZsum += rowforbias.getFloat("Z")* angleConverter; // rad/s
         biasx = wXsum/count;
        biasy = wYsum/count;
        biasz = wZsum/count;
       //println(wXsum,wYsum,wZsum);
 }
 oneloop2 = false;
    }
  float wX = (row.getFloat("X") - biasx) * angleConverter; // rad/s
  float wY = (row.getFloat("Y") - biasy) * angleConverter; // rad/s
  float wZ = (row.getFloat("Z") - biasz)  * angleConverter;// rad/s
  float alti = row.getFloat("ALT"); // m
  float temp = row.getFloat("TEMP"); // c
  float press = row.getFloat("PRESS"); // hpa
  float curtime = row.getFloat("TIME"); // ms
  float aX = row.getFloat("AX"); // m/s
  float aY = row.getFloat("AY"); // m/s
  float aZ = row.getFloat("AZ");// m/s
  
  while(oneloop == true){ // this loop runs only once to get intial parameters for time and calculate biases
 //print("here" + file);

  
    prevtime = curtime; 
    

    oneloop = false;
  }
   
  
   // Read data for attitude calculations 

 
  
  dt = (curtime - prevtime)/timeConverter; // delta time in seconds
  prevtime = curtime;

  i++;
  if (i==RAW_DATA.getRowCount()){
    start = false;
    restart = true;
     i = 0;
     Xplot.setPoints(new GPointsArray());
     
Xplot.setPoints(new GPointsArray());
 Yplot.setPoints(new GPointsArray());
 Zplot.setPoints(new GPointsArray());
 Altplot.setPoints(new GPointsArray());
 axplot.setPoints(new GPointsArray());
 ayplot.setPoints(new GPointsArray());
 azplot.setPoints(new GPointsArray());
 PFont p = createFont("Times",10); 
ControlFont font = new ControlFont(p);
PFont Q = createFont("Times",20); 
ControlFont font2 = new ControlFont(Q);
    addbutton(font,font2);
    gui1.setColorBackground(color(0,0,139));
    gui2.setColorBackground(color(0,0,139));
    gui3.setColorBackground(color(0,0,139));
    gui4.setColorBackground(color(0,0,139));
    gui5.setColorBackground(color(0,0,139));
    gui6.setColorBackground(color(0,0,139));
    gui7.setColorBackground(color(0,0,139));
    gui8.setColorBackground(color(0,0,139));
    gui9.setColorBackground(color(0,0,139));
    gui10.setColorBackground(color(0,0,139));
    gui11.setColorBackground(color(0,0,139));
    gui12.setColorBackground(color(0,0,139));
    gui13.setColorBackground(color(0,0,139));
    gui14.setColorBackground(color(0,0,139));
    gui15.setColorBackground(color(0,0,139));
    gui16.setColorBackground(color(0,0,139));
    gui17.setColorBackground(color(0,0,139));
    gui18.setColorBackground(color(0,0,139));
  }
  // Convert rates to instantaneous rotation theta about axis norm (format {x,y,z})
  mag = sqrt(sq(wX)+sq(wY)+sq(wZ));
  norm[0] = wX/mag;
  norm[1] = wY/mag;
  norm[2] = wZ/mag;
  theta = (mag * dt);
  
  // Rotation quaternion, represents rotation of theta degrees around axis norm
  // See eq. 13 of https://stanford.edu/class/ee267/notes/ee267_notes_imu.pdf 
  // format is {w,x,y,z}
  float[] Q1 = {cos(theta/2.0f), (norm[0] * sin(theta/2.0f)), (norm[1] * sin(theta/2.0f)), (norm[2] * sin(theta/2.0f))};
  
  // rotation is current attitude, Q0 is previous attitude
  // rotate previous attitude by Q1 to obtain current attitude
  // rotation = Q1 * Q0 (hamilton product)  
  float a1 = Q1[0], b1 = Q1[1], c1 = Q1[2], d1 = Q1[3];
  float a2 = Q0[0], b2 = Q0[1], c2 = Q0[2], d2 = Q0[3];
  rotation[0] = a1*a2 - b1*b2 - c1*c2 - d1*d2;
  rotation[1] = a1*b2 + b1*a2 + c1*d2 - d1*c2;
  rotation[2] = a1*c2 - b1*d2 + c1*a2 + d1*b2;
  rotation[3] = a1*d2 + b1*c2 - c1*b2 + d1*a2;
  
  // Set previous attitude for next iteration
  Q0[0] = rotation[0];
  Q0[1] = rotation[1];
  Q0[2] = rotation[2];
  Q0[3] = rotation[3];
  
  // Convert to euler angles.
  // X axis pitch
  float sinr_cosp = 2.0f * (rotation[0] * rotation[1] + rotation[2] * rotation[3]);
  float cosr_cosp = 1.0f - 2.0f * (rotation[1] * rotation[1] + rotation[2] * rotation[2]);
  X = atan2(sinr_cosp,cosr_cosp);
   
  // Y axis yaw
  float sinp = 2.0f * (rotation[0] * rotation[2] - rotation[1] * rotation[3]);
  if(sinp >= 1){
      Y = 1.571f;
  } else if(sinp <= -1.0f){                                                                                 
      Y = -1.571f;
  } else {
      Y  = asin(sinp);
  }
   
  //Z axis roll
  float siny_cosp = 2.0f * (rotation[0] * rotation[3] + rotation[1] * rotation[2]);
  float cosy_cosp = 1.0f-2.0f * (rotation[2] * rotation[2] + rotation[3] * rotation[3]);
  Z = atan2(siny_cosp,cosy_cosp);
   
//println(X,Y,Z);
 
  // Draw background
  pushMatrix();
  translate(-150,-300,-500);
  texture(back);
 image(back,-100,-100);
  popMatrix();
  
  // make rocket and present telemetery 
  
  rawTelemetry(curtime/timeConverter,wX,wY,wZ);
  makeRocket();
  setPlots(curtime/timeConverter,alti,aX,aY,aZ);
  
  //keyPressed();
  delay(etaIncrement);
  }else if (start == true && restart == true){
    i = 0;
    restart = false;
  }

}

String pitchaxis,rollaxis,yawaxis;
boolean firstboot = false;

public void makeRocket(){
  println(pitchaxis,rollaxis,yawaxis);
      pushMatrix();  
    fill(110,106,0);
    translate( 800, 850, -100 );
    rotateX(PI/2);
    //rotateY(Z);
    //rotateX(X);
    //rotateZ(Y);
    
    
    
    
    if (pitchaxis == "X"){
    rotateX(X);
    }else if (pitchaxis == "Y"){
    rotateX(Y);
    }else if(pitchaxis == "Z"){
      rotateX(Z);
    }else{}if (rollaxis == "X"){
    rotateZ(X);
    }else if (rollaxis == "Y"){
    rotateZ(Y);
    }else if(rollaxis == "Z"){
      rotateZ(Z);
    }else{}if (yawaxis == "X"){
    rotateY(X);
    }else if (yawaxis == "Y"){
    rotateY(Y);
    }else if(yawaxis == "Z"){
      rotateY(Z);
    }else{}pushMatrix(); 
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
public void drawCylinder( int sides, float r1, float r2, float h)
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
public void addbutton(ControlFont font, ControlFont font2){
  
  gui1 = new ControlP5(this);
//Add a Button
gui1.addButton("SECONDS")
   //Set the position of the button : (X,Y)
   .setPosition(500,300)
   //Set the size of the button : (X,Y)
   .setSize(200,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(1)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui1.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui1.setColorBackground(color(0, 100, 0));
          gui2.setColorBackground(color(0,0,139));
          gui3.setColorBackground(color(0,0,139));
          timeConverter = 1;
          break;
        
      }
    }
  }
  );
  
    gui8 = new ControlP5(this);
//Add a Button
gui8.addButton("PITCH AXIS IS X")
   //Set the position of the button : (X,Y)
   .setPosition(50,300)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui8.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui8.setColorBackground(color(0, 100, 0));
          gui9.setColorBackground(color(0,0,139));
          gui10.setColorBackground(color(0,0,139));
          pitchaxis = "X";
          break;
        
      }
    }
  }
  );

      gui9 = new ControlP5(this);
//Add a Button
gui9.addButton("PITCH AXIS IS Y")
   //Set the position of the button : (X,Y)
   .setPosition(200,300)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui9.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui9.setColorBackground(color(0, 100, 0));
          gui8.setColorBackground(color(0,0,139));
          gui10.setColorBackground(color(0,0,139));
          pitchaxis = "Y";
          break;
        
      }
    }
  }
  );
      gui10 = new ControlP5(this);
//Add a Button
gui10.addButton("PITCH AXIS IS Z")
   //Set the position of the button : (X,Y)
   .setPosition(350,300)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui10.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui10.setColorBackground(color(0, 100, 0));
          gui8.setColorBackground(color(0,0,139));
          gui9.setColorBackground(color(0,0,139));
          pitchaxis = "Z";
          break;
        
      }
    }
  }
  );
      gui11 = new ControlP5(this);
//Add a Button
gui11.addButton("ROLL AXIS IS X")
   //Set the position of the button : (X,Y)
   .setPosition(50,400)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui11.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui11.setColorBackground(color(0, 100, 0));
          gui12.setColorBackground(color(0,0,139));
          gui13.setColorBackground(color(0,0,139));
          rollaxis = "X";
          break;
        
      }
    }
  }
  );
      gui12 = new ControlP5(this);
//Add a Button
gui12.addButton("ROLL AXIS IS Y")
   //Set the position of the button : (X,Y)
   .setPosition(200,400)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui12.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui12.setColorBackground(color(0, 100, 0));
          gui11.setColorBackground(color(0,0,139));
          gui13.setColorBackground(color(0,0,139));
          rollaxis = "Y";
          break;
        
      }
    }
  }
  );
      gui13 = new ControlP5(this);
//Add a Button
gui13.addButton("ROLL AXIS IS Z")
   //Set the position of the button : (X,Y)
   .setPosition(350,400)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui13.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui13.setColorBackground(color(0, 100, 0));
          gui11.setColorBackground(color(0,0,139));
          gui12.setColorBackground(color(0,0,139));
          rollaxis = "Z";
          break;
        
      }
    }
  }
  );
      gui14 = new ControlP5(this);
//Add a Button
gui14.addButton("YAW AXIS IS X")
   //Set the position of the button : (X,Y)
   .setPosition(50,500)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui14.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui14.setColorBackground(color(0, 100, 0));
          gui15.setColorBackground(color(0,0,139));
          gui16.setColorBackground(color(0,0,139));
          yawaxis = "X";
          break;
        
      }
    }
  }
  );
      gui15 = new ControlP5(this);
//Add a Button
gui15.addButton("YAW AXIS IS Y")
   //Set the position of the button : (X,Y)
   .setPosition(200,500)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui15.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui15.setColorBackground(color(0, 100, 0));
          gui14.setColorBackground(color(0,0,139));
          gui16.setColorBackground(color(0,0,139));
          yawaxis = "Y";
          break;
        
      }
    }
  }
  );
      gui16 = new ControlP5(this);
//Add a Button
gui16.addButton("YAW AXIS IS Z")
   //Set the position of the button : (X,Y)
   .setPosition(350,500)
   //Set the size of the button : (X,Y)
   .setSize(100,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(8)
   .setFont(font)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui16.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui16.setColorBackground(color(0, 100, 0));
          gui15.setColorBackground(color(0,0,139));
          gui14.setColorBackground(color(0,0,139));
          yawaxis = "Z";
          break;
        
      }
    }
  }
  );
    gui2 = new ControlP5(this);
//Add a Button
gui2.addButton("MILISECONDS")
   //Set the position of the button : (X,Y)
   .setPosition(800,300)
   //Set the size of the button : (X,Y)
   .setSize(200,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(2)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui2.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui2.setColorBackground(color(0, 100, 0));
          gui1.setColorBackground(color(0,0,139));
          gui3.setColorBackground(color(0,0,139));
          timeConverter = 1000;
          break;
        
      }
    }
  }
  );
   gui3 = new ControlP5(this);
//Add a Button
gui3.addButton("MICROSECONDS")
   //Set the position of the button : (X,Y)
   .setPosition(1100,300)
   //Set the size of the button : (X,Y)
   .setSize(200,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(3)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
     gui3.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui3.setColorBackground(color(0, 100, 0));
          gui2.setColorBackground(color(0,0,139));
          gui1.setColorBackground(color(0,0,139));
          timeConverter = 1000000;
          break;
        
      }
    }
  }
  );
   
      gui4 = new ControlP5(this);
//Add a Button
gui4.addButton("RADIANS")
   //Set the position of the button : (X,Y)
   .setPosition(500,500)
   //Set the size of the button : (X,Y)
   .setSize(200,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(4)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
    gui4.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui4.setColorBackground(color(0, 100, 0));
          gui5.setColorBackground(color(0,0,139));
          angleConverter = 1;
          break;
        
      }
    }
  }
  );
      gui5 = new ControlP5(this);
//Add a Button
gui5.addButton("DEGREES")
   //Set the position of the button : (X,Y)
   .setPosition(800,500)
   //Set the size of the button : (X,Y)
   .setSize(200,100)
   //Set the pre-defined Value of the button : (int)
   .setValue(5)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
    gui5.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui5.setColorBackground(color(0, 100, 0));
          gui4.setColorBackground(color(0,0,139));
          angleConverter = PI/180;
          break;
        
      }
    }
  }
  );
   
         gui6 = new ControlP5(this);
//Add a Button
gui6.addButton("START/RESTART")
   //Set the position of the button : (X,Y)
   .setPosition(1100,500)
   //Set the size of the button : (X,Y)
   .setSize(200,300)
   //Set the pre-defined Value of the button : (int)
   .setValue(6)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
      gui6.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui6.setColorBackground(color(0, 100, 0));
          gui7.hide();
          gui1.hide();
          gui2.hide();
          gui3.hide();
          gui4.hide();
          gui5.hide();
          gui6.hide();
          gui8.hide();
          gui9.hide();
          gui10.hide();
          gui11.hide();
          gui12.hide();
          gui13.hide();
          gui14.hide();
          gui15.hide();
          gui16.hide();
          gui17.show();
          
          
          start = true;
          
          restart = false;
          
          
          
         
          break;
        
      }
    }
  }
  );
         gui7 = new ControlP5(this);
//Add a Button
gui7.addButton("FILE UPLOAD")
   //Set the position of the button : (X,Y)
   .setPosition(500,650)
   //Set the size of the button : (X,Y)
   .setSize(500,150)
   //Set the pre-defined Value of the button : (int)
   .setValue(7)
   .setFont(font2)
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
    gui7.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          gui7.setColorBackground(color(0, 100, 0));
        
           selectInput("Select a file to process:", "fileSelected");
          
           
          
          break;
        
      }
    }
  }
  );
          gui17 = new ControlP5(this);
//Add a Button
gui17.addButton("ETA +1ms")
   // .hide()
   //Set the position of the button : (X,Y)
   .setPosition(1550,600)
   //Set the size of the button : (X,Y)
   .setSize(50,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(7)
   
   
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
    gui17.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          
          etaIncrement += 1;
          
          break;
        
      }
    }
  }
  );
            gui18 = new ControlP5(this);
//Add a Button
gui18.addButton("ETA -1ms")
   // .hide()
   //Set the position of the button : (X,Y)
   .setPosition(1550,650)
   //Set the size of the button : (X,Y)
   .setSize(50,50)
   //Set the pre-defined Value of the button : (int)
   .setValue(7)
   
   
   //set the way it is activated : RELEASE the mouseboutton or PRESS it
   .activateBy(ControlP5.PRESS);
    gui18.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      switch(theEvent.getAction()) {
        case(ControlP5.PRESSED): 
          
        
           etaIncrement -= 1;
          
           
          
          break;
        
      }
    }
  }
  );
}
public void rawTelemetry(Float eta, Float wX, Float wY, Float wZ){

    pushMatrix();
  translate(900,100,-100);
  fill(255);
  textSize(20);
  text("RAW TELEMETRY",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,150,0);
  fill(255);
  textSize(15);
  text("PITCH:   " + angleConverter * X+"\u00b0",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,170,0);
  fill(255);
  textSize(15);
  text("YAW:    " + angleConverter *Z+"\u00b0",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,190,0);
  fill(255);
  textSize(15);
  text("ROLL:    " + angleConverter *  Y+"\u00b0",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,210,0);
  fill(255);
  textSize(15);
  text("ETA:    " + eta+"s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,230,0);
  fill(255);
  textSize(15);
  text("ALT:    " + "m",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,250,0);
  fill(255);
  textSize(15);
  text("TEMP:    " + "\u00b0C",500,500);
  popMatrix();
  
    pushMatrix();
  translate(650,270,0);
  fill(255);
  textSize(15);
  text("PRESSURE:    " +"hPA",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,290,0);
  fill(255);
  textSize(15);
  text("TEMPRATURE:    " +"C",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,310,0);
  fill(255);
  textSize(15);
  text("ACCEL X:    " +"m/s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,330,0);
  fill(255);
  textSize(15);
  text("ACCEL Y:    " +"m/s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,350,0);
  fill(255);
  textSize(15);
  text("ACCEL Z:    " +"m/s",500,500);
  popMatrix();
  
     pushMatrix();
  translate(650,370,0);
  fill(255);
  textSize(15);
  text("GYRO X:    " + degrees(wX) +"m/s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,390,0);
  fill(255);
  textSize(15);
  text("GYRO Y:    "+ degrees(wY) +"m/s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,410,0);
  fill(255);
  textSize(15);
  text("GYRO Z:    "+ degrees(wZ) +"m/s",500,500);
  popMatrix();

}

public void setPlots(Float curtime,Float alt,Float ax,Float ay,Float az){
 Xplot.addPoint(curtime/1000,degrees(X));
Xplot.beginDraw();
Xplot.drawBackground();
Xplot.drawBox();
Xplot.drawXAxis();
Xplot.drawYAxis();
Xplot.drawTitle();
Xplot.drawGridLines(GPlot.BOTH);
Xplot.drawPoints();
Xplot.endDraw();
   Yplot.addPoint(curtime/1000,degrees(Y));
Yplot.beginDraw();
Yplot.drawBackground();
Yplot.drawBox();
Yplot.drawXAxis();
Yplot.drawYAxis();
Yplot.drawTitle();
Yplot.drawGridLines(GPlot.BOTH);
Yplot.drawPoints();
Yplot.endDraw();
   Zplot.addPoint(curtime/1000,degrees(Z));
Zplot.beginDraw();
Zplot.drawBackground();
Zplot.drawBox();
Zplot.drawXAxis();
Zplot.drawYAxis();
Zplot.drawTitle();
Zplot.drawGridLines(GPlot.BOTH);
Zplot.drawPoints();
Zplot.endDraw();
  Altplot.addPoint(curtime/1000,alt);
Altplot.beginDraw();
Altplot.drawBackground();
Altplot.drawBox();
Altplot.drawXAxis();
Altplot.drawYAxis();
Altplot.drawTitle();
Altplot.drawGridLines(GPlot.BOTH);
Altplot.drawPoints();
Altplot.endDraw();
axplot.addPoint(curtime/1000,ax);
axplot.beginDraw();
axplot.drawBackground();
axplot.drawBox();
axplot.drawXAxis();
axplot.drawYAxis();
axplot.drawTitle();
axplot.drawGridLines(GPlot.BOTH);
axplot.drawPoints();
axplot.endDraw();
 ayplot.addPoint(curtime/1000,ay);
ayplot.beginDraw();
ayplot.drawBackground();
ayplot.drawBox();
ayplot.drawXAxis();
ayplot.drawYAxis();
ayplot.drawTitle();
ayplot.drawGridLines(GPlot.BOTH);
ayplot.drawPoints();
ayplot.endDraw();
   azplot.addPoint(curtime/1000,az);
azplot.beginDraw();
azplot.drawBackground();
azplot.drawBox();
azplot.drawXAxis();
azplot.drawYAxis();
azplot.drawTitle();
azplot.drawGridLines(GPlot.BOTH);
azplot.drawPoints();
azplot.endDraw();

}
public void setPointsForPlots(){

Xplot.setPos(-45,600);
Xplot.setDim(300,200);
Xplot.setPointColor(color(0,0,0,255));
Xplot.setPointSize(2);
Xplot.getTitle().setText("Pitch");
Yplot.setPos(-45,300);
Yplot.setDim(300,200);
Yplot.setPointColor(color(0,0,0,255));
Yplot.setPointSize(2);
Yplot.getTitle().setText("Roll");
Zplot.setPos(-45,0);
Zplot.getTitle().setText("Yaw");
Zplot.setDim(300,200);
Zplot.setPointColor(color(0,0,0,255));
Zplot.setPointSize(2);
Altplot.setPos(330,0);
Altplot.getTitle().setText("Altitude");
Altplot.setDim(300,200);
Altplot.setPointColor(color(0,0,0,255));
Altplot.setPointSize(2);
axplot.setPos(330,300);
axplot.getTitle().setText("Acceleration X");
axplot.setDim(300,200);
axplot.setPointColor(color(0,0,0,255));
axplot.setPointSize(2);
ayplot.setPos(705,0);
ayplot.getTitle().setText("Acceleration Y");
ayplot.setDim(300,200);
ayplot.setPointColor(color(0,0,0,255));
ayplot.setPointSize(2);
azplot.setPos(705,300);
azplot.getTitle().setText("Acceleration Z");
azplot.setDim(300,200);
azplot.setPointColor(color(0,0,0,255));
azplot.setPointSize(2);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "file" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
