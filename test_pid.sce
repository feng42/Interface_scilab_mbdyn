//pid_test

clear;clc;
T = 60;

Tf = 10000;
target = 90;
_pre_error0 = 90;
_integral0 = 0;

dt = 0.1;
_max = 20;
_min = -20;
Kp = 0.1;
Ki = 0.01;
Kd = 0.3;

omg = 0;
bet = 0;
ang = 0;
pre_stat = [_pre_error0, _integral0]

pid_cfg = [dt,_max,_min,Kp,Ki,Kd];
K = 0.1;


t = 0:dt:Tf;
tspan = size(t);
cols = tspan(1,2);
theta = zeros(1,cols);
yout = zeros(1,cols);

exec('app/pid_calculate.sci',-1)
for i =0:dt:Tf
    ang = omg * dt + 0.5 * bet * (dt^2);
    theta(1,i+1) = ang;
    omg = omg + bet * dt;
    [u,pre_stat] = pid_calculate(pid_cfg, pre_stat,ang,target);
    bet = K * u;
    yout(1,i+1) = u; 
end
plot(t,theta);

