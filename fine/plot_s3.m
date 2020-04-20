% Comsol server required
%% figure 2d
delta=0.1; %element size
ratio=0.5; %ratio of material
a=1;%beam half width
b=1;%beam height

filename='temp.txt';
n_train=[1000,2000,4000,8000,15000,20000,40000,60000,79000];
%% figure 2e
e0=1/func_outputs(reshape(ones(11,11)*0.5,1,11,11),1,1,0.1,'temp.txt');
for i=1:9
    figure;
    load(['./data_wl/1000ntrain_train_step',num2str(fix(n_train(i)/1000)+1),'.mat'])
    outputs=outputs([1,1001:end]);
    inputs=inputs([1,1001:end],:,:);
    [val, idx]=max(outputs);
    input=inputs(idx,:,:);
    func_outputs(input,a,b,delta,filename,1); hold on;
    ax = gca;
    ax.Position = [0 0 1 0.9];
    E_tilt=1/val/e0;
    title(['$n_{train}=$',num2str(n_train(i)),'\quad$\widetilde{E}=$',num2str(E_tilt,'%4.3f')],'Interpreter','latex','FontSize',20)
end

% title(['$n_{train}=$',num2str(80000),'\quad$\widetilde{E}=$',num2str(E_tilt,'%4.3f')],'Interpreter','latex','FontSize',20)