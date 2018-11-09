import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;

//gif frames
int numFrames = 4;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];



void setup() {
  size(800,540);
  
  video = new Capture(this, 800/2, 540/2);
  opencv = new OpenCV(this, 800/2, 540/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  //load gif frames
  frameRate(8);
  images[0]  = loadImage("party.png");
  images[1]  = loadImage("error.png"); 
  images[2]  = loadImage("neon.png"); 
  images[3]  = loadImage("giphy.gif"); 
  video.start();

}

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  noFill();
  Rectangle[] faces = opencv.detect();
  println(faces.length, images[frame]);
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(images[frame],faces[i].x, faces[i].y, faces[i].width, faces[i].height );
  }
  
  //gif animated
  frame = frame + 1;
    if (frame>=numFrames){
     frame=0; 
    }
}

void captureEvent(Capture c) {
  c.read();

}
