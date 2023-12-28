%% load data
load('./data_solo/200ntrain_train_step200.mat');
load('data_direct.mat');
t0=288645.8159382886; % baseline, zero solid
%% generate some beautiful colors
colors=func_linspecer(5);
%% b
fontsize=20;
fig=figure();
% solo
solo=1./outputs/t0;
plot(func_best_min(solo),'-','Color',colors(1,:),'LineWidth',3);hold on;
[y,x]=min(solo);

% direct
direct=repelem(-1./output_save/t0,101); % each step needs 101 calculations to get values and gradients
plot(func_best_min(direct),':','Color',colors(2,:),'LineWidth',3);hold on;

% approximated
approx=5865.991617/t0; %5865 is the time for approximated, see heat_approx.mph
plot([0,25000],[approx,approx],'--','Color',colors(3,:),'LineWidth',3);hold on;



% cross of solo
scatter(x,y,200,colors(1,:),'x','LineWidth',2); 
legend('SOLO','Direct','Approximated')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman')

xl=xlabel('$n_{train}$','Interpreter','latex');
yl=ylabel('$\tilde{t}$','Interpreter','latex');
xlim([0 25000])
ylim([0 0.2])
