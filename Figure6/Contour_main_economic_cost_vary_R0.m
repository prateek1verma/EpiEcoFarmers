% close all; 
clear;
tic

%% Without resistance
% Parameters of the model
% beta_r = 0.00; % Transmission rate of the resistant strain
mu = 5; % Natural death rate of the host population
N = 1000; % Total number of hosts
y = 0.5; % Yield per unit area of a field
eps_w = 0.8; % Efficacy of the fungicide on the wild-type strain
eps_r = 0.5; % Efficacy of the fungicide on the resistant strain
tspan = [0 200]; % Time interval for solving the ODE system
nn = 101; % Number of points in the r_vec and beta_vec vectors
r_vec = linspace(0,0.5,nn); % Vector of relative fungicide cost
beta_vec = linspace(0,0.05,nn); % Vector of transmission rate of the wild-type strain
R0_vec = beta_vec*N/mu; % Vector of basic reproduction number of the wild-type strain
Theta_opt_without_resistance = zeros(nn,nn); % Matrix to store the optimal control parameter for each (r,beta) pair
Net_gain_without_resistance = zeros(nn,nn); % Matrix to store the Net gain for each (r,beta) pair

parfor jj = 1:nn % Parallel loop over beta_vec
    for ii = 1:nn % Nested loop over r_vec

    % Parameters of the model for each r and beta value
    beta_w = beta_vec(jj); % Transmission rate of the wild-type strain
    beta_r = beta_vec(jj); % Transmission rate of the wild-type strain
    r_dummy_vec = r_vec;
    r = r_dummy_vec(ii); % Relative fungicide cost for the current iteration
    
    % Vectors for system restrictions and control
    Theta_vec = 0:0.01:1;
    Net_gain = zeros(length(Theta_vec),1);
    
    % Initial conditions of the model
    init_infect_prop = 0.01; % Initial proportion of infected hosts
    init_freq_resist = 0.0; % Initial frequency of the resistant strain
    
    % Solving Dynamical System for each theta
    iter = 1;
        for theta = Theta_vec
        % Setting initial conditions for the ODE system
        Theta0 = theta;
        I_uw0 = (1.0 - init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
        I_tw0 = (1.0 - init_freq_resist)*(Theta0)*init_infect_prop*N;
        I_ur0 = (init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
        I_tr0 = (init_freq_resist)*(Theta0)*init_infect_prop*N;
        Y_Kutta0 = [I_uw0 , I_tw0, I_ur0, I_tr0];
        
        % Solving the ODE system
        [t,Y_Kutta] = ode45(@(t,Y_Kutta) model_FarmerGT_with_resistance1(t, Y_Kutta,beta_w,beta_r,mu,eps_w,eps_r,N,theta), tspan, Y_Kutta0);
        
        % Calculating the net gain for the current theta value
        Net_gain(iter) = (N-sum(Y_Kutta(end,:)) + sum(Y_Kutta(end,:))*y )./N - theta*r;
        iter = iter + 1;
        end
    
    % Finding the optimal control parameter value for the current (r,beta) pair    
    Theta_opt_without_resistance(jj,ii) = min(Theta_vec(Net_gain==max(Net_gain)));
    Net_gain_without_resistance(jj,ii) = max(Net_gain);
    end
end

%% With resistance
% Parameters of the model
Theta_opt_resistance = zeros(nn,nn); % Matrix to store the optimal control parameter for each (r,beta) pair
Net_gain_resistance = zeros(nn,nn); % Matrix to store the Net gain for each (r,beta) pair

parfor jj = 1:nn % Parallel loop over beta_vec
    for ii = 1:nn % Nested loop over r_vec

    % Parameters of the model for each r and beta value
    beta_w = beta_vec(jj); % Transmission rate of the wild-type strain
    beta_r = beta_vec(jj); % Transmission rate of the wild-type strain
    r_dummy_vec = r_vec;
    r = r_dummy_vec(ii); % Relative fungicide cost for the current iteration
    
    % Vectors for system restrictions and control
    Theta_vec = 0:0.01:1;
    Net_gain = zeros(length(Theta_vec),1);
    
    % Initial conditions of the model
    init_infect_prop = 0.01; % Initial proportion of infected hosts
    init_freq_resist = 0.05; % Initial frequency of the resistant strain
    
    % Solving Dynamical System for each theta
    iter = 1;
        for theta = Theta_vec
        % Setting initial conditions for the ODE system
        Theta0 = theta;
        I_uw0 = (1.0 - init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
        I_tw0 = (1.0 - init_freq_resist)*(Theta0)*init_infect_prop*N;
        I_ur0 = (init_freq_resist)*(1 - Theta0)*init_infect_prop*N;
        I_tr0 = (init_freq_resist)*(Theta0)*init_infect_prop*N;
        Y_Kutta0 = [I_uw0 , I_tw0, I_ur0, I_tr0];
        
        % Solving the ODE system
        [t,Y_Kutta] = ode45(@(t,Y_Kutta) model_FarmerGT_with_resistance1(t, Y_Kutta,beta_w,beta_r,mu,eps_w,eps_r,N,theta), tspan, Y_Kutta0);
        
        % Calculating the net gain for the current theta value
        Net_gain(iter) = (N-sum(Y_Kutta(end,:)) + sum(Y_Kutta(end,:))*y )./N - theta*r;
        iter = iter + 1;
        end
    
    % Finding the optimal control parameter value for the current (r,beta) pair    
    Theta_opt_resistance(jj,ii) = min(Theta_vec(Net_gain==max(Net_gain)));
    Net_gain_resistance(jj,ii) = max(Net_gain);
    end
end

%% Output
% This code block creates a figure that displays the optimal funcicide coverage 
% for a fungal spread model under different values of the basic reproduction number 
% and relative fungicide cost. 
figure()  % creates a new figure
fz = 16;
Economic_cost_resistance = Net_gain_without_resistance - Net_gain_resistance;
Economic_cost_resistance = flipud(Economic_cost_resistance);
Economic_cost_resistance = round(abs(Economic_cost_resistance),6);
imagesc([r_vec(1) r_vec(end)], [R0_vec(1) R0_vec(end)],Economic_cost_resistance) % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
% The only other option is 'in'
set(gca,'FontSize',fz) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
xlabel('Relative fungicide cost, $$r$$','interpreter','latex',FontSize=fz) % sets the x-axis label with LaTeX formatting
ylabel('Basic reproduction number, $$R_0$$','interpreter','latex',FontSize=fz) % sets the y-axis label with LaTeX formatting
colormap gray % sets the colormap to grayscale
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image

hold on
[C1,h1] = imcontour([r_vec(1) r_vec(end)], [R0_vec(1) R0_vec(end)], Economic_cost_resistance,'--k','ShowText','on');
toc

% figure()
% [C1,h1] = imcontour([r_vec(1) r_vec(end)], [R0_vec(1) R0_vec(end)], Economic_cost_resistance,'--k','ShowText','on');
% set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
% % The only other option is 'in'
% set(gca,'FontSize',fz) % sets the font size of the axis labels and tick labels
% hax = gca; % gets the current axis handle
% hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
% hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
% grid on % turns on the grid lines
% hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
% xlabel('Relative fungicide cost, $$r$$','interpreter','latex',FontSize=fz) % sets the x-axis label with LaTeX formatting
% ylabel('Basic reproduction number, $$R_0$$','interpreter','latex',FontSize=fz) % sets the y-axis label with LaTeX formatting
% axis square % sets the aspect ratio of the axes to 1:1 for a square image

figure()  % creates a new figure
Economic_cost_resistance = Net_gain_without_resistance - Net_gain_resistance;
Economic_cost_resistance = flipud(Economic_cost_resistance);
Economic_cost_resistance = round(abs(Economic_cost_resistance),6);
imagesc([r_vec(1) r_vec(end)], [R0_vec(1) R0_vec(end)],Economic_cost_resistance) % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
% The only other option is 'in'
set(gca,'FontSize',fz) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
xlabel('Relative fungicide cost, $$r$$','interpreter','latex',FontSize=fz) % sets the x-axis label with LaTeX formatting
ylabel('Basic reproduction number, $$R_0$$','interpreter','latex',FontSize=fz) % sets the y-axis label with LaTeX formatting
colormap summer % sets the colormap to grayscale
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image
hold on
[C1,h1] = imcontour([r_vec(1) r_vec(end)], [R0_vec(1) R0_vec(end)], Economic_cost_resistance, [0.25, 0.2,0.1,0.00001], '--k','ShowText','on');

writematrix(Economic_cost_resistance,'Contour_vary_R0_r.txt','Delimiter','tab')