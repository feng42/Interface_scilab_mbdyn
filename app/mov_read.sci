clear;
//close all;
//THIS PART SHOULD BE INITIALIZED BEFORE USED
//out_path = "/home/feng/zhangfeng3/mbd_out/" ;
out_path = "/home/feng/zhangfeng3/Interface_scilab_mbdyn/out/" ;
file_name = "double_swing" ;
//node_len = 3

M = fscanfMat(out_path + file_name + ".mov") ;
sizeM = size(M)
len = sizeM(1);
items = sizeM(2);
nodes = unique(M(:,1));
num_nodes = size(nodes);
num_uniq_nodes = num_nodes(1)
x = zeros(len/num_uniq_nodes, num_uniq_nodes);
y = zeros(len/num_uniq_nodes, num_uniq_nodes);
z = zeros(len/num_uniq_nodes, num_uniq_nodes);
vx = zeros(len/num_uniq_nodes, num_uniq_nodes);
vy = zeros(len/num_uniq_nodes, num_uniq_nodes);
vz = zeros(len/num_uniq_nodes, num_uniq_nodes);

for i=0:(len/num_uniq_nodes - 1)
    for j= 1:num_uniq_nodes
        x(i+1,j) = M(3*i+j, 2)
        y(i+1,j) = M(3*i+j, 3)
        z(i+1,j) = M(3*i+j, 4)
        vx(i+1,j) = M(3*i+j, 8)
        vy(i+1,j) = M(3*i+j, 9)
        vz(i+1,j) = M(3*i+j, 10)
    end
    
end

//[Label,Data] = NODELoad(out_path))
