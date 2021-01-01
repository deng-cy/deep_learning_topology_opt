% Comsol server required
%% figure 3d
delta=0.1; %element size
ratio=0.5; %ratio of material
a=1;%beam half width
b=1;%beam height

filename='temp.txt';
model = mphload('force_optimized.mph');
data=mpheval(model,{'pp'},'selection',1,'edim','domain');
nx=a/delta+1;
ny=b/delta+1;
indices=round(data.p./delta+1);
input=zeros(1,nx,ny);
for i=1:size(indices,2)
    input(1,indices(1,i),indices(2,i))=data.d1(i);
end

func_outputs(input,a,b,delta,filename,1)

%% figure 3e
figure;
% e0=1/func_outputs(reshape(ones(11,11)*0.5,1,11,11),1,1,0.1,'temp.txt');
e0=1.2086492;
load('./data_solo/1000ntrain_train_step12.mat')
outputs=outputs([1,1001:end]);
inputs=inputs([1,1001:end],:,:);
[val, idx]=max(outputs);
input=inputs(idx,:,:);
func_outputs(input,a,b,delta,filename,1);
E_tilt=1/val/e0

%% figure 3f
figure;
% e0=1/func_outputs(reshape(ones(11,11)*0.5,1,11,11),1,1,0.1,'temp.txt');
e0=1.2086492;
load('./data_solo/1000ntrain_train_step78.mat');
outputs=outputs([1,1001:end]);
inputs=inputs([1,1001:end],:,:);
[val, idx]=max(outputs);
input=inputs(idx,:,:);
func_outputs(input,a,b,delta,filename,2);
E_tilt=1/val/e0