function nodes_stat=mov_read(filename)
//out_path = "/home/feng/zhangfeng3/Interface_scilab_mbdyn/out/" ;
//file_name = "double_swing" ;
//node_len = 3
    M = fscanfMat(filename) ;
    sizeM = size(M)
    len = sizeM(1);
    items = sizeM(2);
    nodes = unique(M(:,1));
    num_nodes = size(nodes);
    num_uniq_nodes = num_nodes(1);
    
    //x = zeros(len/num_uniq_nodes, num_uniq_nodes);
    //y = zeros(len/num_uniq_nodes, num_uniq_nodes);
    //z = zeros(len/num_uniq_nodes, num_uniq_nodes);
    //vx = zeros(len/num_uniq_nodes, num_uniq_nodes);
    //vy = zeros(len/num_uniq_nodes, num_uniq_nodes);
    //vz = zeros(len/num_uniq_nodes, num_uniq_nodes);

    //for i=0:(len/num_uniq_nodes - 1)
     //   for j= 1:num_uniq_nodes
    //        x(i+1,j) = M(3*i+j, 2);
    //        y(i+1,j) = M(3*i+j, 3);
    //        z(i+1,j) = M(3*i+j, 4);
    //        vx(i+1,j) = M(3*i+j, 8);
    //        vy(i+1,j) = M(3*i+j, 9);
    //        vz(i+1,j) = M(3*i+j, 10);
    //    end
    //
    //end
    
    nodes_stat = zeros(num_uniq_nodes, items);
    last = len/num_uniq_nodes;
    for j=1:num_uniq_nodes
        for k=1:items
        //nodes_stat(j,1) = M(num_uniq_nodes*(last-1)+j,2);
        //nodes_stat(j,2) = M(num_uniq_nodes*(last-1)+j,3);
        //nodes_stat(j,3) = M(num_uniq_nodes*(last-1)+j,4);
        //nodes_stat(j,4) = M(num_uniq_nodes*(last-1)+j,8);
        //nodes_stat(j,5) = M(num_uniq_nodes*(last-1)+j,9);
        //nodes_stat(j,6) = M(num_uniq_nodes*(last-1)+j,10);
            nodes_stat(j,k) = M(num_uniq_nodes*(last-1)+j,k);
        end
    end
//[Label,Data] = NODELoad(out_path))

endfunction

