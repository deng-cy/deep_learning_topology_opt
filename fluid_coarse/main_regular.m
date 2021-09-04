% Comsol server required
%% some parameters
folder='data_r';
mkdir(folder);
a=2;
b=0.8;
delta=0.1;

base=[];
iter=100;
results=zeros(iter,3);
n=100;
n_0=400;
results(:,1)=(n:n:n*iter)';
seed_train=3;
seed_opt=123;

nx=a/delta;
ny=b/delta;
%% loops
p=[0.1,0.1,0.2,0.2,0.2];
for i=1:iter
    testfile=['./',folder,'/',num2str(n),'ntrain_test_step',num2str(i),'.mat'];
    optfile=['./',folder,'/',num2str(n),'ntrain_opt_step',num2str(i),'.mat'];
    trainfile=['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i),'.mat'];
    seed_gen=2+i;
    
    if i>1
        mydata=load(['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i-1),'.mat']);
        inputs = func_inputs_gen(n,seed_gen,base,nx,ny,p,mydata.inputs);
        outputs = func_outputs_nowrite(inputs,nx,ny);
        inputs(outputs==Inf,:,:)=[];
        outputs(outputs==Inf)=[];
        inputs=[mydata.inputs;inputs];
        outputs=[mydata.outputs;outputs];
    else
        inputs = func_inputs_gen(n_0,seed_gen,base,nx,ny);
        outputs = func_outputs_nowrite(inputs,nx,ny);
        inputs(outputs==Inf,:,:)=[];
        outputs(outputs==Inf)=[];
    end
    save(trainfile,'inputs','outputs');
    % run python, CHANGE the following to your python executable directory
    cmdstr=sprintf('C:/Users/dcy60/Anaconda3/Scripts/activate & C:/Users/dcy60/Anaconda3/python.exe -c "import mlopt; mlopt.func(None,''%s'',''%s'',%d,%d,topk=%d)" ', trainfile,optfile,seed_train,seed_opt,n);
    
    [status,commandOut]=system(cmdstr);
    [results(i,2),results(i,3),base]= func_test(optfile,nx,ny);
    
    results(i,3)
    
end
save(['./',folder,'/','results'],'results');