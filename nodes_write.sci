mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [NODES BLOCK]');
mfprintf(fid,'\n');

mfprintf(fid,'%s\n','begin: nodes;');
mfprintf(fid,'\n');

sizeNodes=size(nodes);
row=sizeNodes(1,1);
col=sizeNodes(1,2);


for i=1:row
    nl='Node_Link'+string(i);
    mfprintf(fid,'%s%s','structural:',nl);
    tmp=joints(i,1).entries
    if tmp=='clamp' then
        mfprintf(fid,'%s\n',', static,');
        nl='Ref_Link'+string(i);
    else
        mfprintf(fid,'%s\n',', dynamic,');
        nl='Ref_Link'+string(i-1);
    end
    //nl='Ref_Link'+string(i);
    
    
    for j=1:col
        
        mfprintf(fid,'%s%s%s','reference,',nl,',');
        if j==2 then
            s='matr,';
        else
            s='';
        end
        tmp=nodes(i,j).entries;
        sizeT=size(tmp);
        rowT=sizeT(1,1);
        colT=sizeT(1,2);
        for m=1:rowT
            for n=1:colT
                if m==rowT & n==colT & j==col then
                    s=s+string(tmp(m,n))+';';
                else
                    s=s+string(tmp(m,n))+',';
                end
            end
        end
        
        mfprintf(fid,'%s',s);
        mfprintf(fid,'\n');
    end
    mfprintf(fid,'\n');
    
end

mfprintf(fid,'\n');
mfprintf(fid,'%s\n','end: nodes;');
mfprintf(fid,'\n');



