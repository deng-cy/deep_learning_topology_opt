% plot solo-r in SI
%% load data
gdata=load('./data_g/10ntrain_train_step100.mat');
g=gdata.outputs(1:1000);
rdata=load('./data_r5/100ntrain_train_step40.mat'); % change folder name here
r=rdata.outputs(1:2500);
output_gradient=1.557373167442459;
p0=g(161);
%% set parameters and preprocessing
r=round(p0./r,6); % there are equivalent solutions with very slight different outputs, use round to eliminate numerical error
%% generate some beautiful colors
colors=func_linspecer(8);
%% energy (objective)
fontsize=30;
fig=figure('Position',[0,0,1000,500]);
plot([0,2500],[p0./output_gradient,p0./output_gradient],'--','Color',colors(8,:),'LineWidth',3);hold on;
plot(func_best_min(r),'-','Color',colors(7,:),'LineWidth',3);hold on;

xl=xlabel('$n_{train}$','Interpreter','latex');
yl=ylabel('$\tilde{P}$','Interpreter','latex','Rotation',0);

[y,x]=min(r);
scatter(x,y,300,colors(7,:),'x','LineWidth',2); 
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman')
ylim([0.955,1])
legend('Gradient-based','SOLO-R','Interpreter','latex')

box off
zoom=[x-5,x+5,0.9565,0.9576];
pixels=coord2pixel([zoom(1), zoom(3), zoom(2)-zoom(1), zoom(4)-zoom(3)]);
func_magnifyOnFigure(...
        fig,...
        'initialPositionSecondaryAxes', [300 280 220 170],...%pixels(4)/pixels(3)*100
        'initialPositionMagnifier',     pixels,...    
        'mode', 'interactive',... 
        'magnifierShape','ellipse',...
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 1,...
        'edgeColor', [0.2,0.2,0.2],...
        'secondaryAxesXLim',zoom(1:2),...
        'secondaryAxesYLim',zoom(3:4)...
            ); 
        
%% function

function out=coord2pixel(in) 
axPos = get(gca,'Position');
pixel=getpixelposition(gcf);
xMinMax = xlim;
yMinMax = ylim;
out=zeros(1,4);
x=in(1);y=in(2);width=in(3);height=in(4);
out(1) = (axPos(1) + ((x - xMinMax(1))/(xMinMax(2)-xMinMax(1))) * axPos(3)) *pixel(3);
out(2) = (axPos(2) + ((y - yMinMax(1))/(yMinMax(2)-yMinMax(1))) * axPos(4)) *pixel(4);
out(3) = width/(xMinMax(2)-xMinMax(1))* axPos(3) *pixel(3);
out(4) = height/(yMinMax(2)-yMinMax(1))* axPos(4)*pixel(4);

end