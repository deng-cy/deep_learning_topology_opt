% Comsol server required
%% some parameters
folder='data_g'; % name of data folder
mkdir(folder);
a=2; % length of the design domain
b=0.8; % width of the design domain
delta=0.1; % grid size of design variables

base=[]; % initial guess of solution
iter=100; % total number of iterations of the algorithm
results=zeros(iter,3); % initialize result table
n=10; % number of additional samples per iteration
n_0=161; % number of samples in the initial batch
results(:,1)=(n:n:n*iter)';
seed_train=3; % DNN training random seed
seed_opt=123; % BBA optimization random seed
nx=a/delta; % number of design variables in x direction
ny=b/delta; % number of design variables in y direction
%% loops

for i=1:iter
    % get input/output file names
    testfile=['./',folder,'/',num2str(n),'ntrain_test_step',num2str(i),'.mat'];
    optfile=['./',folder,'/',num2str(n),'ntrain_opt_step',num2str(i),'.mat'];
    trainfile=['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i),'.mat'];
    
    seed_gen=2+i; % random seed for generation of new samples
    inputs = func_inputs_gen(n_0,seed_gen,base,nx,ny); % generate new samples
    outputs = func_outputs_nowrite(inputs,nx,ny); % calculate objective values
    
    % eliminate invalid data
    inputs(outputs==Inf,:,:)=[];
    outputs(outputs==Inf)=[];
    if i>1
        mydata=load(['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i-1),'.mat']);
        inputs=[mydata.inputs;inputs];
        outputs=[mydata.outputs;outputs];
    end
    save(trainfile,'inputs','outputs');
    
    % run python, CHANGE the following to your python executable directory 
    cmdstr=sprintf('C:/Users/dcy60/Anaconda3/Scripts/activate & C:/Users/dcy60/Anaconda3/python.exe -c "import mlopt; mlopt.func(None,''%s'',''%s'',%d,%d,topk=%d)" ', trainfile,optfile,seed_train,seed_opt,n);
    [status,commandOut]=system(cmdstr); % run mlopt.py
    [results(i,2),results(i,3),base]= func_test(optfile,nx,ny); % get the optimized solution from DNN
    
    results(i,3) % display current optimum
    
end
save(['./',folder,'/','results'],'results');