void rawTelemetry(Float eta){

    pushMatrix();
  translate(900,-200,-100);
  fill(255);
  textSize(20);
  text("RAW TELEMETRY",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-140,-100);
  fill(255);
  textSize(15);
  text("PITCH:   " + degrees(X)+"°",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-120,-100);
  fill(255);
  textSize(15);
  text("YAW:    " + degrees(Z)+"°",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-100,-100);
  fill(255);
  textSize(15);
  text("ROLL:    " + degrees(Y)+"°",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-80,-100);
  fill(255);
  textSize(15);
  text("ETA:    " + eta+"s",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-60,-100);
  fill(255);
  textSize(15);
  text("ALT:    " + "m",500,500);
  popMatrix();
  
   pushMatrix();
  translate(650,-40,-100);
  fill(255);
  textSize(15);
  text("TEMP:    " + "°C",500,500);
  popMatrix();
  
    pushMatrix();
  translate(650,-20,-100);
  fill(255);
  textSize(15);
  text("PRESSURE:    " +"hPA",500,500);
  popMatrix();
  
  

}

void setPlots(Float curtime){
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
 // Altplot.addPoint(curtime/1000,degrees(X));
Altplot.beginDraw();
Altplot.drawBackground();
Altplot.drawBox();
Altplot.drawXAxis();
Altplot.drawYAxis();
Altplot.drawTitle();
Altplot.drawGridLines(GPlot.BOTH);
Altplot.drawPoints();
Altplot.endDraw();
//axplot.addPoint(curtime/1000,degrees(X));
axplot.beginDraw();
axplot.drawBackground();
axplot.drawBox();
axplot.drawXAxis();
axplot.drawYAxis();
axplot.drawTitle();
axplot.drawGridLines(GPlot.BOTH);
axplot.drawPoints();
axplot.endDraw();
 //ayplot.addPoint(curtime/1000,degrees(X));
ayplot.beginDraw();
ayplot.drawBackground();
ayplot.drawBox();
ayplot.drawXAxis();
ayplot.drawYAxis();
ayplot.drawTitle();
ayplot.drawGridLines(GPlot.BOTH);
ayplot.drawPoints();
ayplot.endDraw();
   //azplot.addPoint(curtime/1000,degrees(X));
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
void setPointsForPlots(){

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
