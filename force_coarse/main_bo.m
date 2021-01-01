% Comsol server required
%% initialization
delta=0.25; %element size
ratio=0.5; %ratio of material
a=1;
b=1;
n_train=2000;
nx=a/delta+1;
ny=b/delta+1;
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;

%% implement BO

mask_1d=mask(:)';

fun=@(x) 1./func_outputs(reshape(x{:,:},1,nx,ny),a,b,delta,'temp.txt');% objective function
var = optimizableVariable('var1',[0,1]);
vars=var;
for i=2:25
    vars(end+1)=optimizableVariable(['var',num2str(i)],[0,1]);
end
xcon=@(X) xconstraint(X,mask_1d,ratio);
results = bayesopt(fun,vars,'XConstraintFcn',xcon,'AcquisitionFunctionName','expected-improvement','MaxObjectiveEvaluations',n_train);

save('data_bo.mat')

% function to select candidates satisfying constraints
function tf = xconstraint(X,mask,ratio)
tf=X{:,:}.*mask;
s=sum(tf,2);
tf=(s<=ratio)&(s>ratio*0.99);
end