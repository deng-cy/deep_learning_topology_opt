function [prediction,outputs,base] = func_test(a,b,delta,optfile)
optdata=load(optfile);
prediction=optdata.prediction;
base=optdata.base;
outputs=func_outputs(base,a,b,delta,'temp.txt');
end

