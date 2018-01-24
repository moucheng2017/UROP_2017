clear all
n=96;%number of blocks in total
stl_files = dir('*.stl');
stl_files = stl_files(~[stl_files.isdir]); 
stl_names = {stl_files.name};

numfiles=length(stl_names);
r=rem(numfiles,4);
if r ~= 0
    error('each block should have 4 files, some files are missing.')
end

BlockPartName = {};
ErrorAngle = [];
flat = [];

for i=1:n
    target1 = sprintf('%d_t_up.stl',i);%target up
    target2 = sprintf('%d_t_bo.stl',i);%target bottom
    cutting1 = sprintf('%d_c_up.stl',i);%cutting up
    cutting2 = sprintf('%d_c_bo.stl',i);%cutting botom
    try
        err1 = angle_error(target1,cutting1);
        err2 = angle_error(target2,cutting2);
        fprintf('Block %d up part:%d°.\n',i,err1);
        fprintf('Block %d bottoom part:%d°.\n',i,err2);
        BlockPartName = [BlockPartName,{cutting1}];
        ErrorAngle(end+1)= err1;
        f1 = flatness(cutting1);
        flat(end+1)= f1;
        BlockPartName = [BlockPartName,{cutting2}];
        ErrorAngle(end+1) = err2;
        f2 = flatness(cutting2);
        flat(end+1)=f2;
    catch 
        warning('Data of Block %d are missing.\n',i);
    end
end

ErrorAngle=ErrorAngle';
BlockPartName=BlockPartName';
flat = flat';

T = table(BlockPartName,ErrorAngle,flat);
writetable(T,'results.xls');
disp('end');


     
  

