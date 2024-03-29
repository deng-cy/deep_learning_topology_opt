%% comsol server required, you can jump to `plot` if data is downloaded
a=2;
b=0.8;
delta=0.05;
nx=a/delta;
ny=b/delta;

% extract nodal values
model = mphload('fluid_optimized.mph');
data=mpheval(model,{'dtopo1.theta'},'selection',2,'edim','domain','dataset','dset2');
indices=round(data.p./delta+1);
input_node=zeros(nx+1,ny+1);
for i=1:size(indices,2)
    input_node(indices(1,i),indices(2,i))=data.d1(i);
end
%convert nodal value to elemental value
input_element=zeros(nx,ny);
for xi=1:nx
    for yi=1:ny
        input_element(xi,yi)=mean(input_node(xi:xi+1,yi:yi+1),'all');
    end
end

ths=0.7:0.01:0.99;
n_ths=numel(ths);
inputs=zeros(n_ths,nx,ny);
for i=1:n_ths
    th=ths(i);
    inputs(i,input_element>th)=0;
    inputs(i,input_element<=th)=1;
    inputs(i,:,:)=inputs(i,:,end:-1:1);
end
inputs_unique=reshape(unique(reshape(inputs,[],nx*ny),'row','stable'),[],nx,ny);
%% compare outputs
outputs = func_outputs_nowrite(inputs_unique,nx,ny);
[val, idx]=max(outputs);
save('data_gb.mat','idx','outputs','inputs_unique');
% val=2.003380528496133
%% plot
font='Times';
load('data_gb.mat');
figure('Position',[0,0,750,300])
input=inputs_unique(idx,:,:);
h=heatmap(squeeze(1-input)','CellLabelColor','none','FontName',font,'FontSize',15);
colormap(gray)
colorbar off
h.Position=[0.05,0.1,0.9,0.9];
a2 = axes('Position', h.Position);               %new axis on top
a2.Color = 'none';                               %new axis transparent
a2.YTick = [];                %set y ticks to number of rows
a2.XTick = [];