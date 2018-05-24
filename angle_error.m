function err = angle_error(target_plane,cutting_plane)
% ANGLE_ERROR  Function to find the angle error between target plane and cutting plane.
%   target_plane = target_plane from the block with PSI before cutting
%   cutting_plane = cutting plane from the cut surface of block after
%   cutting
%   err = error angle in degrees
%
%   The function is based on comparing the normal vectors of two surfaces
%   with the use of PCA.
%
%   This function is for 2017 UROP PSI project at MSK lab@Imperial College
[f1,v1]=stlread(target_plane);
[f2,v2]=stlread(cutting_plane);

[coeff1,score1,roots1]=pca(v1);
[coeff2,score2,roots2] = pca(v2);

n1=coeff1(:,3);
n2=coeff2(:,3);

err=atan2(norm(cross(n1,n2)),dot(n1,n2))*180/pi;
if err > 90
    err = 180-err;
else
    err=err*1;
end

