PImage bg;  
float x = 0;  // Start at frame 0

void setup() {
  size(1200, 800);  // Canvas size
  bg = loadImage("gespa.jpg");  // Load background image
  bg.resize(width, height);  // Resize to fit the canvas
  background(bg);  // Set the image as the background
  colorMode(HSB);
  randomSeed(millis()); // Ensure different results each time
}
void draw(){
  float x = frameCount;
  float r = map(x, 0, width, 2, 4.2);
  float y= 0.01;
  for(int i=0;i<300;i++){
    stroke(5, random(250),255);
    y= r*y*(1-y);
    point(x, 500*y);
  }
}
