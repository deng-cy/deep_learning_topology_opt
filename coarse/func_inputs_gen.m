function inputs = func_inputs_gen(iter,ratio,mask,seed_gen,base,p)

rng(seed_gen);
base_exist=~isempty(base);
if base_exist
    inputs(1,:,:)=base;
    i=2;
else
    i=1;
end


[nx,ny]=size(mask);


while i<=iter
%  generating random input
%     z=rand(nx,ny);
%     z1=z>=ratio;
%     z(z<ratio)=1;
%     z(z1)=0;
if ~base_exist
y=rand(nx,ny);
temp=sum(y.*mask,'all');
z=y/temp*ratio;
    if max(z,[],'all')>1
        continue;
    end
    
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
    temp=sum(z.*mask,'all');
    z=z/temp*ratio;
    surplus=sum((z(z>1)-1).*mask(z>1),'all');
    z(z>1)=1;
    while surplus>0
        index=unidrnd(nx*ny);
        z_delta=(1-z(index))*rand;
        z(index)=z(index)+min(z_delta,surplus/mask(index));
        surplus=surplus-z_delta*mask(index);
    end
end
    inputs(i,:,:)=z;
    i=i+1;
end

end

