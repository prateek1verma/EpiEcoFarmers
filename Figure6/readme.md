## MATLAB Code Description

This folder contain the MATLAB codes used to generate Figure 6A, 6B and 6C that are the heatmaps representing the economic cost of fungicide resistance and its variation with respect to the effects of fungicide price, degree of resistance, basic reproductive number, and relative yield respectively. In the heatmap 6A variation is with respect to the relative yield (`f`) and the fungicide efficacy (`eps_r`). In the heatmap 6B variation is with respect to the relative yield (`f`) and the basic reproduction number (`R0`). In the heatmap 6C variation is with respect to the relative yield (`f`) and the relative yield (`y`). Values of the other parameters are specified in the respective codes.

### File Descriptions

- `Contour_main_economic_cost_vary_eps_r.m`: This Matlab script generates Figure 6A by solving the ODE system described in the paper using Matlab inbuilt function `ode45`.
It plots a heatmap and generates data on the economic cost of fungicide resistance and its variation with respect to the effects of fungicide price and degree of resistance.

- `Contour_main_economic_cost_vary_R0.m`: This Matlab script generates Figure 6B by solving the ODE system described in the paper using Matlab inbuilt function `ode45`.
It plots a heatmap and generates data on the economic cost of fungicide resistance and its variation with respect to the effects of fungicide price and the basic reproductive number.

- `Contour_main_economic_cost_vary_y.m`: This Matlab script generates Figure 6C by solving the ODE system described in the paper using Matlab inbuilt function `ode45`.
It plots a heatmap and generates data on the economic cost of fungicide resistance and its variation with respect to the effects of fungicide price and relative yield.

- `model_FarmerGT_with_resistance1.m`: This file is a component used in the main codes for generating figure 6A, 6B and 6C. It defines the set of ODEs required to simulate the dynamics of the system.

-  `Contour_vary_eps_r.txt`: Data file for Figure 6A.

- `Contour_vary_R0_r.txt`: Data file for Figure 6B.

- `Contour_vary_y_r.txt`: Data file for Figure 6C.


### Instructions

To reproduce Figure 6A, B and C, follow these steps:

1. Ensure that MATLAB (version R2022b) is installed on your system. The program also uses `parfor` for performing parallel computation for faster result rengeration. Hence, make sure to install Matlab's `Parallel Computing Toolbox` or use `for` loop instead of `parafor` in the codes.

2. Download or clone this repository to your local machine.

3. Open the file `Contour_main_economic_cost_vary_eps_r.m` or `Contour_main_economic_cost_vary_R0.m` or `Contour_main_economic_cost_vary_y.m` in MATLAB.

4. Modify any necessary input parameters within the code, such as initial conditions or model parameters.

5. Run the script in MATLAB to generate the figure. The output plot will show the heatmap of the economic cost of fungicide resistance for the case of figure 6A, B or C.

**Note**: The code utilizes the `model_FarmerGT_with_resistance1.m` file to define the ODE system. Ensure that both files are located in the same directory when running the main code.

For any questions or issues, please contact the authors.
