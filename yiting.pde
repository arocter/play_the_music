 int R,G,B,A;
PImage ourImage;
PImage ourImage1,ourImage2,ourImage3,ourImage4,ourImage5,ourImage6,ourImage7,ourImage8,ourImage9,ourImage10,ourImage11,ourImage12,ourImage13,ourImage14,ourImage15,ourImage16;
float grey;
int set=1;
int dia=20;
int change =1;
Tline[][] lines = new Tline[width*10][height*10];
float add;
void setup(){
  size(800,800);
  ourImage = loadImage("album/10.jpg");
  ourImage1 = loadImage("album/1.jpg");
  ourImage2 = loadImage("album/13.jpg");
  ourImage3 = loadImage("album/3.jpg");
  ourImage4 = loadImage("album/4.jpg");
  ourImage5 = loadImage("album/5.jpg");
  ourImage6 = loadImage("album/14.jpg");
  ourImage7 = loadImage("album/7.jpg");
  ourImage8 = loadImage("album/16.jpg");
  ourImage9 = loadImage("album/9.jpg");
  ourImage10 = loadImage("album/0.jpg");
  ourImage11 = loadImage("album/11.jpg");
  ourImage12 = loadImage("album/12.jpg");
  ourImage13 = loadImage("album/2.jpg");
  ourImage14 = loadImage("album/6.jpg");
  ourImage15 = loadImage("album/15.jpg");
  ourImage16 = loadImage("album/8.jpg");
  frameRate(120);
  //ourImage= loadImage("http://dreamatico.com/data_images/flowers/flowers-4.jpg");
  ourImage.resize (width, height);
  ourImage8.resize(width,height);
  ourImage.loadPixels();
}


void draw(){
  noCursor();
  if(frameCount==2000){
    saveFrame("line-######.png");
  }
  //image(ourImage, 0, 0);
  //background(255);
  //loadPixels();
    //x1 = floor(random(1,500));
    //x2 = floor(random(1,500));
    //x3 = floor(random(1,500));
    //y1 = floor(random(1,500));
    //y2 = floor(random(1,500));
    //y3 = floor(random(1,500));
  //println(frameRate);
  if(set==1){
    for(int x=0+dia/2; x<width+dia/2;x+=dia){
       for(int y=0+dia/2; y<height+dia/2;y+=dia){
         lines[x][y] = new Tline(0,0,dia/2,dia/2);
         //lines[x][y] = new Tline(0,0,grey+2,2);
       }
    }
    set=0;
  }
  for(int x=0+dia/2; x<width+dia/2;x+=dia){
     for(int y=0+dia/2; y<height+dia/2;y+=dia){
       switch(change){
         case 0:
         PxPGetPixel(x, y, ourImage.pixels, width);
         break;
         case 1:
         PxPGetPixel(x, y, ourImage1.pixels, width);
         break;
         case 2:
         PxPGetPixel(x, y, ourImage2.pixels, width);
         break;
         case 3:
         PxPGetPixel(x, y, ourImage3.pixels, width);
         break;
         case 4:
         PxPGetPixel(x, y, ourImage4.pixels, width);
         break;
         case 5:
         PxPGetPixel(x, y, ourImage5.pixels, width);
         break;
         case 6:
         PxPGetPixel(x, y, ourImage6.pixels, width);
         break;
         case 7:
         PxPGetPixel(x, y, ourImage7.pixels, width);
         break;
         case 8:
         PxPGetPixel(x, y, ourImage8.pixels, width);
         break;
         case 9:
         PxPGetPixel(x, y, ourImage9.pixels, width);
         break;
         case 10:
         PxPGetPixel(x, y, ourImage10.pixels, width);
         break;
         case 11:
         PxPGetPixel(x, y, ourImage11.pixels, width);
         break;
         case 12:
         PxPGetPixel(x, y, ourImage12.pixels, width);
         break;
         case 13:
         PxPGetPixel(x, y, ourImage13.pixels, width);
         break;
         case 14:
         PxPGetPixel(x, y, ourImage14.pixels, width);
         break;
         case 15:
         PxPGetPixel(x, y, ourImage15.pixels, width);
         break;
         case 16:
         PxPGetPixel(x, y, ourImage16.pixels, width);
         break;
         
       }

       //fill(R,G,B);
       //noStroke();
       grey = (R+G+B)/3;
       //grey = map(grey,0,255,0,10);
       //beginShape(LINES);
       stroke(R,G,B,lines[x][y].alpha);
       fill(R,G,B);
       //stroke(grey,grey,grey);
       pushMatrix();
       translate(x,y);
       lines[x][y].update();
       lines[x][y].move();
       //lines[x][y].angle +=1;
       //line(0,0,grey+10,10);
       popMatrix();
       //vertex(x,y);
       //vertex(x+grey-add,y+add);
       //endShape();
       //PxPSetPixel(x, y, R, G, B, 255, pixels, width);
    }
  }

  
  
  //updatePixels();  
  //println(angle);
}

void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a =(a << 24);                       
  r = r << 16;                       // We are packing all 4 composents into one int
  g = g << 8;                        // so we need to shift them to their places
  color argb = a | r | g | b;        // binary "or" operation adds them all into one int
  pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
}

class Tline{
  float xpos, ypos, xpos2, ypos2;
  float angle = 1;
  float alpha=20;
  float step=random(0.08,0.12);
  Tline (float tempx, float tempy,float tempx2, float tempy2){
    xpos = tempx;
    ypos = tempy;
    xpos2 = tempx2;
    ypos2 = tempy2;
  }
  void update(){
    pushMatrix();
    strokeWeight(2);
    rotate(angle);
    rectMode(CENTER);
    //rect(xpos,ypos,xpos2,ypos2);
    line(xpos,ypos,xpos2,ypos2);
    popMatrix();
    stroke(100);
    //ellipse(xpos,ypos,xpos2/7,ypos2/7);
  }
  void move(){
    angle += step;
    //alpha-=0.1;
  }
}

void mousePressed(){
  //saveFrame("line-######.png");
  change=floor(random(0,17));
}

void keyPressed() {
  saveFrame("line-######.png");
}