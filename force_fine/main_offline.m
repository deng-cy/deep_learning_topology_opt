% Comsol server required
%% some parameters
delta=0.1; %element size
ratio=0.5; %ratio of material
a=1; % length of the design domain
b=1; % width of the design domain
nx=a/delta+1; % number of design variables in x direction
ny=b/delta+1; % number of design variables in y direction
% get the weight matrix to calculate average volume (`w` in the paper)
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;
folder='data_offline';
mkdir(folder);
ns=1000:1000:20000; % number of training samples (n_train in paper), use this line if you run for the main result
% ns=[20000:10000:100000, 120000:20000:200000]; % use this line if you run for Supplementary Fig 1
results=zeros(length(ns),3);
results(:,1)=ns';
seed_train=3; % random seed for DNN training
seed_opt=123; % random seed for GSA optimization
seed_gen=3; % random seed for generation of new samples
trainfile=['./',folder,'/','training_dataset_20k.mat']; % use this line if you run for the main result
% trainfile=['./',folder,'/','training_dataset_200k.mat']; % use this line if you run for Supplementary Fig 1

%% generate inputs and outputs data
inputs=func_inputs_gen(max(ns),ratio,mask,seed_gen,[],0);
outputs=func_outputs(inputs,a,b,delta,'temp.txt');
save(trainfile,'inputs','outputs','mask');
%% no loop, only once
for i=1:length(ns)
    n=ns(i);
    optfile=['./',folder,'/',num2str(n),'ntrain_opt.mat'];
    % run python, CHANGE the following to your python executable directory
    cmdstr=['C:/Users/dcy60/Anaconda3/Scripts/activate & C:/Users/dcy60/Anaconda3/python.exe -c',...
        ' "import mlopt; mlopt.func(',num2str(n),',''',optfile,''',',num2str(seed_train),',',num2str(seed_opt),',trainfile=''',trainfile,''') "'];
    [status,commandOut]=system(cmdstr)
    [results(i,2),results(i,3),base]= func_test(a,b,delta,optfile); % get the optimized solution from DNN
    results(i,3) % display current optimum
end
save(['./',folder,'/','results'],'results');