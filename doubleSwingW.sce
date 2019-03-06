clear;
//===============create file===============//
txt_outpath='double_swing.mbd';
fid=mopen(txt_outpath,'w');

//===============dataset===============//
//problem data
time_data=[0;5;0.001;10;0.000001];

//const
M=1;
L=1;
pi=3.1415
thete1=double((pi)/6) ;
thete2=double((pi)/6) ;

//referrence data
nullMatrix=[0,0,0;0,0,0;0,0,0];
refMatrix=[0,0,0,0,0,0,0,0,0,0,0,0;
            1,0,0,0,-thete2,0,0,0,0,0,0,0];

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
bodies=[0,0,0,0,M*L^2/12,M*L^2/12;
        0,0,0,0,M*L^2/12,M*L^2/12];

//joint data
clp1=[1,0,0,3,0,1,0];
axi1=[1,0,0,3,0,1,0;
        1,0,0,3,0,1,0];
axi2=[1,0,0,3,0,1,0;
        1,0,0,3,0,1,0];
joints=cell(3,3);
joints(1,1).entries='clamp';
joints(1,2).entries=clp1;
joints(1,3).entries=0;
joints(2,1).entries='axial rotation';
joints(2,2).entries=axi1;
joints(2,3).entries=pi;
joints(3,1).entries='axial rotation';
joints(3,2).entries=axi2;
joints(3,3).entries=2*pi;

//===============write===============//
//title
mfprintf(fid,'%s\n\n','# double_rigid_pendulum_2.mbd');

//problem type
exec app/problem_write.sci;

//initial value
exec app/iv_write.sci;


//control data
exec app/control_write.sci;

//const set
exec app/const_write.sci;

//Reference
exec app/ref_write.sci;

//size(tmp)
exec app/nodes_write.sci;

//elements
//gravity
//force
exec app/elem_write.sci;

//end

//===============close file===============//
mclose(fid);
