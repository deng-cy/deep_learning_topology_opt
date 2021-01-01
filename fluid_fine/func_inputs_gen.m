function inputs = func_inputs_gen(n,seed_gen,base,nx,ny)

rng(seed_gen);
base_empty=isempty(base);

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
            p_thres=rand^2/5;
            y=rand(nx,ny);
            inputs(j,:,:)=(y<p_thres)*1;
        end
        
        inputs=[inputs_1;zeros(1,nx,ny);inputs];
    else
        inputs=[inputs_1;zeros(1,nx,ny)];
    end
else % keep the base as the inputs
    inputs=base;
end
inputs=reshape(unique(reshape(inputs,[],nx*ny),'row'),[],nx,ny);
end

