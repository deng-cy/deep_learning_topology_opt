p0=1.615637530235447;% baseline, all zeros
n_train=[641,800,1000,1400,1800,2000];
load('./data_g/10ntrain_train_step200.mat')
for i=1:numel(n_train)
    figure('Position',[0,0,700,331.5789])    
    [val, idx]=max(outputs(1:n_train(i)));
    input=inputs(idx,:,:);
    h=heatmap(squeeze(1-input)','CellLabelColor','none','FontName','Times New Roman','FontSize',15);
    colormap(gray)
    colorbar off
    h.Position=[0.05,0.15,0.9,0.76];
%     hs = struct(h);
%     hs.XAxis.TickValues = [];
%     hs.YAxis.TickValues = [];
a2 = axes('Position', h.Position);               %new axis on top
a2.Color = 'none';                               %new axis transparent
a2.YTick = [];                %set y ticks to number of rows
a2.XTick = []; 
title(['$n_{train}=$',num2str(n_train(i)),'\quad$\widetilde{P}=$',num2str(p0/val,'%.4f')],'Interpreter','latex','FontSize',15)
end