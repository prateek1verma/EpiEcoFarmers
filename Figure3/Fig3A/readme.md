## Figure Generation for Farmer Decision-Making

This folder contains the code for generating Figure 3A, which demonstrates the relationship between fungicide coverage (theta) and net return, considering different relative fungicide prices (f). The code utilizes Matlab for solving the system of ordinary differential equations (ODEs) defined by equations (1)-(4) in the main text.

### File Descriptions

- `ODE_main_FarmerGT_fig3A_without_resistance.m`: This Matlab script generates Figure 3A by solving the ODE system defined in equations (1)-(4) in the paper using 4th order Runge-Kutta method. 
It plots the net return as a function of theta (fungicide coverage) for various values of f (relative fungicide price).

- `model_FarmerGT_with_resistance.m`: This file is a component used in the main code (`ODE_main_FarmerGT_fig3A_without_resistance.m`). It defines the set of ODEs required to simulate the dynamics of the system.

### Instructions

To reproduce Figure 3A, follow these steps:

1. Ensure you have Matlab (version R2022b) installed on your system.

2. Download or clone this repository to your local machine.

3. Open the file `ODE_main_FarmerGT_fig3A_without_resistance.m` in Matlab.

4. Modify any necessary input parameters within the code, such as initial conditions or model parameters.

5. Run the script in Matlab to generate the figure. The output plot will show the net return as a function of fungicide coverage for different relative fungicide prices.

Note: The code utilizes the `model_FarmerGT_with_resistance.m` file to define the ODE system. Ensure both files are in the same directory when running the main code.

For any questions or issues, feel free to contact the authors.
