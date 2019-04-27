//one-turn test
clc;
clear;

rootpath = "/home/feng/zhangfeng3/Interface_scilab_mbdyn/";
mbd_outfile = "out/double_swing_test_singleton.mbd";
mov_outfile = "out/double_swing_test_singleton.mov";

exec("model/init_2s.sci", -1);
[time_cfg, const_val, ref_mat, nodes, bodies, joints] = init_2s();
exec("model/double_swing.sci", -1);
status = double_swing(rootpath, mbd_outfile);

exec("app/mov_read.sci",-1);
proc = unix_s("mbdyn -f '+rootpath+mbd_outfile);
node_stat = mov_read(rootpath+mov_outfile);
