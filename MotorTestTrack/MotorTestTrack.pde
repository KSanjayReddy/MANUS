// import packages


// list of global variables
VScrollbar vs1, vs2,vs3,vs4,vs5;


void setup(){
  size(1200,600);     // size of screen
  rectMode(CORNER);
  background();
  drawBars();
  displayText(150);
  displayValueBoxes(145);
  
  vs1 = new VScrollbar(120, 150, 50, 360, 5);
  vs2 = new VScrollbar(350, 150, 50, 360, 5);
  vs3 = new VScrollbar(580, 150, 50, 360, 5);
  vs4 = new VScrollbar(810, 150, 50, 360, 5);
  vs5 = new VScrollbar(1040, 150, 50, 360, 5);
  
  
 
}

void draw(){
  vs1.update();
  vs1.display();
  vs2.update();
  vs2.display();
  vs3.update();
  vs3.display();
  vs4.update();
  vs4.display();
  vs5.update();
  vs5.display();
}



void drawScale(int x,int y,int z,int f,int k,int s){  //  x,y are start and end, z=1 x axis z=2 y axis , f is the fixed point, k is the gaps, s = text size, c=color
 if(z==1){
   for(int i=x;i<=y;i+=k){
     textSize(s);
     fill(255,140,0);
     text(i,i,f);
   }
}
else if(z==2){
   for(int i=x;i<=y;i+=k){
     textSize(s);
     fill(255,140,0); // orange 
     text(i,f,i);
   }
}
}

void background(){                          // plain background with x and y axis
  background(0,0,120);  // bgcolor rgb
  stroke(0,0,0);        // line specs
  line(0,30,1200,30);
  textSize(20);
  fill(250,250,250);
  text("MANUS TESTING TRACK",450,23);
  drawScale(50,1200,1,40,50,10);
  drawScale(0,600,2,0,50,10);
}

void angleRange(int x,int y){
  textSize(8);
  fill(255);
  int angle=180;
  for(int i=1;i<20;i++){
    text(angle+"-",x-20,y);
    angle-=10;
    y+=20;
  }
}


void drawBars(){
  int x=120;           // starting x position
 for(int i=0;i<5;i++){
   angleRange(x,150);
   x+=230;
 }
}

void displayText(int x){
  for(int i=0;i<5;i++){
    fill(0,255,255);
  textAlign(CENTER);
  textSize(15);
    switch(i){
      case 0:
      text("Base Rotor",x,100);
      break;
      case 1:
      text("L Arm Angle",x,100);
      break;
      case 2:
      text("U Arm Angle",x,100);
      break;
      case 3:
      text("U Arm Rotor",x,100);
      break;
      case 4:
      text("Gripper",x,100);
      break;
    }
    x+=230;
  }
}

//********************** Vertical ScrollBar Class *************************************

class VScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  VScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int heighttowidth = sh - sw;
    ratio = (float)sh / (float)heighttowidth;
    xpos = xp;   // 
    ypos = yp;
    spos = ypos + sheight/2 - swidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + sheight-20;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseY-swidth/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255,165,00);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(20,255,20);
    } else {
      fill(0);
    }
    //rect(xpos, spos, swidth, swidth);
    rect(xpos, spos, swidth, 20);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

//*******************************************************************************

void displayValueBoxes(int x){
   rectMode(CENTER);
  for(int i=0;i<5;i++){
  fill(255);
  rect(x-50,528,50,32);
  fill(150);
  rect(x,528,50,32);
  fill(50);
  rect(x+50,528,50,32);
  x+=230;
  }
   rectMode(CORNER);
}