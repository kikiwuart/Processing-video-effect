import processing.video.*;
color[] randomColor = {#4deeea, #74ee15, #ffe700, #f000ff, #001eff};
int picker = 0;
int videoScale = 10;
int cols, rows;
Capture video;

void setup() { 
  size(800,540); 
  // Initialize columns and rows  
  cols = width / videoScale;  
  rows = height / videoScale;  
  // Construct the Capture object  
  video = new Capture(this, cols, rows);  
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
}

void draw() {  
  video.loadPixels();   
  for (int i = 0; i < cols; i++) {    
  // Begin loop for rows    
    for (int j = 0; j < rows; j++) {      
    // Where are you, pixel-wise?      
    int x = i*videoScale;      
    int y = j*videoScale;    
        
     // Reverse the column to mirro the image.
    int loc = (video.width - i - 1) + j * video.width;       
    color c = video.pixels[loc];
    float sz = (brightness(c)/255) * videoScale;       
    rectMode(CENTER);       
    rect(x + videoScale/2, y + videoScale/2, sz, sz); 
    
    // fill the columns with color array
    fill(randomColor[picker]);
    noStroke();
    if (mousePressed){
      picker = round(random (0,4));
    }
    }
  }
}
