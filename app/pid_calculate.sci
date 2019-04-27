function [yout,last] = pid_calculate(pid_cfg, pre, cur, trg)//,u_last)
    _dt = pid_cfg(1);
    _max = pid_cfg(2);
    _min = pid_cfg(3);
    _Kp = pid_cfg(4);
    _Ki = pid_cfg(5);
    _Kd = pid_cfg(6);
    _pre_error = pre(1,:);
    _integral = pre(2,:);
    size(_integral)
    
    input_size = size(trg);
    nums = input_size(1,2);
    _error = zeros(1,nums);
    yout = zeros(1,nums);
    
    for j = 1:nums
        _error(1,j) = trg(1,j);
        Pout = _Kp * _error(1,j);
        _integral(1,j) = _integral(1,j) + _error(1,j) * _dt;
        Iout = _Ki * _integral(1,j);
        derivate = (_error(1,j) - _pre_error(1,j)) / _dt;
        Dout = _Kd * derivate;
    
        out = Pout + Iout + Dout;
    
        if out>_max then
            out = _max;
        elseif out<_min then
            out = _min;
        end
        //if out==0.000000 then
        //    if u_last(1,nums)>0 then
        //        out = -0.000001
        //    else
        //        out = 0.000001
        //    end
        //end
        yout(1,j) = out;
    end
    
    //_error = trg - cur;
    
    //Pout = _Kp * _error;
    //_integral = _integral + _error * _dt;
    //Iout = _Ki * _integral;
    //derivate = (_error - _pre_error) / _dt;
    //Dout = _Kd * derivate;
    
    //out = Pout + Iout + Dout;
    
    //if out>_max then
    //    out = _max;
    //elseif out<_min then
    //    out = _min;
    //end
    //yout = out;
    last = [_error;_integral];
endfunction
