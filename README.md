# Leg-Exoskeleton-Simulation-on-WorkingModel2D
The Leg exoskeleton was built considering my own leg as reference. The upper leg(hip), the lower leg(calf) and the foot were modelled as cylinders and the links were considered to be motors. The desired movement for the leg was given and the torques were computed using the Newton-Euler method of outward-inward recursion (inverse dynamics). Inverse dynamics is the ca1culation of the forces required at a robot's joints in order to produce a given set of joint accelerations. The principal uses of inverse dynamics are in robot control and trajectory planning.

The leg exoskeleton was modelled on Working model 2D.The mass of each limb was equal to sum of the mass of the leg and exoskeleton. The center of mass was computed by considering the exoskeleton to be a point mass at the proximal end of the limb. The moment of inertia was computed considering the limbs to be cylinders.

The results and the method for simulation are presented in the report.

The code for the project is in the NewtonEuler.m file and the code for getting the results are presented in the Plot_code.m file
