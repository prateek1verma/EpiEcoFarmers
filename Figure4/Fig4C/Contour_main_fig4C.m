% close all; 
clear;
tic
% Parameters of the model
nn = 501;
beta_w = 0.02;
beta_r = 0.02; 
mu =  5; 
N = 1000; 
y = 0.5; % r = 0.15; eps_r = 0.9;
eps_w = 1;
r_vec = linspace(0,0.7,nn); % [0.05, 0.35, 0.5, 1.05];
eps_r_vec = linspace(0,1,nn);
Theta_opt = zeros(nn,nn);

parfor jj = 1:nn
    for ii = 1:nn
eps_r = eps_r_vec(jj);
r_dummy_vec = r_vec;
r = r_dummy_vec(ii);
% eps_r = 0;
R0 = beta_w*N/mu;

% Parameters of the Runge-Kutta (4th order) method
tspan = [0 500];

% Vectors for system restrictions and control
Theta_vec = 0:0.01:1;
Net_gain = zeros(length(Theta_vec),1);

% Initial conditions of the model
init_infect_prop = 0.01;
init_freq_resist = 0.05;

% Solving Dynamical System for each theta
iter = 1;
for theta = Theta_vec
Theta0 = theta;
I_uw0 = (1.0 - init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
I_tw0 = (1.0 - init_freq_resist)*(Theta0)*init_infect_prop*N;
I_ur0 = (init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
I_tr0 = (init_freq_resist)*(Theta0)*init_infect_prop*N;
Y_Kutta0 = [I_uw0 , I_tw0, I_ur0, I_tr0];

[t,Y_Kutta] = ode15s(@(t,Y_Kutta) model_FarmerGT_with_resistance(t, Y_Kutta,beta_w,beta_r,mu,eps_w,eps_r,N,theta), tspan, Y_Kutta0);

Net_gain(iter) = (N-sum(Y_Kutta(end,:)) + sum(Y_Kutta(end,:))*y )./N - theta*r;
iter = iter + 1;
end

Theta_opt(jj,ii) = min(Theta_vec(Net_gain==max(Net_gain)));
    end
end

figure()
Theta_opt = flipud(Theta_opt);
imagesc([r_vec(1) r_vec(end)], [eps_r_vec(1) eps_r_vec(end)],Theta_opt)
set(gca,'TickDir','out'); % The only other option is 'in'
set(gca,'FontSize',20)
hax = gca;
hax.YRuler.MinorTick='on';
hax.XRuler.MinorTick='on';
grid on
hax.YTickLabel = flipud(hax.YTickLabel);
xlabel('Relative fungicide cost, $$r$$','interpreter','latex',FontSize=22)
ylabel('Fungicide efficacy, $$\epsilon_r$$','interpreter','latex',FontSize=22)
colormap gray
colorbar
axis square

filename = num2str(['fig4C_vary_eps_r_nn_',num2str(nn),'.fig']);
% dlmwrite('Fig4C.txt',Theta_opt)
% writematrix(Theta_opt,'Fig4C.txt','Delimiter','tab')

% hold on
% [C1,h1] = imcontour([r_vec(1) r_vec(end)], [eps_r_vec(1) eps_r_vec(end)], Theta_opt,'--k','ShowText','on');
toc

