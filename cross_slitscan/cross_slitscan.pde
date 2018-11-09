import processing.video.*;
Capture video;

int y = 0;
int x = 0;                                    

void setup() {
    size(800,540);
    video = new Capture(this, 800, 540);
    video.start();
    pixelDensity(1);
}

void captureEvent(Capture video){
  video.read();
}


void draw() {
   video.loadPixels();
   loadPixels(); 
   
   int w = video.width;
   int h = video.height;
   
   copy(video, 0, h/2, w, 2, 0, y, w, 2);
   copy(video, w/2, 0, 2, h, x, 0, 2, h);

   y = y + 1;
   x = x + 1;
  
   if (y > height) { //start from the top
     y = 0;
   }
    
   if (x > width) { //start from the left
    x = 0;
   }
  }
