function outputs = func_outputs(inputs,a,b,delta,filename,draw)
%write inputs
dlmwrite(filename,'%grid','delimiter','','newline','pc')    
dlmwrite(filename,0:delta:a,'-append','newline','pc')
dlmwrite(filename,0:delta:b,'-append','newline','pc')
fhw=fopen(filename,'a');
iter=size(inputs,1);
for i=1:iter
   fprintf(fhw,'%%data\r\n');
    fprintf(fhw,'');
    z=inputs(i,:,:);
    for ii=1:numel(z)
        fprintf(fhw,'%6.5f,',z(ii));
    end
    fprintf(fhw,'\r\n');
  
end
fclose(fhw);

% run comsol file

outputs=zeros(iter,1);
model = mphload('force.mph');
model.disableUpdates(true);
model.param.set('delta', delta);
model.component('comp1').func('int1').set('filename', filename);
model.component('comp1').func('int1').set('importedstruct', 'Grid');
model.func('int1').importData()
for i=1:iter
    model.component('comp1').func('int1').setIndex('funcs', i, 0, 1); 
    model.sol('sol1').runAll;
    energy=mphglobal(model,{'solid.Ws_tot'});
    outputs(i)=energy;
end

outputs=1./outputs;
try
if draw==1
    mphplot(model,'pg1')
    axis off; title('')
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
end
end
end
