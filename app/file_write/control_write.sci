mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [CONTROL BLOCK]');
mfprintf(fid,'\n');
mfprintf(fid,'%s\n','begin: control data;');
mfprintf(fid,'\n');

sizeNodes=size(nodes);
mfprintf(fid,'%s%d%s\n','structural nodes: ',sizeNodes(1,1),';');

sizeBodies=size(bodies);
mfprintf(fid,'%s%d%s\n','rigid bodies: ',sizeBodies(1,1),';');

sizeJoints=size(joints);
mfprintf(fid,'%s%d%s\n','joints: ',sizeJoints(1,1),';');

//mfprintf(fid,'%s\n','gravity;');

mfprintf(fid,'\n');
mfprintf(fid,'%s\n','end: control data;');
mfprintf(fid,'\n');
