%% Special Case: Linear stablity analysis without resistance)
disp('Special Case: without resistance');
syms Iwt Iwu beta_w beta_r N theta mu epsilon_w epsilon_r Iuw Itw
Itr = 0; Iur = 0;
Iuwdot = beta_w*(Iuw + Itw)*(N*(1-theta) - Iuw - Iur) - mu*Iuw;
Itwdot = beta_w*(1-epsilon_w)*(Iuw + Itw)*(N*theta - Itw - Itr) - mu*Itw;
Iurdot = 0;
Itrdot = 0;

% Fixed points with pesticide resistance when eps_w = 1, eps_r = 0. There
% are three fixed points.
fix_pt = solve([Iuwdot==0 Itwdot==0], [Iuw Itw]);

% Saves the fixed points in 'Fixedpoints_general_case.mat'
save('Fixedpoints_special_case_no_resistance.mat', 'fix_pt'); 

% Fixed point 1
diary ('Fixedpoint1_special_case_no_resistance.txt');
Iuw_fix1 = simplify(fix_pt.Iuw(1))
Itw_fix1 = simplify(fix_pt.Itw(1))
diary off

% Fixed point 2
diary ('Fixedpoint2_special_case_no_resistance.txt');
Iuw_fix2 = simplify(fix_pt.Iuw(2))
Itw_fix2 = simplify(fix_pt.Itw(2))
diary off

% Fixed point 3
diary ('Fixedpoint3_special_case_no_resistance.txt');
Iuw_fix3 = simplify(fix_pt.Iuw(3))
Itw_fix3 = simplify(fix_pt.Itw(3))
diary off


%% Stability Conditions for the Fixed Points
% Eigenvalues for fixed point 1 (No infection): {Iuw0 Itw0 Iur0 Itr0},{0 0 0 0}
J = jacobian([Iuwdot Itwdot],[Iuw Itw]);
J_new = subs(J,{Iuw Itw},{fix_pt.Iuw(1) fix_pt.Itw(1)});
diary ('StableCondition1_special_case_no_resistance.txt');
EigJ1 = (eig(J_new))
diary off

% Eigenvalues for fixed point 2 
J = jacobian([Iuwdot Itwdot],[Iuw Itw]);
J_new = subs(J,{Iuw Itw},{fix_pt.Iuw(2) fix_pt.Itw(2)});
diary ('StableCondition2_special_case_no_resistance.txt');
EigJ2 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 3 
J = jacobian([Iuwdot Itwdot],[Iuw Itw]);
J_new = subs(J,{Iuw Itw},{fix_pt.Iuw(3) fix_pt.Itw(3)});

diary ('StableCondition3_special_case_no_resistance.txt');
EigJ3 = (eig(simplify(J_new)))
diary off

%% Saving all Eigenvalues
Eigenvalue_vec.fixpt1 = EigJ1;
Eigenvalue_vec.fixpt2 = EigJ2;
Eigenvalue_vec.fixpt3 = EigJ3;
% Eigenvalue_vec.fixpt4 = EigJ4;
% Eigenvalue_vec.fixpt5 = EigJ5;
% Eigenvalue_vec.fixpt6 = EigJ6;

% Saves the Eigenvalues in '.mat' file for easy loading
save('Eigenvalues_special_case_no_resistance.mat', 'Eigenvalue_vec'); 
