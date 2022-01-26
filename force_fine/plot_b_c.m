%% load data
nlhatdata=load('./data_offline/results.mat'); % no loop
nl=nlhatdata.results;
wlhatdata=load('./data_solo/results.mat'); % with loop
wl_hat=wlhatdata.results(1:20,:,:);
wldata=load('./data_solo/1000ntrain_train_step20.mat');
wl=reshape(wldata.outputs,1000,[]);
wl=reshape(wl(:,end:-1:1),[],1);
cmaesdata=load('data_cmaes.mat');
cmaes=cmaesdata.y';
%% set parameters and preprocessing
fontsize=20;
n_min=min(nl(1,1),wl_hat(1,1));
n_max=max(nl(end,1),wl_hat(end,1));
nl(:,2:3)=1./nl(:,2:3);
wl_hat(:,2:3)=1./wl_hat(:,2:3);
wl=[(1:numel(wl))',1./wl];
cmaes=[(1:numel(cmaes))',cmaes];

%% generate some beautiful colors
colors=func_linspecer(5);
%% energy (objective)
figure;
font='Times';
% e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
e0=1.2086492;
plot(wl(:,1),func_best_min(wl(:,2))/e0,'-','Color',colors(1,:),'LineWidth',2);hold on;

plot(nl(:,1),nl(:,3)/e0,'o','Color',colors(2,:));hold on;
plot(cmaes(:,1),func_best_min(cmaes(:,2))/e0,'--','Color',colors(3,:),'LineWidth',2);hold on;

xlabel('$n_{train}$','Interpreter','latex')
ylabel('$\widetilde{E}$','Interpreter','latex')
% add convergence point
y=func_best_min(wl(:,2));
scatter(10243,y(10243)/e0,200,colors(1,:),'x','LineWidth',2); hold on;
% set font etc
legend('SOLO','Offline','CMA-ES')
set(gca,'FontSize',fontsize,'Fontname', font) 
ylim([0.20,1])
box on
%% prediction error of rho_hat
figure;
plot(wl_hat(:,1),(wl_hat(:,2)-wl_hat(:,3))./wl_hat(:,3),'s','Color',colors(1,:));hold on;
plot(nl(:,1),(nl(:,2)-nl(:,3))./nl(:,3),'o','Color',colors(2,:));hold on;

plot([n_min,n_max],[0,0],'k:');
xlabel('$n_{train}$','Interpreter','latex')
ylabel('$e(\widehat{\mbox{\boldmath$\rho$}})/E(\widehat{\mbox{\boldmath$\rho$}})-1$','Interpreter','latex')
legend('SOLO','Offline')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman')


