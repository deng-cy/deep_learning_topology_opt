%% load data
gdata=load('./data_g/10ntrain_train_step100.mat');
g=gdata.outputs(1:1000);
rdata=load('./data_r/100ntrain_train_step100.mat');
r=rdata.outputs(1:2500);
output_gradient=1.557373167442459;
p0=g(161);
%% set parameters and preprocessing
g=round(p0./g,6); % there are equivalent solutions with very slight different outputs, use round to eliminate numerical error
r=p0./r;
font='Times';
%% generate some beautiful colors
colors=func_linspecer(8);
%% energy (objective)
fontsize=30;
fig=figure('Position',[0,0,1000,500]);
plot([0,2500],[p0./output_gradient,p0./output_gradient],'--','Color',colors(8,:),'LineWidth',3);hold on;
plot(func_best_min(g),'-','Color',colors(6,:),'LineWidth',3);hold on;
plot(func_best_min(r),'-','Color',colors(7,:),'LineWidth',3);hold on;

xl=xlabel('$n_{train}$','Interpreter','latex');
yl=ylabel('$\widetilde{P}$','Interpreter','latex','Rotation',0);
[y,x]=min(g);
scatter(x,y,300,colors(6,:),'x','LineWidth',2); hold on;
[y,x]=min(r);
scatter(x,y,300,colors(7,:),'x','LineWidth',2); hold on;

lgd=legend('Gradient-based','SOLO-G','SOLO-R');
lgd.Position=([0.6529 0.7008 0.3305 0.2692]);

set(gca,'FontSize',fontsize,'Fontname', font, 'Position',[0.1,0.13,0.7750,0.7950])
xl.Position=[2.7169e+03 0.9605 -1];
yl.Position=[-222.5806 0.9971 -1];
ylim([0.955,1])
box off
ax=gca;
zoom=[275,295,0.9565,0.9576];
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

set(fig, 'currentaxes', ax);
zoom=[2140,2155,0.9567,0.9570];
pixels=coord2pixel([zoom(1), zoom(3), zoom(2)-zoom(1), zoom(4)-zoom(3)]);
func_magnifyOnFigure(...
        fig,...
        'initialPositionSecondaryAxes', [650 180 200 120],...%pixels(4)/pixels(3)*100
        'initialPositionMagnifier',     pixels,...    
        'mode', 'interactive',...    
                'magnifierShape','ellipse',...
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 1,...
        'edgeColor', [0.2,0.2,0.2],...
        'secondaryAxesXLim',zoom(1:2),...
        'secondaryAxesYLim',zoom(3:4)...
            ); 
%% solution g
fontsize=35;
figure('Position',[0,0,500,200])
[val, idx]=min(g);
inputs=gdata.inputs;
input=inputs(idx,:,:);
h=heatmap(squeeze(1-input)','CellLabelColor','none','FontName',font,'FontSize',20);
colormap(gray)
colorbar off
h.Position=[0.1,0.2,0.8,0.8];
a2 = axes('Position', h.Position);
a2.Color = 'none';
a2.YTick = [];
a2.XTick = [];
%% solution r
figure('Position',[0,0,500,200])
[val, idx]=min(r);
inputs=rdata.inputs;
input=inputs(idx,:,:);
h=heatmap(squeeze(1-input)','CellLabelColor','none','FontName',font,'FontSize',20);
colormap(gray)
colorbar off
h.Position=[0.1,0.2,0.8,0.8];
a2 = axes('Position', h.Position);
a2.Color = 'none';
a2.YTick = [];
a2.XTick = [];
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
