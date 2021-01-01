p0=1.490318571461260;% baseline, all zeros
n_train=[161,190,220,230,280,300];
load('./data_g/10ntrain_train_step100.mat')
for i=1:numel(n_train)
    figure('Position',[0,0,500,266.6667])
    [val, idx]=max(outputs(1:n_train(i)));
    input=inputs(idx,:,:);
    h=heatmap(squeeze(1-input)','CellLabelColor','none','FontName','Times New Roman','FontSize',20);
    colormap(gray)
    colorbar off
    h.Position=[0.1,0.18,0.8,0.6];
    a2 = axes('Position', h.Position);
    a2.Color = 'none';
    a2.YTick = [];
    a2.XTick = [];
    title(['$n_{train}=$',num2str(n_train(i)),'\quad$\widetilde{P}=$',num2str(1.490318571461260/val,'%.4f')],'Interpreter','latex','FontSize',20)
end