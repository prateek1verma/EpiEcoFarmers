This folder contains the code for generating Figure B2 (B). The code utilizes Matlab for solving the system of ordinary differential equations (ODEs) for case of with resistance, high-efficacy fungicide and partial resistance described in the main text.

### File Descriptions

- `ODE_main_FarmerGT_figS2B_with_resistance.m`: This Matlab script generates Figure B2-B by solving the ODE system with resistance case using 4th Order Runge Kutta Method.
It plots the net return as a function of theta (fungicide coverage) for various values of f (relative fungicide price) assuming a high-efficacy fungicide and partial resistance but with fitness cost of resistance.

- `model_FarmerGT_with_resistance.m`: This file is a component used in the main code (`ODE_main_FarmerGT_figS2B_with_resistance.m`). It defines the set of ODEs required to simulate the dynamics of the system.

### Instructions

To reproduce Figure B2 (B), follow these steps:

1. Ensure you have Matlab (version R2022b) installed on your system.

2. Download or clone this repository to your local machine.

3. Open the file `ODE_main_FarmerGT_figS2B_with_resistance.m` in Matlab.

4. Modify any necessary input parameters within the code, such as initial conditions or model parameters.

5. Run the script in Matlab to generate the figure. The output plot will show the net return as a function of fungicide coverage for different relative fungicide prices.

Note: The code utilizes the `model_FarmerGT_with_resistance.m` file to define the ODE system. Ensure both files are in the same directory when running the main code.

For any questions or issues, feel free to contact the authors.
