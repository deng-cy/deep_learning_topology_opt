function inputs = func_inputs_gen(n,seed_gen,base,nx,ny,p,inputs_ori,n_coeff)
% generate new inputs (samples) by three ways based on args
% 1) if `base` is empty, meaning the inital step, then 161 arrays will be
% generated
% 2) if `base` is not empty, `p` is empty, employ SOLO-G, return base
% 3) if `base` is not empty, `p` is not empty, employ SOLO-R, add disturbance

% Inputs:
%   iter: number of total samples that needs to output
%   base: base design, i.e., the optimized solution from DNN in SOLO
%   p: empty or [a1,a2,a3,...,an] where `ai` (i<n) denotes the probability to mutate a ixi matrix, and `an` denotes convolution possbility
%   inputs_ori: existing samples, used to remove repeated ones of new samples  
%   n_coeff: a coefficient to generate more samples than needed. Since repeated samples will be deleted later, more samples are needed at the generation stage
rng(seed_gen);
base_empty=isempty(base);
alpha=4;

if ~exist('n_coeff','var')
    n_coeff=100; % set a default value, used when p exist
end


if base_empty %initial loop
    % one filled
    inputs_1=zeros(nx*ny,nx,ny);
    for j=1:nx*ny
        inputs_1(j,j)=1;
    end
    % now we have nx*ny+1 samples
    
    % more filled
    n_more=n-nx*ny-1;
    
    if n_more>0
        inputs=zeros(n_more,nx,ny);

        for j=1:n_more
            p_thres=rand^alpha;
            y=rand(nx,ny);
            inputs(j,:,:)=(y<p_thres)*1;
        end

        inputs=[inputs_1;zeros(1,nx,ny);inputs];
    else
        inputs=[inputs_1;zeros(1,nx,ny)];
    end
elseif exist('p','var') % random generation based on p
    inputs=zeros(n*n_coeff,nx,ny);
    n_base=size(base,1);
    inputs(1:n_base,:,:)=base;
    for j =n_base+1:n*n_coeff
        z=squeeze(base(1,:,:));
        p_random=rand;
        mask_change=zeros(nx,ny);
        if p_random<=sum(p(1:end-1),'all') % mutation
            for k=1:numel(p)-1
                if p_random<=sum(p(1:k),'all')
                    id_x=unidrnd(nx-k+1);
                    id_y=unidrnd(ny-k+1);
                    mask_change(id_x:id_x+k-1,id_y:id_y+k-1)=1;
                    break;
                end
            end
        elseif p_random<=sum(p,'all') % crossover
            idx=randperm(nx*ny,unidrnd(nx*ny));
            z(idx)=z(sort(idx));  

        else
            mask_change(:)=1;
        end
        y=rand(nx,ny);
        if rand<0.5
        thres=mean(base,'all'); % mean of the matrix
        else
        thres=rand^alpha;
        end
        y(y<=thres)=0;
        y(y>thres)=1;
        z(mask_change==1)=y(mask_change==1);
        inputs(j,:,:)=z;
    end
    % remove repeated inputs
    inputs_cmb=[inputs_ori;inputs];
    inputs_cmb_uniq=reshape(unique(reshape(inputs_cmb,[],nx*ny),'row','stable'),[],nx,ny);
    inputs=inputs_cmb_uniq(size(inputs_ori,1)+1:size(inputs_ori,1)+n,:,:);
else % keep the base as the inputs
    inputs=base;
end
end

