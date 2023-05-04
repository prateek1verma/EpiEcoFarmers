close all
clear;
h = openfig('fig3C_vary_R0_nn_501.fig');
imgs = findobj(h, 'type' , 'image' );
cdata1 = imgs.CData;

% Create figure
figure;

% Create image
cdata1(cdata1==0) = NaN;

imagesc([0 0.7], [0 10],cdata1,'CDataMapping','scaled') % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
set(gca, 'fontname' , 'arial' )   % Set it to times
% The only other option is 'in'
set(gca,'FontSize',20) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization

% Create ylabel
ylabel('Basic reproduction number, $$R_0$$','FontSize',22,...
    'Interpreter','latex');

% Create xlabel
xlabel('Relative fungicide price, $$f$$','FontSize',22,'Interpreter','latex');
colormap gray % sets the colormap to grayscale
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image

hold on

hold on
plot([0,0.7], [10-2,10-2], 'Color', [0.1,0.1,0.9,0.5],'LineStyle','--','LineWidth',2);
plot([0,0.7], [10-4,10-4], 'Color', [0.1,0.1,0.9,0.5],'LineStyle','--','LineWidth',2);

% Define the x and y coordinates of the points where you want to plot the circles
x_points = [0.1, 0.33, 0.40, 0.65, 0.05, 0.25, 0.4, 0.65];
y_points = [10-2, 10-2, 10-2, 10-2, 10-4, 10-4, 10-4, 10-4];

% Set the size and color of the circles
circle_size = 6;
circle_color = 'white';
circle_outline_color = [0.9,0.1,0.1]; % set outline color to black
circle_outline_width = 2; % set outline width to 1 pixel

% Plot the circles at the specified points
hold on;
for i = 1:length(x_points)
    plot(x_points(i), y_points(i), 'o', 'MarkerSize', circle_size, 'MarkerFaceColor', circle_color, 'MarkerEdgeColor', circle_outline_color, 'LineWidth', circle_outline_width);
end

[C1,h1] = imcontour([0 0.7], [0 10], cdata1,[1.0 0.9 0.8 0.6 0.4 0.2],'--k','ShowText','on');

annotation('textbox', [0.05, 0.97, 0, 0], 'string', 'C','FontSize',30)
ax = gca;
exportgraphics(ax,'Fig3C.pdf','BackgroundColor','none')
savefig('fig3_vary_R0_lines.fig')
% contourf([0 1], [0 10], cdata1, 'edgecolor' , 'none' )

