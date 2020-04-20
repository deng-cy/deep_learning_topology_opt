%% load data
wldata=load('./data_wl/results.mat');
nldata=load('./data_nl/results_supplement.mat');
nl=nldata.results;
wl=wldata.results;
wl=wl(20:end,:);
%% set parameters and preprocessing
fontsize=15;
n_min=min(nl(1,1),wl(1,1));
n_max=max(nl(end,1),wl(end,1));
nl(:,2:3)=1./nl(:,2:3);
wl(:,2:3)=1./wl(:,2:3);
%% prediction error of rho_base
figure;
semilogx(wl(:,1),(wl(:,2)-wl(:,3))./wl(:,3),'s');hold on;
semilogx(nl(:,1),(nl(:,2)-nl(:,3))./nl(:,3),'o');hold on;
plot([n_min,n_max],[0,0],'k:');
xlabel('$n_{train}$','Interpreter','latex')
ylabel('Prediction error','Interpreter','latex')
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 
axis([nl(1,1)*0.9,n_max*1.1,-inf,max((nl(:,2)-nl(:,3))./nl(:,3))*1.1])
% xticks([2e3 1e4 100000 200000])
legend('Online','Offline')

%set xtick
xtick=[2e3 1e4 1e5 2e5];
temp=num2str(round(xtick(:)./(10.^round(log10(xtick(:))))), '%d\\times');
xticklab = cellstr(num2str(round(log10(xtick(:))), '10^%d'));
for i=1:numel(xtick)
    if round(xtick(i)./(10.^round(log10(xtick(i)))))~=1
        xticklab{i}=[temp(i,:),xticklab{i}];
    end
end
set(gca,'XTick',xtick,'XTickLabel',xticklab)
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 

%% energy
% e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
e0=1.006918941964665;
figure;
semilogx(wl(:,1),wl(:,3)/e0,'s');hold on;
semilogx(nl(:,1),nl(:,3)/e0,'o');hold on;
xlabel('$n_{train}$','Interpreter','latex')
ylabel('$\tilde{E}$','Interpreter','latex')
axis([nl(1,1)*0.9,n_max*1.1,0.29,0.34])
legend('Online','Offline')

%set xtick
xtick=[2e3 1e4 1e5 2e5];
temp=num2str(round(xtick(:)./(10.^round(log10(xtick(:))))), '%d\\times');
xticklab = cellstr(num2str(round(log10(xtick(:))), '10^%d'));
for i=1:numel(xtick)
    if round(xtick(i)./(10.^round(log10(xtick(i)))))~=1
        xticklab{i}=[temp(i,:),xticklab{i}];
    end
end
set(gca,'XTick',xtick,'XTickLabel',xticklab)
set(gca,'FontSize',fontsize,'Fontname', 'Times New Roman') 


