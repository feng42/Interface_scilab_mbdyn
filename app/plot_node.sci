function [xout,zout]=plot_node(filename,label)
    M = fscanfMat(filename) ;
    sizeM = size(M)
    len = sizeM(1);
    items = sizeM(2);
    nodes = unique(M(:,1));
    num_nodes = size(nodes);
    num_uniq_nodes = num_nodes(1);
    xout = zeros(1,len/num_uniq_nodes);
    zout = zeros(1,len/num_uniq_nodes);
    for i=0:(len/num_uniq_nodes - 1)
        xout(1,i+1) = M(i*num_uniq_nodes + label, 2);
        zout(1,i+1) = M(i*num_uniq_nodes + label, 4);
    end
endfunction
