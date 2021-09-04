function [output, grad] = func_outputs_withgrad_par(input,nx,ny,ratio,A,A_q,d,coord_list,query_mask_list,qtotal,ports)
% calculate outputs F with gradient w.r.t. design variables, with parallel
% computing
assert(ismatrix(input) && size(input,2)==1);
N=nx*ny;
inputs=repmat(reshape(input,1,[]),N+1,1);
step=1e-4;
for i=1:N
    inputs(i+1,i)=inputs(i+1,i)+step;
end
outputs = func_outputs_par(reshape(inputs,N+1,nx,ny),ratio,A,A_q,d,coord_list,query_mask_list,qtotal,ports);
output=-outputs(1);
grad=zeros(N,1);
for i=1:N
grad(i)=(outputs(i+1)-outputs(1))/step;
end
grad=-grad;

filename='data_direct.mat'; % save inputs and outputs data
input_save=input;
output_save=output;
if isfile(filename)
   data=load(filename);
   input_save=[data.input_save,input_save];
   output_save=[data.output_save,output_save];
end
   save(filename,'input_save','output_save');
end