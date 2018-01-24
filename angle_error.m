function err = angle_error(target_plane,cutting_plane)

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

