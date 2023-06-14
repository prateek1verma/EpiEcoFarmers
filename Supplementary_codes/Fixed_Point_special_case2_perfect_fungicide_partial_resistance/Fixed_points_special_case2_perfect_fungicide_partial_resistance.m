%% Special case: Linear stablity analysis for perfect fungicide with partial resistance
disp('Special Case: eps_w = 1, 0 < eps_w  < 1),')
epsilon_w = 1;
syms Iwt Iwu Irt Iru beta_w beta_r N theta mu Iuw Itw Iur Itr epsilon_r
Iuwdot = beta_w*(Iuw + Itw)*(N*(1-theta) - Iuw - Iur) - mu*Iuw;
Itwdot = beta_w*(1-epsilon_w)*(Iuw + Itw)*(N*theta - Itw - Itr) - mu*Itw;
Iurdot = beta_r*(Iur + Itr)*(N*(1-theta) - Iuw - Iur) - mu*Iur;
Itrdot = beta_r*(1-epsilon_r)*(Iur + Itr)*(N*theta - Itw - Itr) - mu*Itr;

fix_pt = solve([Iuwdot==0 Itwdot==0 Iurdot==0 Itrdot==0], [Iuw Itw Iur Itr]);

% Saves the fixed points in 'Fixedpoints_general_case.mat'
save('Fixedpoints_special_case2.mat', 'fix_pt'); 

% [sol2.Iuw sol2.Itw sol2.Iur sol2.Itr]
% Fixed point 1
diary ('Fixedpoint1_special_case2.txt');
Iuw_fix1 = simplify(fix_pt.Iuw(1))
Itw_fix1 = simplify(fix_pt.Itw(1))
Iur_fix1 = simplify(fix_pt.Iur(1))
Itr_fix1 = simplify(fix_pt.Itr(1))
diary off

% Fixed point 2
diary ('Fixedpoint2_special_case2.txt');
Iuw_fix2 = simplify(fix_pt.Iuw(2))
Itw_fix2 = simplify(fix_pt.Itw(2))
Iur_fix2 = simplify(fix_pt.Iur(2))
Itr_fix2 = simplify(fix_pt.Itr(2))
diary off

% Fixed point 3
diary ('Fixedpoint3_special_case2.txt');
Iuw_fix3 = simplify(fix_pt.Iuw(3))
Itw_fix3 = simplify(fix_pt.Itw(3))
Iur_fix3 = simplify(fix_pt.Iur(3))
Itr_fix3 = simplify(fix_pt.Itr(3))
diary off

% Fixed point 4
diary ('Fixedpoint4_special_case2.txt');
Iuw_fix4 = simplify(fix_pt.Iuw(4))
Itw_fix4 = simplify(fix_pt.Itw(4))
Iur_fix4 = simplify(fix_pt.Iur(4))
Itr_fix4 = simplify(fix_pt.Itr(4))
diary off

% Fixed point 5
diary ('Fixedpoint5_special_case2.txt');
Iuw_fix5 = simplify(fix_pt.Iuw(5))
Itw_fix5 = simplify(fix_pt.Itw(5))
Iur_fix5 = simplify(fix_pt.Iur(5))
Itr_fix5 = simplify(fix_pt.Itr(5))
diary off

% % Fixed point 6
% diary ('Fixedpoint6.txt');
% Iuw_fix6 = simplify(sol2.Iuw(6))
% Itw_fix6 = simplify(sol2.Itw(6))
% Iur_fix6 = simplify(sol2.Iur(6))
% Itr_fix6 = simplify(sol2.Itr(6))
% diary off

% Eigenvalues for fixed point 1 (No infection): {Iuw0 Itw0 Iur0 Itr0},{0 0 0 0}
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(1) fix_pt.Itw(1) fix_pt.Iur(1) fix_pt.Itr(1)});
diary ('StableCondition1_special_case2.txt');
EigJ1 = (eig(J_new))
diary off

% Eigenvalues for fixed point 2 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(2) fix_pt.Itw(2) fix_pt.Iur(2) fix_pt.Itr(2)});
diary ('StableCondition2_special_case2.txt');
EigJ2 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 3 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(3) fix_pt.Itw(3) fix_pt.Iur(3) fix_pt.Itr(3)});

diary ('StableCondition3_special_case2.txt');
EigJ3 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 4 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(4) fix_pt.Itw(4) fix_pt.Iur(4) fix_pt.Itr(4)});

diary ('StableCondition4_special_case2.txt');
EigJ4 = (eig(simplify(J_new)))
diary off

% Eigenvalues for fixed point 5 
J = jacobian([Iuwdot Itwdot Iurdot Itrdot],[Iuw Itw Iur Itr]);
J_new = subs(J,{Iuw Itw Iur Itr},{fix_pt.Iuw(5) fix_pt.Itw(5) fix_pt.Iur(5) fix_pt.Itr(5)});

diary ('StableCondition5_special_case2.txt');
EigJ5 = (eig(simplify(J_new)))
diary off

%% Saving all Eigenvalues
Eigenvalue_vec.fixpt1 = EigJ1;
Eigenvalue_vec.fixpt2 = EigJ2;
Eigenvalue_vec.fixpt3 = EigJ3;
Eigenvalue_vec.fixpt4 = EigJ4;
Eigenvalue_vec.fixpt5 = EigJ5;
% Eigenvalue_vec.fixpt6 = EigJ6;

% Saves the Eigenvalues in '.mat' file for easy loading
save('Eigenvalues_special_case2.mat', 'Eigenvalue_vec'); 