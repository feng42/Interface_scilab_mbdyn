function [time_cfg, const_val, ref_mat, nodes, bodies, joints]=init_2s()
    time_cfg=[0;1;0.001;10;0.000001];
    M=1;
    L=1;
    pi=3.1415;
    thete1=double(0) ;
    thete2=double(-(pi)/6) ;
    const_val = [M,L,thete1,thete2];
    //referrence data
    nullMatrix=[0,0,0;0,0,0;0,0,0];
    ref_mat=[0,0,0,0,thete1,0,0,0,0,0,0,0;
            1,0,0,0,thete2,0,0,0,0,0,0,0];

    //node data
    nodes=cell(3,4);
    nodes(1,1).entries=[0,0,0];
    nodes(1,2).entries=eye(3,3);
    nodes(1,3).entries=[0,0,0];
    nodes(1,4).entries=[0,0,0];
    nodes(2,1).entries=[0.5*L,0,0];
    nodes(2,2).entries=eye(3,3);
    nodes(2,3).entries=[0,0,0];
    nodes(2,4).entries=[0,0,0];
    nodes(3,1).entries=[0.5*L,0,0];
    nodes(3,2).entries=eye(3,3);
    nodes(3,3).entries=[0,0,0];
    nodes(3,4).entries=[0,0,0];

    //body data
    bodies=[0,0,0,0,M*L^2/12,M*L^2/12;0,0,0,0,M*L^2/12,M*L^2/12];

    //joint data
    clp1=[1,0,0,3,0,1,0];
    axi1=[1,0,0,3,0,1,0; 1,0,0,3,0,1,0];
    axi2=[1,0,0,3,0,1,0; 1,0,0,3,0,1,0];
    joints=cell(3,3);
    joints(1,1).entries='clamp';
    joints(1,2).entries=clp1;
    joints(1,3).entries=0;
    joints(2,1).entries='axial rotation';
    joints(2,2).entries=axi1;
    joints(2,3).entries=-0.01 * pi;
    joints(3,1).entries='axial rotation';
    joints(3,2).entries=axi2;
    joints(3,3).entries=-0.005 * pi;
endfunction
