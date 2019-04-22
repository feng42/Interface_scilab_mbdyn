function [Label,Data] = NODELoad(FileName)
  
  // MBDynLoad loads MBDyn output files such as MOV, FRC, and JNT files into workspace variables.
  //    [LABEL,DATA]=MBDynLoad(FILENAME) reads and stores node or element labels in the row
  //    vector LABEL and all data in the three dimensional array DATA.
  //    DATA(i,j,k) will contain the j-th component value of the k-th node or element at the i-th time.
  //    See MBDyn Manual for information about data contained in each output file.
  // 
  //    For example, suppose 'sample.mov' is a MOV file output by an MBDyn analysis, then by
  // 
  //       [LABEL,DATA]=MBDynLoad('sample.mov')
  // 
  //    DATA(:,2,LABEL==5) gives the time sequence of X position of the node 5.
  // 
  // NOTES:
  // * Developed for Scilab Version 5.2.2. Modifications may be required for older or newer versions.
  // * For information about MBDyn, please visit its official homepage at https://www.mbdyn.org.
  // (c) 2010 Sky Engineering Laboratry Inc. (https://www.sky-engin.jp)
  
  
  // Output variables initialisation (not found in input variables)
  Label=[];
  Data=[];
  
  // Display mode
  mode(0);
  
  // Display warning for floating point exception
  ieee(1);
  
  // Read Output File
  fid = mopen(FileName,'r');
  M_STR = mgetl(fid);
  mclose(fid);
  M = [];
  for i=1:size(M_STR,"r")
    L = strtod(tokens(M_STR(i,:),' '))';
    m_L = size(L,"c");
    m_M = size(M,"c");
    if i>=2 then
      if m_L>m_M then
        M = [M,zeros(i-1,m_L-m_M)];
      elseif m_L<m_M then
        L = [L,zeros(1,m_M-m_L)];
      else
      end
    end
    M = [M;L];
  end
  
  // Make Label
  Temp_Label = M(:,1);
  Label = [];
  while ~isempty(Temp_Label)
    Label=[Label,min(Temp_Label)];
    Temp_Label=Temp_Label(find(Temp_Label~=min(Temp_Label)));
  end;
  clear("Temp_Label");
  
  // Make Data
  for i = 1:length(Label)
    Data(:,:,i)=M(find(M(:,1)==Label(i)),:);
  end;
  
endfunction
