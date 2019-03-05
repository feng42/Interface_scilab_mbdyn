mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [REF BLOCK]');
mfprintf(fid,'\n');


sizeRef=size(refMatrix);
row=sizeRef(1,1);
col=sizeRef(1,2);
for i=1:row
    link='Ref_Link'+string(i);
    mfprintf(fid,'%s%s%s\n','reference: ',link,',');
    for k=0:(col/3-1) 
        if i>=2 then
            link='Ref_Link'+string(i-1);
            mfprintf(fid,'%s%s%s','reference, ',link,',');
        end
        if k==1 then
            mfprintf(fid,'%s','euler,');
        end
        for j=1:3
            if j==3 then
                if k==(col/3-1) then
                    mfprintf(fid,'%f%s',refMatrix(i,k*3+j),';');
                else
                    mfprintf(fid,'%f%s',refMatrix(i,k*3+j),',');
                end
            else
                mfprintf(fid,'%f%s',refMatrix(i,k*3+j),',');
            end
        end
        mfprintf(fid,'\n');
        
    end
    mfprintf(fid,'\n');

end


mfprintf(fid,'\n');
