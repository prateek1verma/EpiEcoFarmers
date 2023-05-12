%% Computation of Basic Reproduction Number, R_0 (with next generation method)

%% Model of fungicide treatment without resistant pathogen
syms beta N theta eps mu
F = beta*N*[(1-theta) (1-theta); (1-eps)*theta (1-eps)*theta];
V = [mu 0; 0 mu];
E_w = eig(F/V)
disp('Model of fungicide treatment without resistant pathogen');
disp('R_0 is the maximum of the above eigenvalue vector E_w');
disp('')
disp('')

%% Model of fungicide treatment with resistant pathogen
clear beta N theta eps mu F V
syms beta_w beta_r N theta mu epsilon_w epsilon_r
F = [beta_w*N*(1-theta) beta_w*N*(1-theta) 0 0; (1-epsilon_w)*N*beta_w*theta (1-epsilon_w)*N*beta_w*theta 0 0; 0 0 beta_r*N*(1-theta) beta_r*N*(1-theta); 0 0 (1-epsilon_r)*N*beta_r*theta (1-epsilon_r)*N*beta_r*theta];
V = [mu 0 0 0; 0 mu 0 0; 0 0 mu 0; 0 0 0 mu];
E_r = eig(F/V)
disp('Model of fungicide treatment with resistant pathogen');
disp('R_0 is the maximum of the above eigenvalue vector E_r');