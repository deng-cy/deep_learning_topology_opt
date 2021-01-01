function out = func_best_min(in)
%Return the observed minimum in a sequence
%in: n*1 array
%out: a n*1 array
%example: in=[1,0,1,0,-1,0],out=[1,0,0,0,-1,-1]
n=numel(in);
out=zeros(n,1);
out(1)=in(1);
for i=2:n
    out(i)=min(in(i),out(i-1));
end
end

