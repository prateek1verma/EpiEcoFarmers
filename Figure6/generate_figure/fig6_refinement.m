close all
clear;
hA = openfig('fig6A_vary_eps_r_economic_cost.fig');
hB = openfig('fig6B_vary_R0_economic_cost.fig');
hC = openfig('fig6C_vary_y_economic_cost.fig');
imgsA = findobj(hA, 'type' , 'image' );
imgsB = findobj(hB, 'type' , 'image' );
imgsC = findobj(hC, 'type' , 'image' );
cdataA = imgsA.CData;
cdataB = imgsB.CData;
cdataC = imgsC.CData;

panel = tiledlayout(1,3);
panel.TileSpacing = 'compact';
panel.Padding = 'compact';
%% Fig6A
ax1 = nexttile;
% cdata1(cdataA==0) = NaN;
imagesc([0 0.5], [0 1],cdataA,'CDataMapping','scaled') % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
set(gca, 'fontname' , 'arial' )   % Set it to times
% The only other option is 'in'
set(gca,'FontSize',20) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
ylabel('Fungicide efficacy, $$\epsilon_r$$','FontSize',22,...
    'Interpreter','latex');
xlabel('Relative fungicide price, $$f$$','FontSize',22,'Interpreter','latex');
colormap gray % sets the colormap to grayscale
% clim(ax1,[0 0.6])
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image

hold on
[C1,h1] = imcontour([0 0.5], [0 1], cdataA,'--k','ShowText','on');

annotation('textbox', [0.00, 0.97, 0, 0], 'string', 'A','FontSize',30)

% Add arrow to the y-axis value
x = [0.025 0.045];
y = [0.545 0.545];
ta = annotation('textarrow',x,y,'String',' ');
ta.LineWidth = 0.75;
ta.HeadStyle = "cback3";

%% Fig6B
ax2 = nexttile;
cdataB(cdataB==0) = NaN;
imagesc([0 0.5], [0 10],cdataB,'CDataMapping','scaled') % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
set(gca, 'fontname' , 'arial' )   % Set it to times
% The only other option is 'in'
set(gca,'FontSize',20) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
ylabel('Basic reproduction number, $$R_0$$','FontSize',22,...
    'Interpreter','latex');
xlabel('Relative fungicide price, $$f$$','FontSize',22,'Interpreter','latex');
colormap gray % sets the colormap to grayscale
%clim(ax2,[0 0.6])
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image

hold on
[C2,h2] = imcontour([0 0.5], [0 10], cdataB,'--k','ShowText','on');
annotation('textbox', [0.33, 0.97, 0, 0], 'string', 'B','FontSize',30)

% Add arrow to the y-axis value
x = [1.005/3 + 0.025, 1.005/3 + .045];
y = [0.545 0.545];
ta = annotation('textarrow',x,y,'String',' ');
ta.LineWidth = 0.75;
ta.HeadStyle = "cback3";

%% Fig6C
ax3 = nexttile;
cdataC(cdataC==0) = NaN;
imagesc([0 0.5], [0 1],cdataC,'CDataMapping','scaled') % displays the economic cost of resistance as a heatmap
set(gca,'TickDir','out'); % sets the tick direction of the axes to outward
set(gca, 'fontname' , 'arial' )   % Set it to times
% The only other option is 'in'
set(gca,'FontSize',20) % sets the font size of the axis labels and tick labels
hax = gca; % gets the current axis handle
hax.YRuler.MinorTick='on'; % turns on the minor tick marks on the y-axis
hax.XRuler.MinorTick='on'; % turns on the minor tick marks on the x-axis
grid on % turns on the grid lines
hax.YTickLabel = flipud(hax.YTickLabel); % flips the y-axis tick labels for better visualization
ylabel('Relative yield, $$y$$','FontSize',22,...
    'Interpreter','latex');
xlabel('Relative fungicide price, $$f$$','FontSize',22,'Interpreter','latex');
colormap gray % sets the colormap to grayscale
%clim(ax3,[0 0.6])
colorbar % displays the colorbar
axis square % sets the aspect ratio of the axes to 1:1 for a square image

hold on
[C3,h3] = imcontour([0 0.5], [0 1], cdataC,'--k','ShowText','on');
annotation('textbox', [0.67, 0.97, 0, 0], 'string', 'C','FontSize',30)

% Add arrow to the y-axis value
x = [2.01/3 + 0.025, 2.01/3 + .045];
y = [0.545 0.545];
ta = annotation('textarrow',x,y,'String',' ');
ta.LineWidth = 0.75;
ta.HeadStyle = "cback3";

%%
% annotation('textbox', [0.66, 0.97, 0, 0], 'string', 'A','FontSize',30)
% contourf([0 1], [0 10], cdata1, 'edgecolor' , 'none' )
% exportgraphics(panel,'Fig6.eps','BackgroundColor','none')
% savefig(panel,'fig6.fig')