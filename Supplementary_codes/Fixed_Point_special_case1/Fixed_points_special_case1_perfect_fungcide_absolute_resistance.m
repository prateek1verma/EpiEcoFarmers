%% Special Case: Linear stablity analysis for perfect fungicide and absolute fungicide resistance)
disp('Special Case: eps_w = 1, eps_r = 0');
syms Iwt Iwu Irt Iru beta_w beta_r N theta mu Iuw Itw Iur Itr
epsilon_w = 1;
epsilon_r = 0;
Iuwdot = beta_w*(Iuw + Itw)*(N*(1-theta) - Iuw - Iur) - mu*Iuw;
Itwdot = beta_w*(1-epsilon_w)*(Iuw + Itw)*(N*theta - Itw - Itr) - mu*Itw;
Iurdot = beta_r*(Iur + Itr)*(N*(1-theta) - Iuw - Iur) - mu*Iur;
Itrdot = beta_r*(1-epsilon_r)*(Iur + Itr)*(N*theta - Itw - Itr) - mu*Itr;

% Fixed points with pesticide resistance when eps_w = 1, eps_r = 0. There
% are four fixed points.
fix_pt = solve([Iuwdot==0 Itwdot==0 Iurdot==0 Itrdot==0], [Iuw Itw Iur Itr])

% Saves the fixed points in 'Fixedpoints_general_case.mat'
save('Fixedpoints_special_case1.mat', 'fix_pt'); 

% Fixed point 1
diary ('Fixedpoint1_special_case1.txt');
Iuw_fix1 = simplify(fix_pt.Iuw(1))
Itw_fix1 = simplify(fix_pt.Itw(1))
Iur_fix1 = simplify(fix_pt.Iur(1))
Itr_fix1 = simplify(fix_pt.Itr(1))
diary off

% Fixed point 2
diary ('Fixedpoint2_special_case1.txt');
Iuw_fix2 = simplify(fix_pt.Iuw(2))
Itw_fix2 = simplify(fix_pt.Itw(2))
Iur_fix2 = simplify(fix_pt.Iur(2))
Itr_fix2 = simplify(fix_pt.Itr(2))
diary off

% Fixed point 3
diary ('Fixedpoint3_special_case1.txt');
Iuw_fix3 = simplify(fix_pt.Iuw(3))
Itw_fix3 = simplify(fix_pt.Itw(3))
Iur_fix3 = simplify(fix_pt.Iur(3))
Itr_fix3 = simplify(fix_pt.Itr(3))
diary off

% Fixed point 4
diary ('Fixedpoint4_special_case1.txt');
Iuw_fix4 = simplify(fix_pt.Iuw(4))
Itw_fix4 = simplify(fix_pt.Itw(4))
Iur_fix4 = simplify(fix_pt.Iur(4))
Itr_fix4 = simplify(fix_pt.Itr(4))
diary off

%% Stability Conditions for the Fixed Points
% Eigenvalues for fixed point 1 (No infection): {Iuw0 Itw0 Iur0 Itr0},{0 0 0 0}
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(1) fix_pt.Itw(1) fix_pt.Iur(1) fix_pt.Itr(1)});
diary ('StableCondition1_special_case1.txt');
EigJ1 = (eig(J_new))
diary off

% Eigenvalues for fixed point 2 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(2) fix_pt.Itw(2) fix_pt.Iur(2) fix_pt.Itr(2)});
diary ('StableCondition2_special_case1.txt');
EigJ2 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 3 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(3) fix_pt.Itw(3) fix_pt.Iur(3) fix_pt.Itr(3)});

diary ('StableCondition3_special_case1.txt');
EigJ3 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 4 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(4) fix_pt.Itw(4) fix_pt.Iur(4) fix_pt.Itr(4)});

diary ('StableCondition4_special_case1.txt');
EigJ4 = (eig(simplify(J_new)))
diary off

%% Saving all Eigenvalues
Eigenvalue_vec.fixpt1 = EigJ1;
Eigenvalue_vec.fixpt2 = EigJ2;
Eigenvalue_vec.fixpt3 = EigJ3;
Eigenvalue_vec.fixpt4 = EigJ4;
% Eigenvalue_vec.fixpt5 = EigJ5;
% Eigenvalue_vec.fixpt6 = EigJ6;

% Saves the Eigenvalues in '.mat' file for easy loading
save('Eigenvalues_special_case1.mat', 'Eigenvalue_vec'); 

%% Commented code
% % Eigenvalues for fixed point 1 (No infection): {Iuw0 Itw0 Iur0 Itr0},{0 0 0 0}
% J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
% J_new = subs(J,{Iuw Itw Iur Itr epsilon_w epsilon_r},{0 0 0 0 1 0});
% EigJ1 = eig(J_new)
% 
% % Eigenvalues for fixed point 2 (Endemic W): {Iuw0 Itw0 Iur0 Itr0},{N*(1-theta)-mu/beta_w 0 0 0}
% J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
% J_new = subs(J,{Iuw Itw Iur Itr epsilon_w epsilon_r},{N*(1-theta)-mu/beta_w 0 0 0 1 0});
% EigJ2 = eig(J_new)
% 
% % Eigenvalues for fixed point 3 (Endemic R): {Iuw0 Itw0 Iur0 Itr0},{0, 0,((theta - 1)*(mu - N*beta_r))/beta_r,-(mu*theta - N*beta_r*theta)/beta_r}
% J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
% J_new = subs(J,{Iuw Itw Iur Itr epsilon_w epsilon_r},{0, 0,((theta - 1)*(mu - N*beta_r))/beta_r,-(mu*theta - N*beta_r*theta)/beta_r, 1, 0});
% EigJ3 = eig(J_new)
% 
% % Eigenvalues for fixed point 4 (coexist W+R): {Iuw0 Itw0 Iur0 Itr0},{(N*beta_r - N*beta_w + N*beta_w*theta)/(beta_r - beta_w), 0, -(beta_r*mu - beta_w*mu + N*beta_r*beta_w*theta)/(beta_w*(beta_r - beta_w)), (beta_r*mu - beta_w*mu + N*beta_r*beta_w*theta)/(beta_r*beta_w)}
% J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
% J_new = subs(J,{Iuw Itw Iur Itr epsilon_w epsilon_r},{(N*beta_r - N*beta_w + N*beta_w*theta)/(beta_r - beta_w), 0, -(beta_r*mu - beta_w*mu + N*beta_r*beta_w*theta)/(beta_w*(beta_r - beta_w)), (beta_r*mu - beta_w*mu + N*beta_r*beta_w*theta)/(beta_r*beta_w) 1 0});
% EigJ4 = eig(J_new)