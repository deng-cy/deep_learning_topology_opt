% Comsol server required
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
load('./data_solo/200ntrain_train_step200.mat');
t0=288645.8159382886; % baseline, zero solid
[val,idx]=max(outputs);
input=inputs(idx,:,:);
inputs_show=repmat(input,6,1,1);
t=zeros(6,1);

% reduce the nodal values to eliminate solid islands
inputs_show(2,1,6)=0;
inputs_show(3,1,3)=0;
inputs_show(4,5,2)=0;
inputs_show(5,10,2)=0;
inputs_show(6,10,10)=0.75;


for i=1:size(inputs_show,1)
figure()    
t(i)=1/func_outputs(inputs_show(i,:,:),ratio,A,A_q,d,coord_list,query_mask_list,qtotal,1)/t0;
end