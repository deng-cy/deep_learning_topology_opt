% Comsol server required

% Since this example is computationally expensive, we recommend computing
% the ground truth values F(\rho) in a parallel way. What needs to do is
% open several Comsol servers by, e.g., repeating the following command
% "C:\Program Files\COMSOL\COMSOL54\Multiphysics\bin\win64\comsolmphserver.exe" -autosave off -np 1 -multi on
% There are three options in the above command. "-autosave off" turns off
% autosave, "-np 1" sets number of CPU cores of each server to 1, and
% "-multi on" keeps the server after disconnecting Comsol from Matlab.
% When you get the port numbers (which will show in the Comsol window),
% fill them here:
ports=2036:2040;

% If you decide not to use parallel computation, you can use serial
% computation as well. Comment out Line 73 and use Line 72 (see comments there). 
%% some parameters
ratio=0.2; %ratio of solid
iter=100;
n=200;
n0=500;

nx=10;
ny=10;
l=0.1;
d=l/nx/2;

nx_q=300;
ny_q=300;
qtotal=632080;

folder='data_solo';
mkdir(folder);
base=[];
results=zeros(iter,3);
results(:,1)=(n:n:n*iter)';
seed_train=3;
seed_opt=123;
%% initialize

[coords,~] = fun_gen_coord(nx,ny,l);
N=nx*ny;
coord_list=reshape(coords(:,:,1:2),nx*ny,2);

delta_xy=pdist2(coord_list,coord_list,'squaredeuclidean');
A=zeros(N+3,N+3);
A(1:N,1:N)=exp(-delta_xy./d^2);
A(:,N+1)=1;
A(1:N,N+2:end)=coord_list;
A=triu(A)+triu(A,1)';

% integration preparation (to get the threshold to enforce volume constraint
[query,query_mask]=fun_gen_coord(nx_q,ny_q,l);
query_list=reshape(query,[],2);
n_q=size(query_list,1);
delta_xy=pdist2(query_list,coord_list,'squaredeuclidean');
A_q=zeros(n_q,N+3);
A_q(:,1:N)=exp(-delta_xy./d^2);
A_q(:,N+1)=1;
A_q(:,N+2:end)=query_list;
query_mask_list=reshape(query_mask,[],1);

%% loops
p=[0.2,0.1,0.2,0.2,0.2];
for i=1:iter
     testfile=['./',folder,'/',num2str(n),'ntrain_test_step',num2str(i),'.mat'];
    optfile=['./',folder,'/',num2str(n),'ntrain_opt_step',num2str(i),'.mat'];
     trainfile=['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i),'.mat'];
    seed_gen=2+i;
    
    inputs = single(func_inputs_gen((i==1)*n0+(i>1)*n,nx,ny,seed_gen,base,p));
    %%%%%%% choose between serial and parallel computation, "func_outputs" for serial and "func_outputs_par" for parallel %%%%%%%
%     outputs = func_outputs(inputs,ratio,A,A_q,d,coord_list,query_mask_list,qtotal);
    outputs = func_outputs_par(inputs,ratio,A,A_q,d,coord_list,query_mask_list,qtotal,ports);
    
    inputs(outputs==Inf,:,:)=[];
    outputs(outputs==Inf)=[];
    
    if i>1
        mydata=load(['./',folder,'/',num2str(n),'ntrain_train_step',num2str(i-1),'.mat']);
        inputs=[mydata.inputs;inputs];
        outputs=[mydata.outputs;outputs];
    end    
    save(trainfile,'inputs','outputs');
    cmdstr=sprintf('C:/Users/dcy60/Anaconda3/Scripts/activate & C:/Users/dcy60/Anaconda3/python.exe -c "import mlopt; mlopt.func(None,''%s'',''%s'',%d,%d)" ', trainfile,optfile,seed_train,seed_opt);
    [status,commandOut]=system(cmdstr)
     [results(i,2),results(i,3),base]= func_test(ratio,A,A_q,d,coord_list,query_mask_list,qtotal,optfile);
    results(i,3)
    
end
save(['./',folder,'/','results'],'results');