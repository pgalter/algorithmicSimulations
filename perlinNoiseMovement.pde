int n = 3000; // Number of particles (neurons)
PVector[] ps = new PVector[n]; // Array of particle positions
float[] activity = new float[n]; // Neural activity (firing rate)
float[][] synapseWeight = new float[n][n]; // Synaptic connection strength between neurons

void setup() {
  size(1100, 800);  // Canvas size
  background(0,0,200);
  for (int i = 0; i < n; i++) {
    ps[i] = new PVector(random(width), random(height)); // Initialize particles at random positions
    activity[i] = random(0.0, 1.0);  // Random initial activity
    // Initialize synaptic connections with random weights
    for (int j = 0; j < n; j++) {
      synapseWeight[i][j] = random(-0.1, 0.1);  // Random synaptic weight between -0.1 and 0.1 (inhibitory or excitatory)
    }
  }
  
  
}

void draw() {
  
  fill(20, 0, 10,1);
  rect(0, 0, width, height);  // Clear background with transparency
  
  stroke(0, 0, 255);  
  strokeWeight(4);
  float f1 = 0.015 * frameCount;
  float f2 = 0.01 * frameCount;
  
  for (int i = 0; i < n; i++) {
    PVector p = ps[i];
    float theta = noise(0.01 * p.x, 0.01 * p.y) * 3 * PI;  // Direction of movement based on noise (synaptic inputs)
    
    // Curved movement direction (neuronal firing)
    PVector a = new PVector(cos(theta), sin(theta)); // Excitatory input
    PVector b = new PVector(cos(f1), sin(f2)); // Noise or background activity (e.g., inhibitory influence)
    
    // Apply the activity of the particle to control the interaction strength
    PVector v = PVector.lerp(a, b, activity[i]); // Lerp to blend both directions based on activity level (synaptic strength)
    
    // Adjust movement with respect to neural firing (influenced by excitatory/inhibitory signals)
    p.add(v);
    
    // Update activity based on the synaptic connections with other neurons (particles)
    for (int j = 0; j < n; j++) {
      if (i != j) {  // Avoid self-interaction
        activity[i] += synapseWeight[i][j] * activity[j]; // Synaptic influence from neuron j to neuron i
      }
    }
    
    // Normalize activity to stay within the [0, 1] range
    activity[i] = constrain(activity[i], 0.0, 1.0);

    // Visual representation of the particle movement (neuron firing)
    point(p.x, p.y);
  }
}
