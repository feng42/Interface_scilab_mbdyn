mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [ELEMENTS BLOCK]');
mfprintf(fid,'\n');
mfprintf(fid,'%s\n','begin: elements;');
mfprintf(fid,'\n');

//body
sizeB=size(bodies);
row=sizeB(1,1);
col=sizeB(1,2);

for i=1:row
    lb='Body_Link'+string(i);
    ln='Node_Link'+string(i+1);
    mfprintf(fid,'%s%s%s%s%s\n','body:',lb,',',ln,',');
    mfprintf(fid,'%f%s\n',M,',');//mass
        
    s='';
    for j=1:col
        
        if j==4 then
            s=s+'diag,';
        end
        if j==col then
            s=s+string(bodies(i,j))+';';
        else
            s=s+string(bodies(i,j))+',';
        end
    end
    mfprintf(fid,'%s\n',s);
    
    mfprintf(fid,'\n');
    
end


//joint
sizeJ=size(joints);
row=sizeJ(1,1);
col=sizeB(1,2);
jl='Jo';
for i=1:row
    //jl=jl+'_Link'+string(i);
    if i==1 then
        jl='Jo'+'_Link'+string(i);
    else
        jl='Jo'+'_Link'+string(i-1)+'_Link'+string(i);
    end
    mfprintf(fid,'%s%s%s\n','joint:',jl,',');//joint name
    joint_class=joints(i,1).entries;
    ori=joints(i,2).entries;
    ang_v=joints(i,3).entries;
    sizeO=size(ori);
    rowO=sizeO(1,1);
    colO=sizeO(1,2);
    if joint_class=='clamp' then
        //clamp,\n
        mfprintf(fid,'%s%s\n',joint_class,',');
        //Node_Link1,\n
        ln='Node_Link'+string(i);
        mfprintf(fid,'%s%s\n',ln,',');
        
        for j=1:rowO
            //reference, Ref_Link1, null,\n
            lr='Ref_Link'+string(i);
            //pos:null\n
            mfprintf(fid,'%s\n','null,');
            //orientation:eye\n
            mfprintf(fid,'%s\n','eye;');
            
        
            
        end
    elseif joint_class=='revolute pin' then
        //revolute pin,\n
        mfprintf(fid,'%s%s\n',joint_class,',');
        //Node_Link1,\n
        ln='Node_Link'+string(i);
        mfprintf(fid,'%s%s\n',ln,',');
        
        for j=1:rowO
            //reference, Ref_Link1, null,\n
            lr='Ref_Link'+string(i);
            mfprintf(fid,'%s%s%s\n','reference,',lr,',null,');
            //hinge, reference, Ref_Link1
            mfprintf(fid,'%s%s%s','hinge, reference,',lr,',1,');
            //orientation\n
        
            s="";
            for k=1:colO
                if j==rowO & k==colO then
                    s=s+string(ori(j,k))+';';
                else
                    s=s+string(ori(j,k))+',';
                end
            end
            mfprintf(fid,'%s\n',s);
        end
    elseif joint_class=='revolute hinge' then
        //revolute pin,\n
        mfprintf(fid,'%s%s\n',joint_class,',');
        for j=1:rowO
            //Node_Link1,\n
            ln='Node_Link'+string(i+j-rowO);
            mfprintf(fid,'%s%s\n',ln,',');
            //reference, Ref_Link1, null,\n
            lr='Ref_Link'+string(i);
            mfprintf(fid,'%s%s%s\n','reference,',lr,',null,');
            //hinge, reference, Ref_Link1
            mfprintf(fid,'%s%s%s','hinge, reference,',lr,',1,');
            //orientation\n
        
            s="";
            for k=1:colO
                if j==rowO & k==colO then
                    s=s+string(ori(j,k))+'.;';
                else
                    s=s+string(ori(j,k))+'.,';
                end
            end
            mfprintf(fid,'%s\n',s);
        end
        
    elseif joint_class=='axial rotation' then
        //revolute pin,\n
        mfprintf(fid,'%s%s\n',joint_class,',');
        for j=1:rowO
            //Node_Link1,\n
            ln='Node_Link'+string(i+j-rowO);
            mfprintf(fid,'%s%s\n',ln,',');
            //reference, Ref_Link1, null,\n
            lr='Ref_Link'+string(i-1);
            mfprintf(fid,'%s%s%s\n','reference,',lr,',null,');
            //hinge, reference, Ref_Link1
            mfprintf(fid,'%s%s%s','hinge, reference,',lr,',1,');
            //orientation\n
        
            s="";
            for k=1:colO
                s=s+string(ori(j,k))+'.,';
                //if j==rowO & k==colO then
                    //s=s+string(ori(j,k))+'.;';
                //else
                    //s=s+string(ori(j,k))+'.,';
                //end
            end
            mfprintf(fid,'%s\n',s);
            
        end
        mfprintf(fid,'%s%f%s\n','ramp,',ang_v,',0.,1.,0.;');
        
    end
    mfprintf(fid,'\n');
    
end



mfprintf(fid,'%s\n','gravity: 0., 0., -1., const, 9.81;');
mfprintf(fid,'\n');
mfprintf(fid,'%s\n','end: elements;');
