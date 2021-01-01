% Comsol server required
%% some parameters
delta=0.1; %element size
ratio=0.5; %ratio of material
a=1;
b=1;
nx=a/delta+1;
ny=b/delta+1;
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;
folder='data_offline';
mkdir(folder);
ns=1000:1000:20000;
% ns=[20000:10000:100000, 120000:20000:200000];
results=zeros(length(ns),3);
results(:,1)=ns';
seed_opt=123;
seed_train=3;
seed_gen=3;
trainfile=['./',folder,'/','training_dataset_20k.mat'];
% trainfile=['./',folder,'/','training_dataset_200k.mat'];

%% generate inputs and outputs data
inputs=func_inputs_gen(max(ns),ratio,mask,seed_gen,[],0);
outputs=func_outputs(inputs,a,b,delta,'temp.txt');
save(trainfile,'inputs','outputs','mask');
%% no loop, only once
for i=1:length(ns)
    n=ns(i);
    optfile=['./',folder,'/',num2str(n),'ntrain_opt.mat'];
    cmdstr=['C:/Users/dcy60/Anaconda3/Scripts/activate & C:/Users/dcy60/Anaconda3/python.exe -c',...
        ' "import mlopt; mlopt.func(',num2str(n),',''',optfile,''',',num2str(seed_train),',',num2str(seed_opt),',trainfile=''',trainfile,''') "'];
    [status,commandOut]=system(cmdstr)
    [results(i,2),results(i,3),base]= func_test(a,b,delta,optfile);
    results(i,3)
end
save(['./',folder,'/','results'],'results');