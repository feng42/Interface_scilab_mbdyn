function status=double_swing(rootpath,outfile)
    //clear;
    //===============create file===============//
    //outfile = 'out/double_swing_testf.mbd'
    //txt_outpath=outfile;
    fid=mopen(rootpath+outfile,'w');

    //===============dataset===============//
    //exec("init_2s.sci", -1);

    //===============write===============//
    //title
    mfprintf(fid,'%s\n\n','# double_rigid_pendulum_2.mbd');

    //problem type
    exec(rootpath+'app/file_write/problem_write.sci',-1);

    //initial value
    exec(rootpath+'app/file_write/iv_write.sci',-1);


    //control data
    exec(rootpath+'app/file_write/control_write.sci',-1);

    //const set
    exec(rootpath+'app/file_write/const_write.sci',-1);


    //Reference
    exec(rootpath+'app/file_write/ref_write.sci',-1);


    //size(tmp)
    exec(rootpath+'app/file_write/nodes_write.sci',-1);

    //elements
    //gravity
    //force
    exec(rootpath+'app/file_write/elem_write.sci',-1);

    //end

    //===============close file===============//
    status = mclose(fid);
    
    //exec file
    //unix_s("mbdyn -f '+rootpath+outfile)
endfunction
