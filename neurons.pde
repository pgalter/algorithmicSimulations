int n = 500;
PVector[] neurons = new PVector[n];  // Neuron positions in 3D
float[][] synapseStrength = new float[n][n];  // Connection strengths
float[] firingActivity = new float[n];  // Activity level (0 to 1)
float learningRate = 0.06;  // More gradual strengthening
float decayRate = 0.02;  // Increased decay to balance learning
float minStrength = 0.02;  // Minimum synapse strength before deletion
float maxDistance = 150;  // Slightly reduced for structured connections
float angle = 107;  // Camera rotation

void setup() {
  size(1000, 800, P3D);  // Enable 3D rendering
  for (int i = 0; i < n; i++) {
    float maxRadius = 500;  // Smaller sphere radius
    float theta = random(0, TWO_PI);  // Random angle in horizontal plane
    float phi = random(0, PI);  // Random angle in vertical plane
    float r = random(0, maxRadius);  // Distance from center (ensuring a filled sphere)
    
    // Convert spherical coordinates to Cartesian (x, y, z)
    float x = r * sin(phi) * cos(theta);
    float y = r * sin(phi) * sin(theta);
    float z = r * cos(phi);
    
    neurons[i] = new PVector(x, y, z);

    firingActivity[i] = random(0.4, 0.8);  // Random initial activity
  }
}

void draw() {
  background(5,5,40);
  
  // Camera rotation effect
  translate(width / 2, height / 2, -500);
  rotateY(angle);
  angle += 0.008; // Slow rotation

  // Update neuron positions (simulate firing movement)
  for (int i = 0; i < n; i++) {
    neurons[i].x += random(-1, 1);
    neurons[i].y += random(-1, 1);
    neurons[i].z += random(-1, 1);
    
    if (random(1) < 0.02) {
      firingActivity[i] = 1;  // Fire at max strength
    } else {
      firingActivity[i] *= 0.95; // Decay firing if inactive
    }
  }

  // Draw connections and apply Hebbian learning
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      float d = neurons[i].dist(neurons[j]);

      if (d < maxDistance) {
        float fireLevel = firingActivity[i] * firingActivity[j];

        // Strengthen synapse if neurons fire together
        if (fireLevel > 0.1) {
          synapseStrength[i][j] += learningRate * fireLevel;
        } else {
          synapseStrength[i][j] -= decayRate;
        }
      } else {
        // Weaken synapse if neurons drift too far apart
        synapseStrength[i][j] -= decayRate * 2;
      }

      // Keep synapse strength in range
      synapseStrength[i][j] = constrain(synapseStrength[i][j], 0, 1);

      // Remove weak connections
      if (synapseStrength[i][j] < minStrength) {
        synapseStrength[i][j] = 0;
      }

      // Draw strong synapses with bright and dark blue based on strength
      if (synapseStrength[i][j] > minStrength) {
        float alpha = synapseStrength[i][j] * 255;
        float blueIntensity = map(synapseStrength[i][j],90,21, 100, 0);// Adjust blue intensity
        stroke(0,255, blueIntensity, alpha);  // Brighter blue for stronger connections
        strokeWeight(synapseStrength[i][j] * 2);
        line(neurons[i].x, neurons[i].y, neurons[i].z, neurons[j].x, neurons[j].y, neurons[j].z);
      }
    }
  }

  // Draw neurons with glow effect based on firing activity
  for (int i = 0; i < n; i++) {
    float fireGlow = firingActivity[i] * 255;
    fill(55,fireGlow, fireGlow);
    noStroke();
    pushMatrix();
    translate(neurons[i].x, neurons[i].y, neurons[i].z);
    sphere(4);  // Neurons represented as glowing spheres
    popMatrix();
  }
}
