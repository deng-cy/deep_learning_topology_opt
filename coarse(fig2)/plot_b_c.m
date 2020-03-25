%% load data
nldata=load('./data_nl/results.mat');
nl=nldata.results;
wldata=load('./data_wl/results.mat');
wl=wldata.results(1:20,:,:);

%% set parameters and preprocessing
fontsize=20;
n_min=min(nl(1,1),wl(1,1));
n_max=max(nl(end,1),wl(end,1));
nl(:,2:3)=1./nl(:,2:3);
wl(:,2:3)=1./wl(:,2:3);
%% prediction error of rho_base
figure;
plot(nl(:,1),(nl(:,2)-nl(:,3))./nl(:,3),'o-');hold on;
plot(wl(:,1),(wl(:,2)-wl(:,3))./wl(:,3),'s--');hold on;
plot([n_min,n_max],[0,0],'k:');
xlabel('$n_{train}$','Interpreter','latex')
ylabel('Prediction error','Interpreter','latex')
legend('Online','Offline')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 

%% energy
% e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
e0=1.006918941964665;
figure;
plot(nl(:,1),nl(:,3)/e0,'o-');hold on;
plot(wl(:,1),wl(:,3)/e0,'s--');hold on;
xlabel('$n_{train}$','Interpreter','latex')
xticks([100 500 1000 2000])
ylabel('$\tilde{E}$','Interpreter','latex')
legend('Online','Offline')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 


