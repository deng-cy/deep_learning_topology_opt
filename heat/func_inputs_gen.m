function inputs = func_inputs_gen(iter,nx,ny,seed_gen,base,p)
% generate input samples
% it has two behaviors dependent on `base`: if `base` is empty, it means
% initial batch, pure random data is generated; if `base` is non-empty, it
% means second batch or afterwards, then disturbance is added to `base` to
% generate new data
% Inputs:
%   iter: number of total samples that needs to output
%   base: base design, also the optimized solution from DNN in SOLO
%   p: [a1,a2,a3,...,an] where `ai` (i<n) denotes the probability to mutate a ixi matrix, and `an` denotes convolution possbility
rng(seed_gen);
base_empty=isempty(base);
if base_empty
    i=1;
else
    inputs(1,:,:)=base;
    i=2;
end



while i<=iter
    
    if base_empty
        % initial batch, generate random samples
        z=rand(nx,ny);
        
    else
        % second batch or afterwards, add disturbance to `base`
        z=squeeze(base);
        p_random=rand;
        if p_random<=sum(p(1:end-1),'all') % mutation
            mask_change=zeros(nx,ny);
            for k=1:numel(p)-1
                if p_random<=sum(p(1:k),'all')
                    id_x=unidrnd(nx-k+1);
                    id_y=unidrnd(ny-k+1);
                    mask_change(id_x:id_x+k-1,id_y:id_y+k-1)=1;
                    break;
                end
            end
            y=rand(nx,ny);
            z(mask_change==1)=y(mask_change==1);
        elseif p_random<=sum(p,'all') % convolution
            y=conv2(z,rand(2,2),'same');
            p_random_2=rand;
            mask_conv=ones(nx,ny);
            for k=1:numel(p)-1
                if p_random_2<=sum(p(1:k),'all')
                    id_x=unidrnd(nx-k);
                    id_y=unidrnd(ny-k);
                    mask_conv(id_x:id_x+k,id_y:id_y+k)=1;
                    break;
                end
            end
            z(mask_conv==1)=y(mask_conv==1);
        else
            z=rand(nx,ny);
        end
        
    end
    inputs(i,:,:)=z;
    i=i+1;
end

end