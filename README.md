# Interface_scilab_mbdyn
A interface from scilab simulink to mbdyn input
//The prgeramm will generate .mbd file as input file of mbdyn
Now it can process a PID simulation in Scilab environment, using MBDyn as its calculation core.

## USAGE
//$ scilab -f doubleSwingW.sce
//$ mbdyn -f double_swing.mbd

scilab -f doubleSwing_pid.sce
//new /out directory and generate .mbd file in it
//MBDyn will be used in each simulation step

## TODO
//app/mov_read.sci
//app/jnt_read.sci
something go wrong during state-updating
