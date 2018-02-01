% This is the script for the data analysis of 2017 UROP PSI accuracy
% project at MSK lab@Imperial College London, it can calculate the error
% angles between target plane and real cutting plane; flatness of real
% cutting plane, it also plot the deviations map of cutting surface for
% local flatness visualization. 
% 
% The project script needs the support from several functions:
% angle_error,flatness,rgb,stlread,stlreadascii,stlreadbinary

clear all
%% reading data
prompt1 = 'how many blocks do you have here?\n';
n =input(prompt1);%number of avaliable blocks in total

stl_files = dir('*.stl');
stl_files = stl_files(~[stl_files.isdir]); 
stl_names = {stl_files.name};

numfiles=length(stl_names);
r=rem(numfiles,4);

if r ~= 0
    error('ach block should have 4 files, some files are missing.')
end

if numfiles ~= 4*n
    error('The number of blocks is different from blocks in the folder.')
end
%% Main code
disp('Calculating...');
BlockPartName = {};
ErrorAngle = []; %error angles results
flat = []; %flatness results

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


     
  

