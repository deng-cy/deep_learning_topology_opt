function outputs = func_outputs_nowrite(inputs,nx,ny)

import py.utils.isvalid % check whether the tunnel is blocked
n_nodes=nx*ny;
inputs=reshape(inputs,[],n_nodes);
iter=size(inputs,1);

% run comsol file
outputs=zeros(iter,1);
model = mphload('fluid.mph');
model.disableUpdates(true);
geo=cell(1,n_nodes);
for i=1:n_nodes
   geo{i}= ['sq',num2str(i)];
end

for i=1:iter
    if isvalid(reshape(inputs(i,:),nx,ny)') % if the tunnel is not blocked
        try
        model.component('comp1').geom('geom1').feature('dif1').selection('input2').set(['r2', geo(inputs(i,:)==1)]);
        model.component('comp1').geom('geom1').run;    
        model.sol('sol1').runAll;
        pressure=mphmean(model,'p','line','selection',1);
        outputs(i)=pressure;
            disp([num2str(i),': sucess'])
        catch
            disp([num2str(i),': calculation failed'])
        end
    else
        	disp([num2str(i),': invalid'])
    end
end
outputs=1./outputs;
end
