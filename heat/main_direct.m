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
% computation as well. See Line 50. 
%% preprocessing, copied from main_solo.m
ratio=0.2; %ratio of solid
nx=10;
ny=10;
l=0.1;
d=l/nx/2;

nx_q=300;
ny_q=300;
qtotal=632080;

[coords,~] = fun_gen_coord(nx,ny,l);
N=nx*ny;
coord_list=reshape(coords(:,:,1:2),nx*ny,2);

delta_xy=pdist2(coord_list,coord_list,'squaredeuclidean');
A=zeros(N+3,N+3);
A(1:N,1:N)=exp(-delta_xy./d^2);
A(:,N+1)=1;
A(1:N,N+2:end)=coord_list;
A=triu(A)+triu(A,1)';

[query,query_mask]=fun_gen_coord(nx_q,ny_q,l);
query_list=reshape(query,[],2);
n_q=size(query_list,1);
delta_xy=pdist2(query_list,coord_list,'squaredeuclidean');
A_q=zeros(n_q,N+3);
A_q(:,1:N)=exp(-delta_xy./d^2);
A_q(:,N+1)=1;
A_q(:,N+2:end)=query_list;
query_mask_list=reshape(query_mask,[],1);
%%
x0=rand(nx*ny,1);

%%%%% parallel computation
% fun=@(x) func_outputs_withgrad_par(x,nx,ny,ratio,A,A_q,d,coord_list,query_mask_list,qtotal,ports);
% options = optimoptions('fmincon','MaxFunctionEvaluations',100,'Display','iter','SpecifyObjectiveGradient',true);
%%%%% serial computation, which we did not use; let me know if you have trouble
fun=@(x) func_outputs(x,ratio,A,A_q,d,coord_list,query_mask_list,qtotal);
options = optimoptions('fmincon','MaxFunctionEvaluations',25000,'Display','iter');

[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(fun,x0,[],[],[],[],zeros(nx*ny,1),ones(nx*ny,1),[],options);
