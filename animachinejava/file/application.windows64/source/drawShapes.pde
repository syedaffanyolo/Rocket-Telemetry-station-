
String pitchaxis,rollaxis,yawaxis;
boolean firstboot = false;

void makeRocket(){
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
    }else{}
    
    if (rollaxis == "X"){
    rotateZ(X);
    }else if (rollaxis == "Y"){
    rotateZ(Y);
    }else if(rollaxis == "Z"){
      rotateZ(Z);
    }else{}
    
     if (yawaxis == "X"){
    rotateY(X);
    }else if (yawaxis == "Y"){
    rotateY(Y);
    }else if(yawaxis == "Z"){
      rotateY(Z);
    }else{}

    
    
    
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
void addbutton(ControlFont font, ControlFont font2){
  
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
