## MATLAB Code Description

The MATLAB code in this folder (`Fixed_points_general_case_partial_resistance.m`) performs a linear stability analysis for a general case with fungicide resistance. It solves a system of differential equations representing the dynamics of different populations (Iuw, Itw, Iur, Itr) related to infection and resistance to fungicide. The code calculates the fixed points of the system by finding the values of the variables where the derivatives are equal to zero.

The code then saves the fixed points in a file called `Fixedpoints_general_case.mat`. The fixedpoints are saved in separate text files, namely `Fixedpoint1.txt`, `Fixedpoint2.txt`, etc. It further calculates and saves the eigenvalues of the Jacobian matrix evaluated at each fixed point. The eigenvalues provide information about the stability of the system at each fixed point. The eigenvalues are saved in separate text files, namely `StableCondition1.txt`, `StableCondition2.txt`, etc.

Finally, the code collects all the eigenvalues in a structure called `Eigenvalue_vec` and saves it in a file called `Eigenvalues_general_case.mat` for easy loading and analysis.

The output of the code is provided in the folder `data_general_case`.

For any questions or issues, please contact the authors.