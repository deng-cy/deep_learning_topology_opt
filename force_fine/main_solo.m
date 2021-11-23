% Comsol server required
%% some parameters
delta=0.1; %element size
ratio=0.5; %ratio of material
a=1; % length of the design domain
b=1; % width of the design domain
iter=80; % number of total iterations of the algorithm
nx=a/delta+1; % number of design variables in x direction
ny=b/delta+1; % number of design variables in y direction
% get the weight matrix to calculate average volume (`w` in the paper)
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;
folder='data_wl';
mkdir(folder);
n=1000; % number of initial/additional training samples 
base=[]; % initial guess of solution
results=zeros(iter,3);
results(:,1)=(n:n:n*iter)';
seed_train=3; % random seed for DNN training
seed_opt=123; % random seed for GSA optimization
%% loops
p=[0.1,0.1,0.2,0.2,0.2]; % [a1,a2,a3,...,an] where `ai` (i<n) denotes the probability to mutate a ixi matrix, and `an` denotes crossover possbility
for i=1:iter
    optfile=['./',folder,'/',num2str(n),'ntrain_opt_step',num2str(i),'.mat'];
     trainfile=['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i),'.mat'];
    seed_gen=2+i;
    inputs = func_inputs_gen(n,ratio,mask,seed_gen,base,p); % generate new samples
    outputs = func_outputs(inputs,a,b,delta,'temp.txt'); % calculate objective values
    if i>1 % if not initial batch, combine data
        mydata=load(['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i-1),'.mat']);
        inputs=[inputs;mydata.inputs];
        outputs=[outputs;mydata.outputs];
    end    
    save(trainfile,'inputs','outputs','mask');
    % run python, CHANGE the following to your python executable directory
    cmdstr=['C:/Users/dcy/Anaconda3/Scripts/activate & C:/Users/dcy/Anaconda3/python.exe -c',' "import mlopt; mlopt.func(',...
        'None',',''',optfile,''',',num2str(seed_train),',',num2str(seed_opt),',trainfile=''',trainfile,''') "'];
    [status,commandOut]=system(cmdstr)
     [results(i,2),results(i,3),base]= func_test(a,b,delta,optfile); % get the optimized solution from DNN
    results(i,3) % display current optimum
    
end
save(['./',folder,'/','results'],'results');