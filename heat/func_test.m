function [prediction,outputs,base] = func_test(ratio,A,A_q,d,coord_list,query_mask_list,qtotal,optfile)
optdata=load(optfile);
prediction=optdata.prediction;
base=optdata.base;
outputs=func_outputs(base,ratio,A,A_q,d,coord_list,query_mask_list,qtotal);
end

