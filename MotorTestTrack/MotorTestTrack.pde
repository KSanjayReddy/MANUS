// import packages


// list of global variables

void setup(){
  size(1200,600);     // size of screen
  background(0,0,120);  // bgcolor rgb
  stroke(0,0,0);        // line specs
  line(0,30,1200,30);
  textSize(20);
  fill(250,250,250);
  text("MANUS TESTING TRACK",450,23);
  drawScale(50,1200,1,40,50,10);
  drawScale(0,600,2,0,50,10);
}

void draw(){
  
}



void drawScale(int x,int y,int z,int f,int k,int s){  //  x,y are start and end, z=1 x axis z=2 y axis , f is the fixed point, k is the gaps, s = text size
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
     fill(255,140,0);
     text(i,f,i);
   }
}
}