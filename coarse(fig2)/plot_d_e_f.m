
%% figure 2d
delta=0.25; %element size
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

%% figure 2e
e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
load('./data_wl/100ntrain_train_step7.mat')
outputs=outputs([1,101:end]);
inputs=inputs([1,101:end],:,:);
[val, idx]=max(outputs);
input=inputs(idx,:,:);
func_outputs(input,a,b,delta,filename,1)
E_tilt=1/val/e0

%% figure 2f
e0=1/func_outputs(reshape(ones(5,5)*0.5,1,5,5),1,1,0.25,'temp.txt');
load('./data_wl/100ntrain_train_step61.mat');
outputs=outputs([1,101:end]);
inputs=inputs([1,101:end],:,:);
[val, idx]=max(outputs);
func_outputs(input,a,b,delta,filename,1)

E_tilt=1/val/e0