%% some parameters
delta=0.25; %element size
ratio=0.5; %ratio of material
a=1;
b=1;
iter=100;
nx=a/delta+1;
ny=b/delta+1;
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;
folder='data_wl';
mkdir(folder);
n=100;
base=[];
results=zeros(iter,3);
results(:,1)=(n:n:n*iter)';
seed_train=3;
seed_opt=123;
%% loops
p=[0.1,0.1,0.2,0.2,0.2];
        
for i=1:iter
    i
    optfile=['./',folder,'/',num2str(n),'ntrain_opt_step',num2str(i),'.mat'];
    trainfile=['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i),'.mat'];
    seed_gen=2+i;
    inputs = func_inputs_gen(n,ratio,mask,seed_gen,base,p);
    outputs = func_outputs(inputs,a,b,delta,'temp.txt');
    if i>1
        mydata=load(['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i-1),'.mat']);
        inputs=[inputs;mydata.inputs];
        outputs=[outputs;mydata.outputs];
    end    
    save(trainfile,'inputs','outputs','mask');
    cmdstr=['C:/Users/dcy/Anaconda3/Scripts/activate & C:/Users/dcy/Anaconda3/python.exe -c',' "import mlopt; mlopt.func(',...
        'None',',''',optfile,''',',num2str(seed_train),',',num2str(seed_opt),',trainfile=''',trainfile,''') "'];
    [status,commandOut]=system(cmdstr)
    [results(i,2),results(i,3),base]= func_test(a,b,delta,optfile);
    results(i,3)
    
end
save(['./',folder,'/','results'],'results');