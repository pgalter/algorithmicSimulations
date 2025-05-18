int n = 800;
PVector[] ps = new PVector[n];
PVector[] ds = new PVector[n];
PVector[] cs = new PVector[3]; // Points of attraction

void setup() {
  size(1000, 800);
  for (int i = 0; i < n; i++) {
    ds[i] = new PVector();
    PVector v = PVector.random2D();
    v.mult(700);
    ps[i] = v;
  }
  background(200);  // Light blue background
  // Generate random attraction points for each run
  for (int i = 0; i < cs.length; i++) {
    cs[i] = new PVector(random(-300, 300), random(-300, 300)); // Random attraction points
  }
}

void draw() {
  fill(50, 50, 100, 1);
  noStroke();
  rect(0, 0, 1000, 800);
  translate(500, 400);
  stroke(255, 0, 0);  // Red stroke
  strokeWeight(1);
  
  beginShape();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < cs.length; j++) {
      PVector accel = PVector.sub(cs[j], ps[i]);
      float distance = accel.mag();
      float attractionStrength = 4.0 / (distance + 0.05); // Inverse distance law
      
      // Calculate interaction count based on proximity
      float interactionCount = map(distance, 0, 700, 100, 1); // Closer particles = higher interaction count
      
      // Modify attraction based on interaction count
      if (interactionCount > 50) {  // High interaction
          accel.setMag(attractionStrength * 2); // Stronger attraction (LTP)
      } else {  // Low interaction
          accel.setMag(attractionStrength * 0.2); // Weaker attraction (LTD)
      }

      ds[i].add(accel);
    }
    ps[i].add(ds[i]);
    point(ps[i].x, ps[i].y);
  }
  endShape();
}
