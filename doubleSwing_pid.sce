//doubleSwing_pid
clc;
clear;
rootpath = "/home/feng/zhangfeng3/Interface_scilab_mbdyn/";
mbd_outfile = "out/double_swing_test.mbd";
mov_outfile = "out/double_swing_test.mov";

// miission init
Tf = 100;
//init = [0,30]
pi = 3.1415926

target = [-pi/2,0];
_pre_error0 = [-pi/2,-pi/3];
_integral0 = [0,0];
pre_stat = [_pre_error0; _integral0];

//pid status
pid_cfg = [1,80,-80,0.2,0.01,0.3];
K = 0.001;

//dynamic init
exec("model/init_2s.sci", -1);
[time_cfg, const_val, ref_mat, nodes, bodies, joints] = init_2s();
exec("model/double_swing.sci", -1);
status = double_swing(rootpath, mbd_outfile);



//set column
dt = 1;
t = 1:dt:Tf;
tspan = size(t);
cols = tspan(1,2);
xout = zeros(2,cols);
zout = zeros(2,cols);
ang = zeros(2,cols);

exec("app/mov_read.sci",-1);
exec('app/pid_calculate.sci',-1);
exec("model/ref_update_2s.sci",-1);
u_last = [-0.01 * pi, 0.005 * pi]

//loop simulation
for i =1:dt:Tf
    //calc status
    proc = unix_s("mbdyn -f '+rootpath+mbd_outfile);
    
    node_stat = mov_read(rootpath+mov_outfile);
    
    xout(1,i) = node_stat(2,2);
    zout(1,i) = node_stat(2,4);
    xout(2,i) = node_stat(3,2);
    zout(2,i) = node_stat(3,4);
    
    
    ref_mat = ref_update_2s(node_stat);
    cur = [ref_mat(1,5), ref_mat(2,5)];
    ang(1,i) = cur(1,1);
    ang(2,i) = cur(1,2);
    //chosse data
    
    [u,pre_stat] = pid_calculate(pid_cfg, pre_stat,cur,target);
    //u_last = u;
    //set omega
    joints(2,3).entries = u(1,1);
    joints(3,3).entries = u(1,2);
    
    status = double_swing(rootpath, mbd_outfile);
end

// pic
subplot(2,1,1);
plot(t,ang);
subplot(2,1,2);
param3d1([xout(1,:)',xout(2,:)'], [zout(1,:)',zout(2,:)'], list([t',t'],[2,5]));
//param3d(xout(1,:),zout(1,:),t);
//param3d(xout(2,:),zout(2,:),t);
