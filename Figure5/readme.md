This folder contains the code for generating Figure 5A, 5B and 5C. The code utilizes Matlab for solving the system of ordinary differential equations (ODEs) for case of without resistance and with resistance described in the main text.

### File Descriptions

- `main_economic_cost_resistance.m`: This Matlab script generates Figure 5A-C by solving the ODE system first for without resistance case and then for with resistance case using Maltab inbuilt function `ode45`.
It plots the optimal net return, optimal fungicide coverage and economic cost of resistance as a function of f (relative fungicide price).

- `model_FarmerGT_with_resistance.m`: This file is a component used in the main code (`main_economic_cost_resistance.m`). It defines the set of ODEs required to simulate the dynamics of the system.

### Instructions

To reproduce Figure 5A-C, follow these steps:

1. Ensure you have Matlab (version R2022b) installed on your system.

2. Download or clone this repository to your local machine.

3. Open the file `main_economic_cost_resistance.m` in Matlab.

4. Modify any necessary input parameters within the code, such as initial conditions or model parameters.

5. Run the script in Matlab to generate the figures. The output plot will show the optimal net return, optimal fungicide coverage and economic cost of resistance as a function of f (relative fungicide price).
6. 
Note: The code utilizes the `model_FarmerGT_with_resistance.m` file to define the ODE system. Ensure both files are in the same directory when running the main code.

For any questions or issues, feel free to contact the authors.
