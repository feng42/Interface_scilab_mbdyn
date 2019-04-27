function refs=ref_update_2s(node_stat)
    d2r = 3.1416 / 180
    refs = zeros(2,12);
    //refs(1,5) = node_stat(2,6) * d2r;
    //refs(1,11) = node_stat(2,12);
    //refs(2,1) = const_val(1,2);
    //refs(2,5) = [node_stat(3,6) - node_stat(2,6)] * d2r;
    //refs(2,11) = node_stat(3,12) - node_stat(2,12);
    x1 = node_stat(2,2);
    z1 = node_stat(2,4);
    theta1 = -atan(z1,x1);
    x2 = node_stat(3,2) - x1 * 2;
    z2 = node_stat(3,4) - z1 * 2;
    theta2 = -atan(z2,x2);
    refs(1,5) = theta1;
    refs(1,11) = node_stat(2,12);
    refs(2,1) = 1.000000;
    refs(2,5) = theta2;
    refs(2,11) = node_stat(3,12) - node_stat(2,12);
    
    
endfunction
