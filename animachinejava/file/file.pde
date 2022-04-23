import grafica.*;
import processing.opengl.*;
PImage back;
Table RAW_DATA;
float X,Y,Z;
float dt, prevtime, curtime;
int i = 0;
float mag = 0;
float theta;
float[] norm = {0,0,0};
float[] Q0 = {1,0,0,0};
float[] rotation = {0,0,0,0};
float biasz = 0.0015; // gyro drift value biased to z axis
boolean oneloop = true;
GPlot Xplot;
GPlot Yplot;
GPlot Zplot;
GPlot Altplot;  //setting plots
GPlot axplot;
GPlot ayplot;
GPlot azplot;

void setup() {

size(1800, 1000, OPENGL);
surface.setResizable(true);
prevtime = 0;
RAW_DATA = loadTable("GYRO_DATA_RAW.csv", "header"); // raw data from csv
back = loadImage("back.jpg"); // background image
Xplot = new GPlot(this);
Yplot = new GPlot(this);
Zplot = new GPlot(this);
Altplot = new GPlot(this);     // init plots
axplot = new GPlot(this);
ayplot = new GPlot(this);
azplot = new GPlot(this);

setPointsForPlots();

}
void draw(){

  background(0);
  lights();
  fill(255, 128, 0);

  // Read data
  TableRow row = RAW_DATA.getRow(i);
  float wX = row.getFloat("X"); // rad/s
  float wY = row.getFloat("Y"); // rad/s
  float wZ = row.getFloat("Z") + biasz; // rad/s
  float curtime = row.getFloat("TIME"); // ms
  while(oneloop == true){
    prevtime = curtime;     // this loop runs only once to get the initial time at startup
    oneloop = false;
  }
  dt = (curtime - prevtime)/1000.0; // delta time in seconds
  prevtime = curtime;

  i++;
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
  // X axis
  float sinr_cosp = 2.0 * (rotation[0] * rotation[1] + rotation[2] * rotation[3]);
  float cosr_cosp = 1.0 - 2.0 * (rotation[1] * rotation[1] + rotation[2] * rotation[2]);
  X = atan2(sinr_cosp,cosr_cosp);
   
  // Y axis 
  float sinp = 2.0 * (rotation[0] * rotation[2] - rotation[1] * rotation[3]);
  if(sinp >= 1){
      Y = 1.571;
  } else if(sinp <= -1.0){                                                                                 
      Y = -1.571;
  } else {
      Y  = asin(sinp);
  }
   
  //Z axis 
  float siny_cosp = 2.0 * (rotation[0] * rotation[3] + rotation[1] * rotation[2]);
  float cosy_cosp = 1.0-2.0 * (rotation[2] * rotation[2] + rotation[3] * rotation[3]);
  Z = atan2(siny_cosp,cosy_cosp);
   
 setPlots(curtime);
 
  // Draw background
  pushMatrix();
  translate(-150,-200,-500);
  texture(back);
  image(back,150,800);
  back.resize(1800,800);
  popMatrix();
  
  // make rocket and present telemetery 
  rawTelemetry(curtime/1000);
  makeRocket();
  delay(5);
}
