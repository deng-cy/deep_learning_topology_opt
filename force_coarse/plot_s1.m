%% load data
wldata=load('./data_solo/results.mat'); % with loop
nldata_1=load('./data_offline/results.mat'); % no loop
nldata_2=load('./data_offline/results_supplement.mat');
nl=[nldata_1.results;nldata_2.results(2:end,:)];
wl=wldata.results;
wl_all=reshape(load('./data_solo/100ntrain_train_step100.mat').outputs,100,[]);
wl_all=reshape(wl_all(:,end:-1:1),[],1);
%% set parameters and preprocessing
fontsize=15;
n_min=min(nl(1,1),wl(1,1));
n_max=max(nl(end,1),wl(end,1));
nl(:,2:3)=1./nl(:,2:3);
wl(:,2:3)=1./wl(:,2:3);
wl_all=[(1:numel(wl_all))',1./wl_all];
%% generate some beautiful colors
colors=func_linspecer(5);
%% energy
% e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
e0=1.006918941964665;
figure('Position',[0,0,1200,500]);
semilogx(wl_all(:,1),func_best_min(wl_all(:,2))/e0,'-','Color',colors(1,:),'LineWidth',2);hold on;
semilogx(wl(:,1),wl(:,3)/e0,'s','Color',colors(1,:));hold on;
semilogx(nl(:,1),nl(:,3)/e0,'o','Color',colors(2,:));hold on;
xlabel('$n_{train}$','Interpreter','latex')
ylabel('$\tilde{E}$','Interpreter','latex')
axis([nl(1,1)*0.9,n_max*1.1,0.29,0.45])
legend('SOLO','SOLO$(\hat{\rho})$','Offline','Interpreter','latex')

%set xtick
% xtick=[2e3 1e4 1e5 2e5];
temp=num2str(round(xtick(:)./(10.^round(log10(xtick(:))))), '%d\\times');
xticklab = cellstr(num2str(round(log10(xtick(:))), '10^%d'));
for i=1:numel(xtick)
    if round(xtick(i)./(10.^round(log10(xtick(i)))))~=1
        xticklab{i}=[temp(i,:),xticklab{i}];
    end
end
set(gca,'XTick',xtick,'XTickLabel',xticklab)
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 


%% prediction error of rho_base
figure('Position',[0,0,1200,500]);
semilogx(wl(:,1),(wl(:,2)-wl(:,3))./wl(:,3),'s','Color',colors(1,:));hold on;
semilogx(nl(:,1),(nl(:,2)-nl(:,3))./nl(:,3),'o','Color',colors(2,:));hold on;
plot([n_min,n_max],[0,0],'k:');
xlabel('$n_{train}$','Interpreter','latex')
ylabel('Prediction error','Interpreter','latex')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 
axis([nl(1,1)*0.9,n_max*1.1,-inf,max((nl(:,2)-nl(:,3))./nl(:,3))*1.1])
% xticks([2e3 1e4 100000 200000])
legend('SOLO','Offline','Interpreter','latex')

%set xtick
xtick=[100 1e3 2e3 1e4 1e5 2e5];
temp=num2str(round(xtick(:)./(10.^round(log10(xtick(:))))), '%d\\times');
xticklab = cellstr(num2str(round(log10(xtick(:))), '10^%d'));
for i=1:numel(xtick)
    if round(xtick(i)./(10.^round(log10(xtick(i)))))~=1
        xticklab{i}=[temp(i,:),xticklab{i}];
    end
end
set(gca,'XTick',xtick,'XTickLabel',xticklab)
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 