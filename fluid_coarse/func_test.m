function [prediction,outputs,base] = func_test(optfile,nx,ny)
optdata=load(optfile);
prediction=optdata.prediction(1);
base=optdata.base;
outputs=func_outputs_nowrite(base(1,:),nx,ny);
end

