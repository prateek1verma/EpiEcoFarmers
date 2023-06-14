% First, we close all figures and clear the workspace.
close all;
clear;

% We choose which values of f we want to use. There are two sets of values, one for Figure 3A and one for Figure 3B. We comment/uncomment the corresponding line.
f_vec = [0.1, 0.25, 0.5, 0.75]; % Figure B1-A
% f_vec = [0.05, 0.15, 0.25, 0.50]; % Figure 4-A

% We determine the length of the f_vec vector.
nn = length(f_vec);

% We create a vector Theta_opt of zeros that will store the values of theta for which the net gain is maximum.
Theta_opt = zeros(1,nn);

% We initialize the ii variable to 1.
ii = 1;

% We loop over each value of f in f_vec.
for f = f_vec

% Parameters of the model
T = 100;        % Total time period for which simulation is performed
beta_w = 0.02;  % Transmission rate of the wildtype strain
beta_r = 0.02;  % Transmission rate of the resistant strain
mu =  5;        % Natural death rate of the host population
eps_w = 1;    % Efficacy of the fungicide on the wild-type strain
eps_r = 0;    % Efficacy of the fungicide on the resistant strain
N = 1000;       % Total number of hosts
y = 0.6;        % Relative yield of a diseased field with respect to the yield from a healthy field
R0 = beta_w*N/mu; % Basic reprodiction number

% Parameters of the Runge-Kutta (4th order) method
M = 1000;
t = linspace(0,T,M+1);
h = T / M; h2 = h / 2; h6 = h / 6;
Y_Kutta = zeros(M+1,4);

% Vectors for system restrictions and control
Theta_vec = 0:0.01:1;
Net_gain = zeros(length(Theta_vec),1);

% Initial conditions of the model
init_infect_prop = 0.01;    % initial frequency of infection (wildtype + resitant)
init_freq_resist = 0.05;     % proportion of resitant infection out of total initial infection

% Solving Dynamical System for each theta
iter = 1;

% Solve the dynamical system for each value of theta in Theta_vec
for theta = Theta_vec
Theta0 = theta;
I_uw0 = (1.0 - init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
I_tw0 = (1.0 - init_freq_resist)*(Theta0)*init_infect_prop*N;
I_ur0 = (init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
I_tr0 = (init_freq_resist)*(Theta0)*init_infect_prop*N;
Y_Kutta(1,:) = [I_uw0 , I_tw0, I_ur0, I_tr0];

% Runge-Kutta iterations
for i = 1:M
    % Differential equations of the model
    % First Runge-Kutta parameter
    k1 = model_FarmerGT_with_resistance(t(i), Y_Kutta(i, :),beta_w,beta_r,mu,eps_w,eps_r,N,theta);
    % Second Runge-Kutta parameter
    k2 = model_FarmerGT_with_resistance(t(i)+h2, Y_Kutta(i, :)+k1*h2,beta_w,beta_r,mu,eps_w,eps_r,N,theta);
    % Third Runge-Kutta parameter
    k3 = model_FarmerGT_with_resistance(t(i)+h2, Y_Kutta(i, :)+k2*h2,beta_w,beta_r,mu,eps_w,eps_r,N,theta);
    % Fourth Runge-Kutta parameter
    k4 = model_FarmerGT_with_resistance(t(i)+h, Y_Kutta(i, :)+k3*h,beta_w,beta_r,mu,eps_w,eps_r,N,theta);
    % Runge-Kutta new approximation
    Y_Kutta(i+1, :) = Y_Kutta(i, :)+(k1/6+k2/3+k3/3+k4/6)*h;
end
% Net_gain(iter) = trapz(t,( (N-sum(Y_Kutta,2)) + (sum(Y_Kutta,2))*y )./N - theta*theta*r);
Net_gain(iter) = (N-sum(Y_Kutta(end,:)) + sum(Y_Kutta(end,:))*y )./N - theta*f;
iter = iter + 1;
end

% Generates figure for each value of 'f'
figure(1)
plot(Theta_vec,Net_gain,'LineWidth',3)
xlabel('Fraction of treated fields, $\theta$','interpreter','latex') % x-label
ylabel('Relative net gain, $g(\theta)$','interpreter','latex',FontSize=22) % y-label
% title('$\epsilon_r<\epsilon_{rc}$','interpreter','latex',FontSize=22) % title
set(gca,'FontSize',20)
axis([0 1 0 1]) % set axis limit
axis square % set aspect ratio of the figure 1:1
grid on; % add grid lines to the plot
hold on % holds the plot so that other lines for diffrent value of 'f' could be plotted over it


% disp('Theta for which Net gain is maximum: ')
% disp(Theta_vec(Net_gain==max(Net_gain)))
% Theta_opt(ii) = Theta_vec(Net_gain==max(Net_gain));
ii = ii + 1;
end

legend('$f=0.10$','$f=0.25$','$f=0.50$','$f=0.75$','Location','southwest','interpreter','latex',FontSize=18)
print('FigS1A.eps','-depsc')