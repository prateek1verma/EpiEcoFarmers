## MATLAB Code Description

The MATLAB code in this folder (`Fixed_points_special_case_without_resistance.m`) performs a linear stability analysis for a special case without fungicide resistance. It solves a system of differential equations representing the dynamics of different populations (Iuw, Itw) related to infection and treatment of fields with fungicide. The code calculates the fixed points of the system by finding the values of the variables where the derivatives are equal to zero.

The code then saves the fixed points in a file called `Fixedpoints_special_case_no_resistance.mat`. The fixedpoints are saved in separate text files, namely `Fixedpoint1_special_case_no_resistance.txt`, `Fixedpoint2_special_case_no_resistance.txt`, etc. It further calculates and saves the eigenvalues of the Jacobian matrix evaluated at each fixed point. The eigenvalues provide information about the stability of the system at each fixed point. The eigenvalues are saved in separate text files, namely `StableCondition1_special_case_no_resistance.txt`, `StableCondition2_special_case_no_resistance.txt`, etc.

Finally, the code collects all the eigenvalues in a structure called `Eigenvalue_vec` and saves it in a file called `Eigenvalues_special_case_no_resistance.mat` for easy loading and analysis.

The output of the code is provided in the folder `data_special_case_no_resistance`.

For any questions or issues, please contact the authors.