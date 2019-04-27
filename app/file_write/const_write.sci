mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [CONST BLOCK]');
mfprintf(fid,'\n');

//Design Varibles
mfprintf(fid,'%s%d%s\n','set: real M = ',const_val(1,1),'.;');//Mass of Link1 and Link2
mfprintf(fid,'%s%d%s\n','set: real L = ',const_val(1,2),'.;');//Length of Link1 and Link2
//mfprintf(fid,'%s%f%s\n','set: real thete1 = ',const_val(1,3),';');//Initial angle of Link1 w.r.t vertical line
//mfprintf(fid,'%s%f%s\n','set: real thete2 = ',const_val(1,4),';');//Initial angle of Link2 w.r.t Link1

//Reference Labels
sizeRef=size(ref_mat);
rowR=sizeRef(1,1);
for i=1:rowR
    link='Ref_Link'+string(i);
    mfprintf(fid,'%s%s%s%d%s\n','set: integer ',link,' = ',i,';');
end

sizeNodes=size(nodes);
rowN=sizeNodes(1,1);
//Node Labels
for i=1:rowN
    link='Node_Link'+string(i);
    mfprintf(fid,'%s%s%s%d%s\n','set: integer ',link,' = ',i,';');
end

sizeBodies=size(bodies);
rowB=sizeBodies(1,1);
//Body Labels
for i=1:rowB
    link='Body_Link'+string(i);
    mfprintf(fid,'%s%s%s%d%s\n','set: integer ',link,' = ',i,';');
end

sizeJoints=size(joints);
rowJ=sizeJoints(1,1);
//Joint Labels
//link='Jo'
for i=1:rowJ
    if i==1 then
        jl='Jo'+'_Link'+string(i);
    else
        jl='Jo'+'_Link'+string(i-1)+'_Link'+string(i);
    end
    //link=link+'_Link'+string(i);
    mfprintf(fid,'%s%s%s%d%s\n','set: integer ',jl,' = ',i,';');
end



mfprintf(fid,'\n');
