function outputs = func_outputs_par(inputs,ratio,A,A_q,d,coord_list,query_mask_list,qtotal,ports)
% parallel version of func_outputs

if ismatrix(inputs)
    inputs=reshape(inputs,1,size(inputs,1),size(inputs,2));
end
import com.comsol.model.util.*

iter=size(inputs,1);
inputs=reshape(inputs,iter,[]);
N=size(inputs,2);

%%%%%%%%%% get the string for interpolation 
expr_chars=[];
for i=1:N
    xi=coord_list(i,1);
    yi=coord_list(i,2);
    expr_chars=[expr_chars,sprintf('w%d*exp(-((x-%.10f)^2+(y-%.10f)^2)/d^2)+',i,xi,yi)];
end
expr_chars=[expr_chars,sprintf('w%d+w%d*x+w%d*y',N+1,N+2,N+3)];
%%%%%%%%%

outputs=zeros(iter,1);


n_worker=numel(ports);
parpool(n_worker);

% load modle file to workers
spmd
    mphstart(ports(labindex));
    warning('off','all');
end

parfor i=1:iter
    model = mphload('heat.mph');
    model.disableUpdates(true);
    
    model.param.set('qtotal', qtotal);
    model.param.set('d', d);
    model.component('comp1').func('an1').set('expr', expr_chars);

    % enforce volume constraint
    b=[inputs(i,:)';zeros(3,1)];
    
    coef=A\b;
    z=A_q*coef;
    [prob,rho]=ecdf(z,"frequency",query_mask_list);
    thres=interp1(prob,rho,1-ratio);
    model.param.set('thres', thres);
    
    % avoid cheating, default 0.02 transition region. If more
    % than 5% are in the region, change transition
    allowed_percent=5;
    thres_upper=interp1(prob,rho,1-ratio+allowed_percent/200);
    thres_lower=interp1(prob,rho,1-ratio-allowed_percent/200);
    transition=abs(thres_upper-thres_lower);

    if transition < 0.02
        model.param.set('transition', transition);
    end
    
    % compute
    for j=1:N+3
        model.param.set(['w',num2str(j)], coef(j));
    end
    try
        model.sol('sol1').runAll;
        times=mphglobal(model,{'t_total'},'dataset','dset1');
        flows=mphglobal(model,{'q_total'},'dataset','dset1');
        if flows(end)<qtotal
            model.sol('sol2').runAll;
            times=mphglobal(model,{'t_total'},'dataset','dset2');
        end
        outputs(i)=times(end);
    catch
        disp([num2str(i),': calculation failed'])
    end

end
outputs=1./outputs;


delete(gcp("nocreate"))
end
