function [yout,last] = pid_calculate(pid_cfg, pre, cur, trg)
    _dt = pid_cfg(1);
    _max = pid_cfg(2);
    _min = pid_cfg(3);
    _Kp = pid_cfg(4);
    _Ki = pid_cfg(5);
    _Kd = pid_cfg(6);
    _pre_error = pre(1);
    _integral = pre(2);
    
    _error = cur - trg;
    
    Pout = _Kp * _error;
    _integral = _integral + _error * _dt;
    Iout = _Ki * _integral;
    derivate = (_error - _pre_error) / _dt;
    Dout = _Kd * derivate;
    
    out = Pout + Iout + Dout;
    
    if out>_max then
        out = _max;
    elseif out<_min then
        out = _min;
    end
    yout = out;
    last = [_error, _integral];
endfunction
