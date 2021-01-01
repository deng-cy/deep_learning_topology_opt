% mphstart(2036)
% matlab.engine.shareEngine
function outputs = func_python_api(inputs)
% used for CMAES and GSA
inputs=cell2mat(inputs);

delta=0.25; %element size
ratio=0.5;
a=1;
b=1;
nx=a/delta+1;
ny=b/delta+1;
mask_x=ones(nx,1);mask_x(1)=0.5;mask_x(end)=0.5;
mask_y=ones(1,ny);mask_y(1)=0.5;mask_y(end)=0.5;
mask=mask_x*mask_y*delta^2;

z=reshape(inputs,nx,ny);
temp=sum(z.*mask,'all');
if temp>ratio
    z=z/temp*ratio;
else
    void=1-z;
    void=void/(1-temp)*(1-ratio);
    z=1-void;
end

outputs=1./func_outputs(reshape(z,1,nx,ny),a,b,delta,'temp.txt');

end
