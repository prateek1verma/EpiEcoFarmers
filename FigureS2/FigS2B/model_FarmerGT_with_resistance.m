function dYdt = model_FarmerGT_with_resistance(t,Y,beta_w,beta_r,mu,eps_w,eps_r,N,theta)
   gamma = 0.1; % figure B2-A and B2-B
   % gamma = 0.3; % figure B2-B
    Iuw = Y(1);
    Itw = Y(2);
    Iur = Y(3);
    Itr = Y(4);
    Hu = N*(1-theta) - Iuw - Iur;
    Ht = N*theta - Itw - Itr;
    dIuw_dt = beta_w * (Iuw+Itw) * Hu - mu*Iuw;
    dItw_dt = beta_w * (1-eps_w) * (Iuw+Itw) * Ht - mu*Itw;
    dIur_dt = (1- gamma) * beta_r * (Iur+Itr) * Hu - mu*Iur;
    dItr_dt = (1 - gamma) * beta_r * (1-eps_r) * (Iur+Itr) * Ht - mu*Itr;
    dYdt = [dIuw_dt,dItw_dt,dIur_dt,dItr_dt];
end