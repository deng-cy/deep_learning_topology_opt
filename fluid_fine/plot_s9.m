% plot solo-r in SI
%% load data
gdata=load('./data_g5/10ntrain_train_step500.mat');
g=gdata.outputs(1:5000);
output_gradient=2.003380528496133;
p0=g(641);
%% set parameters and preprocessing
g=round(p0./g,6); % there are equivalent solutions with very slight different outputs, use round to eliminate numerical error
%% generate some beautiful colors
colors=func_linspecer(8);
%% energy (objective)
fontsize=30;
fig=figure('Position',[0,0,1000,500]);
plot([0,5000],[p0./output_gradient,p0./output_gradient],'--','Color',colors(8,:),'LineWidth',3);hold on;
plot(func_best_min(g),'-','Color',colors(6,:),'LineWidth',3);hold on;

xl=xlabel('$n_{train}$','Interpreter','latex');
yl=ylabel('$\tilde{P}$','Interpreter','latex','Rotation',0);

[y,x]=min(g);
scatter(x,y,300,colors(6,:),'x','LineWidth',2); 
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman')
ylim([0.8,0.853])
legend('Gradient-based','SOLO-G','Interpreter','latex')

box off
zoom=[x-5,x+5,0.8061,0.8065];
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