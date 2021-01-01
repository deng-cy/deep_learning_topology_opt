%% load data
nlhatdata=load('./data_offline/results.mat'); % no loop
nl=nlhatdata.results;
wlhatdata=load('./data_solo/results.mat'); % with loop
wl_hat=wlhatdata.results(1:20,:,:);
wldata=load('./data_solo/100ntrain_train_step20.mat');
wl=reshape(wldata.outputs,100,[]);
wl=reshape(wl(:,end:-1:1),[],1);
cmaesdata=load('data_cmaes.mat');
cmaes=cmaesdata.y';
bodata=load('data_bo.mat');
bo=bodata.results.ObjectiveTrace;
ssdata=load('./data_ss/100ntrain_train_step20.mat');
ss=reshape(ssdata.outputs,100,[]);
ss=reshape(ss(:,end:-1:1),[],1);
gsa=load('data_gsa.mat').y;
%% set parameters and preprocessing
fontsize=20;
n_min=min(nl(1,1),wl_hat(1,1));
n_max=max(nl(end,1),wl_hat(end,1));
nl(:,2:3)=1./nl(:,2:3);
wl_hat(:,2:3)=1./wl_hat(:,2:3);
wl=[(1:numel(wl))',1./wl];
cmaes=[(1:numel(cmaes))',cmaes];
bo=[(1:numel(bo))',bo];
ss=[(1:numel(ss))',1./ss];
gsa=[(1:numel(gsa))',gsa'];
%% generate some beautiful colors
colors=func_linspecer(5);
%% energy (objective)
% e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
e0=1.006918941964665;
figure;
% scatter(wl_hat(:,1),wl_hat(:,3)/e0,70,colors(1,:),'s');hold on;
plot(wl(:,1),func_best_min(wl(:,2))/e0,'-','Color',colors(1,:),'LineWidth',2);hold on;
plot(nl(:,1),nl(:,3)/e0,'o','Color',colors(2,:));hold on;
plot(ss(:,1),func_best_min(ss(:,2))/e0,':','Color',colors(5,:),'LineWidth',2);hold on;
plot(gsa(:,1),func_best_min(gsa(:,2))/e0,'-.','Color',colors(2,:),'LineWidth',2);hold on;
plot(cmaes(:,1),func_best_min(cmaes(:,2))/e0,'--','Color',colors(3,:),'LineWidth',2);hold on;
plot(bo(:,1),func_best_min(bo(:,2))/e0,'-.','Color',colors(4,:),'LineWidth',2);hold on;
xlabel('$n_{train}$','Interpreter','latex')
% xticks([100 500 1000 2000])
ylabel('$\tilde{E}$','Interpreter','latex')
% add convergence point
y=func_best_min(wl(:,2));
scatter(501,y(501)/e0,200,colors(1,:),'x','LineWidth',2); hold on;
% set font etc
lgd=legend('SOLO','Offline','SS','GSA','CMA-ES','BO','Interpreter','latex');
lgd.NumColumns=2;
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 
ylim([0.28,0.82])
box on
%% prediction error of rho_hat
figure;
plot(wl_hat(:,1),(wl_hat(:,2)-wl_hat(:,3))./wl_hat(:,3),'s','Color',colors(1,:));hold on;
plot(nl(:,1),(nl(:,2)-nl(:,3))./nl(:,3),'o','Color',colors(2,:));hold on;

plot([n_min,n_max],[0,0],'k:');
xlabel('$n_{train}$','Interpreter','latex')
ylabel('$e(\hat{\rho})/E(\hat{\rho})-1$','Interpreter','latex')
legend('SOLO','Offline')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 



