% comsol server required
t0=288645.8159382886; % baseline, zero solid

%% c
% same as s7a
%% d
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

load('data_direct.mat');
[~,idx]=min(output_save(1:floor(25000/101)));
1/func_outputs(reshape(input_save(:,idx),10,10),ratio,A,A_q,d,coord_list,query_mask_list,qtotal,1)/t0

%% e
model=mphload('heat_approx.mph');
mphplot(model,'pg9')
axis off; title('')
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
5865.991617/t0 %5865 is the time for approximated, see heat_approx.mph
