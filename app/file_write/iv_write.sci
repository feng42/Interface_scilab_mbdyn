mfprintf(fid,'%s\n','#--------------------------');
mfprintf(fid,'%s\n','# [PROBLEM BLOCK]');
mfprintf(fid,'\n');
mfprintf(fid,'%s\n','begin: initial value;');
mfprintf(fid,'\n');
mfprintf(fid,'%s%f%s\n','initial time:',time_cfg(1,1),';');
mfprintf(fid,'%s%f%s\n','final time:',time_cfg(2,1),';');
mfprintf(fid,'%s%f%s\n','time step:',time_cfg(3,1),';');
mfprintf(fid,'%s%f%s\n','max iterations:',time_cfg(4,1),';');
mfprintf(fid,'%s%f%s\n','tolerance:',time_cfg(5,1),';');
mfprintf(fid,'%s\n','output: iterations;');
mfprintf(fid,'%s\n','output: residual;');
mfprintf(fid,'\n');
mfprintf(fid,'%s\n','end: initial value;');

mfprintf(fid,'\n');
