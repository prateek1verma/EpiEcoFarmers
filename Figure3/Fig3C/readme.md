## MATLAB Code Description

This folder contains the MATLAB code used to generate Figure 3C, which represents a heatmap of the optimal fraction of treated fields maximizing the relative net return. The heatmap varies with respect to the relative yield (`f`) and the basic reproduction number (`R0`). The main code solves the system of ordinary differential equations (ODEs) described in the paper using the MATLAB built-in function `ode15s`.

### File Descriptions

- `Contour_main_fig3C_with_resistance_vary_R0_and_f.m`: This Matlab script generates Figure 3C by solving the ODE system described in the paper using Matlab inbuilt function `ode15s`.
It plots heatmap of the optimal fungicide coverage as a function of relative yield and basic reproduction number. The figure is saved as `fig3C_vary_R0_nn_501.fig` where 501 cooresponds to the number in which *f* and *R_0* are discretised in their domain to run the simulation. Reducing or increasing the value of this external parameter will yield less or more resolution heatmap respectively i.e. the simulation will be run for a few or more values in the domain of *f* and *R_0* .

- `model_FarmerGT_with_resistance.m`: This file is a component used in the main code (`Contour_main_fig3C_with_resistance_vary_R0_and_f.m`). It defines the set of ODEs required to simulate the dynamics of the system.

- `fig3C_adding_contour_lines.m`: The heatmap generated with using `Contour_main_fig3C_with_resistance_vary_R0_and_f.m` is added with contour lines. Line corresponding to the case of figure 3 (A) and (B) are represented by a point in the heatmap, which is highlighted by white red circles on two blue dashed lines.


### Instructions

To reproduce Figure 3C, follow these steps:

1. Ensure that MATLAB (version R2022b) is installed on your system.

2. Download or clone this repository to your local machine.

3. Open the file `Contour_main_fig3C_with_resistance_vary_R0_and_f.m` in MATLAB.

4. Modify any necessary input parameters within the code, such as initial conditions or model parameters.

5. Run the script in MATLAB to generate the figure. The output plot will show the heatmap of the optimal fungicide coverage as a function of the relative yield and the basic reproduction number. The figure will be saved in a format such as `fig3C_vary_R0_nn_501.fig`.

6. Open and run the file `fig3C_adding_contour_lines.m` to add contour lines and text to the previously generated figure (`fig3C_vary_R0_nn_501.fig`).

**Note**: The code utilizes the `model_FarmerGT_with_resistance.m` file to define the ODE system. Ensure that both files are located in the same directory when running the main code.

For any questions or issues, please contact the authors.