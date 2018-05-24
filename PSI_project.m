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

prompt1 = 'start with which block?\n';
n1 =input(prompt1);%number of avaliable blocks in total
prompt2 = 'end with which block?\n';
n2 =input(prompt2);%number of avaliable blocks in total


stl_files = dir('*.stl');
stl_files = stl_files(~[stl_files.isdir]); 
stl_names = {stl_files.name};

numfiles=length(stl_names);
r=rem(numfiles,3);

if r ~= 0
    error('each block should have 3 files, some files are missing.')
end

if numfiles ~= 3*(n2-n1+1)
    error('The number of blocks is different from blocks in the folder.')
end

%% Main code
disp('Calculating...');
BlockPartName = {};
ErrorAngle = []; %error angles results
flat = []; %flatness results
flat_at_90 = [];

for i=n1:n2
    target = sprintf('%d_t.stl',i);%target up
    %target1 = sprintf('%d_t_up.stl',i);%target up
    %target2 = sprintf('%d_t_bo.stl',i);%target up
    cutting1 = sprintf('%d_c_up.stl',i);%cutting up
    cutting2 = sprintf('%d_c_bo.stl',i);%cutting botom
    try
        err1 = angle_error(target,cutting1);
        err2 = angle_error(target,cutting2);
        fprintf('Block %d up part:%d°.\n',i,err1);
        fprintf('Block %d bottoom part:%d°.\n',i,err2);
        BlockPartName = [BlockPartName,{cutting1}];
        ErrorAngle(end+1)= err1;
        [f1,f3] = flatness(cutting1);
        flat(end+1)= f1;
        flat_at_90(end+1)=f3;
        BlockPartName = [BlockPartName,{cutting2}];
        ErrorAngle(end+1) = err2;
        [f2,f4] = flatness(cutting2);
        flat(end+1)=f2;
        flat_at_90(end+1)=f4;
    catch 
        warning('Data of Block %d are missing.\n',i);
    end
end

ErrorAngle=ErrorAngle';
BlockPartName=BlockPartName';
flat = flat';
flat_at_90=flat_at_90'; 

T = table(BlockPartName,ErrorAngle,flat,flat_at_90);
%writetable(T,'result_37_40.xls');
writetable(T,'result_new_new.xls');
disp('end');



  

