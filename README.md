# algorithmicSimulations

This project consists of creating digital art through different autonomous algorithms that I programmed that can determine parts of the art piece independently. Each time that I run the code, a unique visualisation of the data emerges. I was inspired by the lectures on Neuromorphic Computing and AI in Neuroscience. Drawing on concepts from these areas, I visualised them using this autonomous system to showcase the intricate patterns and emergent beauty found in brain computations.

I did this project because I think patterns that emerge from data reveal the beauty and harmony of its underlying rules. I wanted the algorithm to have a degree of autonomy because it allows each artwork to exist as its own entity. This autonomy parallels the self-organizing nature of the patterns. For example, the branching patterns of a tree follow underlying biological rules but no two trees grow exactly the same way. I also took some creative liberties when it came to colours and proportions to adhere to my taste.


Here’s a brief description of each digital piece I did:

# Logistic map 
![Screenshot 2025-02-10 112747](https://github.com/user-attachments/assets/d31f7ebb-c586-40d1-abc6-1ac7d12e96ad)

This is a visual representation of chaotic dynamics and non-linear behaviour, where small changes in initial conditions lead to vastly different outcomes. This principle applies to most complex systems, including the human brain and AI models. In the brain, this can be observed in neurons that have a chaotic neural activity, which fire in irregular and seemingly random patterns due to nonlinear feedback mechanisms (Korn & Faure, 2003). To represent this chaotic neural activity, I programmed the logistic map equation. It’s a simple recursive function where r is the growth rate that when it becomes more than 3.57 the system becomes fully chaotic.

Korn, H., & Faure, P. (2003). Is there chaos in the brain? II. Experimental evidence and related models. Comptes Rendus Biologies, 326(9), 787–840. https://doi.org/10.1016/j.crvi.2003.09.011


# Neural Network
![Screenshot 2025-02-10 115726](https://github.com/user-attachments/assets/fd1c089e-d260-4a55-b269-7cf12eb1a873)

This simulation visualizes how neurons form connections and adapt based on their firing patterns. I wanted to showcase Hebbian learning; the synapses between neurons that fire together are strengthened.  The simulation also shows synaptic plasticity by weakening unused synaptic connections; connections decay over time unless they continuously fire together. 


# Hebbian learning
![Screenshot 2025-02-10 121809](https://github.com/user-attachments/assets/2511c7e6-54ab-4e16-9fbd-ccd8e6598c73)

This code simulates a system of particles that represent neurons interacting with attraction points to showcase their movement as Long-Term Potentiation (LTP) and Long-Term Depression (LTD), analogous to synaptic strengthening and Hebbian learning. Each stroke represents a neuron in a 2D space and their movements are influenced by attraction points that symbolise stimuli. When there’s a high count of strokes together, they go faster and attract more strokes other near them, and vice versa. This creates a self-organizing system that mimics the patterns of synaptic strength symbolised through movement.

# Noise
![Screenshot 2025-02-09 182314](https://github.com/user-attachments/assets/ed2930f7-1285-4fd9-a5fe-29ebae198287)

Each stroke represents a neuron with a specific level of activity, which influences its movement. The stroke’s movement is shaped by a combination of excitatory inputs: these represent neural firing, and background noise. The excitatory inputs guide the stroke toward a particular direction, simulating the neuron’s firing response. On the other hand, the background noise introduces randomness, preventing the stroke from following a fixed path, representing inhibitory signals or unpredictable influences within the neural environment.

# Cells
![Screenshot 2025-02-10 132032](https://github.com/user-attachments/assets/a30fbc53-3ae9-447a-9d5d-4f0bb8b9b7e8)

Each “cell” in this visualization mimics a neuron that can either be active (firing) or inactive (not firing), with the state of each neuron influenced by its neighboring neurons. The update rules are inspired by concepts of synaptic interaction in neural networks—neurons become active if there is sufficient input from their neighbors, while they can die if there is too little or too much activation. 



# Sources:

Diaz-Rincon, Ricardo & Carrilo, Paola & Reyes Vera, Javier M.. (2019). An approach to Generative Art from Brain Computer Interfaces. 

Korn, H., & Faure, P. (2003). Is there chaos in the brain? II. Experimental evidence and related models. Comptes Rendus Biologies, 326(9), 787–840. https://doi.org/10.1016/j.crvi.2003.09.011

https://bit-101.com/2017/ 
https://visualalchemist.in/2024/10/12/the-neuroscience-of-perception-in-generative-art/ 
https://github.com/whitegreen/GenerativeArt/tree/main 
https://p5js.org/tutorials/ 
https://thecodingtrain.com/tracks/code-programming-with-p5-js 
