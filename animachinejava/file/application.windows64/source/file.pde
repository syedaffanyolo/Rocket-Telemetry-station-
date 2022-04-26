import controlP5.*;
import grafica.*;
import processing.opengl.*;
import java.io.File;
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

void setup() {
  
  
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

void fileSelected(File selection) {
 
  if (selection == null) {
    //println("Window was closed or the user hit cancel.");
  } else {
   // println("User selected " + selection.getAbsolutePath());
    file = selection.getAbsolutePath();
    fileSelected = true;
     
  }
  }


void draw(){
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
  float[] Q1 = {cos(theta/2.0), (norm[0] * sin(theta/2.0)), (norm[1] * sin(theta/2.0)), (norm[2] * sin(theta/2.0))};
  
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
  float sinr_cosp = 2.0 * (rotation[0] * rotation[1] + rotation[2] * rotation[3]);
  float cosr_cosp = 1.0 - 2.0 * (rotation[1] * rotation[1] + rotation[2] * rotation[2]);
  X = atan2(sinr_cosp,cosr_cosp);
   
  // Y axis yaw
  float sinp = 2.0 * (rotation[0] * rotation[2] - rotation[1] * rotation[3]);
  if(sinp >= 1){
      Y = 1.571;
  } else if(sinp <= -1.0){                                                                                 
      Y = -1.571;
  } else {
      Y  = asin(sinp);
  }
   
  //Z axis roll
  float siny_cosp = 2.0 * (rotation[0] * rotation[3] + rotation[1] * rotation[2]);
  float cosy_cosp = 1.0-2.0 * (rotation[2] * rotation[2] + rotation[3] * rotation[3]);
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
