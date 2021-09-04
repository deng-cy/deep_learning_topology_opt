function inputs = func_inputs_gen(iter,nx,ny,seed_gen,base,p)
% generate input samples
% it has two behaviors dependent on `base`
% Inputs:
%   p   : [a1,a2,a3,...,an] where `ai` (i<n) denotes the probability to mutate a ixi matrix, and `an` denotes crossover possbility
rng(seed_gen);
base_empty=isempty(base);
if base_empty
    i=1;
else
    inputs(1,:,:)=base;
    i=2;
end



while i<=iter
%  generating random input
%     z=rand(nx,ny);
%     z1=z>=ratio;
%     z(z<ratio)=1;
%     z(z1)=0;
if base_empty
z=rand(nx,ny);
    
else
    z=squeeze(base);
    p_random=rand;
    mask_change=zeros(nx,ny);
    if p_random<=sum(p(1:end-1),'all')
        for k=1:numel(p)-1
            if p_random<=sum(p(1:k),'all')
                id_x=unidrnd(nx-k+1);
                id_y=unidrnd(ny-k+1);
                mask_change(id_x:id_x+k-1,id_y:id_y+k-1)=1;
                break;
            end
        end
    elseif p_random<=sum(p,'all')
        idx=randperm(nx*ny,unidrnd(nx*ny));
        z(idx)=z(sort(idx));  

    else
        mask_change(:)=1;
    end
    y=rand(nx,ny);
    z(mask_change==1)=y(mask_change==1);
    
end
    inputs(i,:,:)=z;
    i=i+1;
end

end