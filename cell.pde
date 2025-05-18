int w = 360; 
int h = 360;
int[][] d = new int[h][w];

void setup() {
  size(2*360, 2*360);
  int a = 0; 
  for (int i = a; i < h - a; i++) 
    for (int j = a; j < w - a; j++) 
      d[i][j] = 1;  // All neurons start firing at the beginning (active)
}

void draw() {
  background(10, 20, 210);  // Brain-like background color
  
  noStroke();
  fill(0, 200);
  int[][] c = new int[h][w];
  
  for (int i = 1; i < h - 1; i++) {
    for (int j = 1; j < w - 1; j++) {
      int count = d[i-1][j-1] + d[i-1][j] + d[i-1][j+1] + d[i][j-1] 
                + d[i][j+1] + d[i+1][j-1] + d[i+1][j] + d[i+1][j+1];
      c[i][j] = d[i][j];  // Evolution rule:
      

      // If the cell is dead (inhibited):
      if (0 == d[i][j]) { 
        // Revive if there are 3, 6, or 7 active neighbors (enough input from synapses)
        if (3 == count || 6 == count || 7 == count) 
          c[i][j] = 1;
      } 
      else {  // Neuron is active
        // Neuron dies if there are too few or too many active neighbors
        if (3 > count || 5 == count)   
          c[i][j] = 0;  // Death due to underactivation or overactivation
        fill(255, 0, 0); // Red color for firing neurons (action potential)
        rect(2*j, 2*i, 2, 2); // Representing a neuron firing
      }
      if (d[i][j] == 0) {
        if (random(1) < 0.1) {  // Random decay probability (you can adjust this)
          d[i][j] = 0;  // Keep it inactive
        }
    }
  }
}
  
  d = c;  // Update the state of the neurons (cells)
}
