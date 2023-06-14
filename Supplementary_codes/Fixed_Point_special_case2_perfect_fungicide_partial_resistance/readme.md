## MATLAB Code Description

The MATLAB code in this folder (`Fixed_points_special_case2_perfect_fungicide_partial_resistance.m`) performs a linear stability analysis for a special case with fungicide resistance but assuming perfect fungicide and partial fungicide resistance. It solves a system of differential equations representing the dynamics of different populations related to infection, resistance and treatment of fields with fungicide. The code calculates the fixed points of the system by finding the values of the variables where the derivatives are equal to zero.

The code then saves the fixed points in a file called `Fixedpoints_special_case2.mat`. The fixedpoints are saved in separate text files, namely `Fixedpoint1_special_case2.txt`, `Fixedpoint2_special_case2.txt`, etc. It further calculates and saves the eigenvalues of the Jacobian matrix evaluated at each fixed point. The eigenvalues provide information about the stability of the system at each fixed point. The eigenvalues are saved in separate text files, namely `StableCondition1_special_case2.txt`, `StableCondition2_special_case2.txt`, etc.

Finally, the code collects all the eigenvalues in a structure called `Eigenvalue_vec` and saves it in a file called `Eigenvalues_special_case2.mat` for easy loading and analysis.

The output of the code is provided in the folder `data_special_case2`.

For any questions or issues, please contact the authors.