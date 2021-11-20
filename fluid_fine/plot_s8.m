%% comsol server required, you can jump to `plot` if data is downloaded
load('./data_g/10ntrain_train_step200.mat')
[val, idx]=max(outputs);
input=inputs(idx,:,:);
inputs_p=repmat(input,9,1,1); % with perturbation
% one perturbation
inputs_p(2,7,13)=1;
inputs_p(3,7,14)=1;
inputs_p(4,12,16)=1;
inputs_p(5,12,15)=1;
% two perturbation
inputs_p(6,7,13)=1;
inputs_p(6,12,16)=1;
inputs_p(7,7,13)=1;
inputs_p(7,12,15)=1;
inputs_p(8,7,14)=1;
inputs_p(8,12,15)=1;
inputs_p(9,7,14)=1;
inputs_p(9,12,16)=1;

% calculate outputs
outputs_p=func_outputs_nowrite(inputs_p,size(inputs_p,2),size(inputs_p,3));
save('data_pert.mat','inputs_p','outputs_p');
%% plot
p0=1.615637530235447;% baseline, all zeros

inputs_show=repmat(double(input),9,1,1); % with perturbation, to show only (use 0.5)
% one perturbation
inputs_show(2,7,13)=0.5;
inputs_show(3,7,14)=0.5;
inputs_show(4,12,16)=0.5;
inputs_show(5,12,15)=0.5;
% two perturbation
inputs_show(6,7,13)=0.5;
inputs_show(6,12,16)=0.5;
inputs_show(7,7,13)=0.5;
inputs_show(7,12,15)=0.5;
inputs_show(8,7,14)=0.5;
inputs_show(8,12,15)=0.5;
inputs_show(9,7,14)=0.5;
inputs_show(9,12,16)=0.5;

for i=1:size(inputs_show,1)
    figure('Position',[0,0,700,331.5789])    
h=heatmap(squeeze(1-inputs_show(i,:,:))','CellLabelColor','none','FontName','Times New Roman','FontSize',15);
colormap(gray)
colorbar off
h.Position=[0.05,0.15,0.9,0.76];
a2 = axes('Position', h.Position);               %new axis on top
a2.Color = 'none';                               %new axis transparent
a2.YTick = [];                %set y ticks to number of rows
a2.XTick = []; 
title(['$\widetilde{P}=$',num2str(p0/outputs_p(i,:,:),'%.5f')],'Interpreter','latex','FontSize',15)
end