%% 
[f1,v1]=stlread('3_c_bo.stl');
[f2,v2]=stlread('3_t_bo.stl');
no_rows1=size(v1,1);
no_rows2=size(v2,1);
%% 
[coeff1,score1,roots1]=psca(v1);
[coeff2,score2,roots2] = pca(v2);

n1=coeff1(:,3); %normal vector on plane 1
n2=coeff2(:,3); 

degrees=atan2(norm(cross(n1,n2)),dot(n1,n2))*180/pi; %angle between two plane in degrees
if degrees > 90
    degrees = 180-degrees;
else
    degrees=degrees*1;
end

%% plot 1: scatter points original planes vs least-square fitting planes 
x1_ori=v1(:,1);
y1_ori=v1(:,2);
z1_ori=v1(:,3);
d1=zeros([no_rows1 1]);
z1=zeros(numel(v1(:,1)),1); %estimated z values 
for i=1:numel(v1(:,1))
    x1_t=x1_ori(i);
    y1_t=y1_ori(i);
    z1(i)=(1/n1(3)) * (v1(1,:)*n1 - (x1_t*n1(1) + y1_t*n1(2)));
    d1(i)=z1_ori(i)-z1(i);
end

z2=zeros(numel(v2(:,1)),1); %estimated z values
x2_ori=v2(:,1);
y2_ori=v2(:,2);
for i=1:numel(v2(:,1))
    x2_t=x2_ori(i);
    y2_t=y2_ori(i);
    z2(i)=(1/n2(3)) * (v2(1,:)*n2 - (x2_t*n2(1) + y2_t*n2(2)));
end

scatter3(v1(:,1),v1(:,2),v1(:,3),0.5,'red','filled');%surface 1
hold on
scatter3(v2(:,1),v2(:,2),v2(:,3),0.5,'black','filled');%surface 2
scatter3(v1(:,1),v1(:,2),z1,0.5,'cyan','filled');%surface1 re
%hold on
scatter3(v2(:,1),v2(:,2),z2,0.5,'green','filled');%surface 2 re
hold off
view([30 45])
%% plot 2: optimised planes with their normal vectors
figure
xx=-5:0.5:5;
yy=-5:0.5:5;
xxx=0;
yyy=0;
[X,Y]=meshgrid(xx,yy);
Z1=(-X.*n1(1)-Y.*n1(2))./n1(3);
Z2=(-X.*n2(1)-Y.*n2(2))./n2(3);
z1_5=(-xxx.*n1(1)-yyy.*n1(2))./n1(3);
z2_5=(-xxx.*n2(1)-yyy.*n2(2))./n2(3)
surf(X,Y,Z1,'FaceAlpha',0.2);
n1starting=[xxx;yyy;z1_5];
n11=n1starting + n1;
quiver3(n1starting(1),n1starting(2),n1starting(3),n11(1),n11(2),n11(3),10,'-r');
hold on
surf(X,Y,Z2,'FaceAlpha',0.8);
n2starting=[xxx;yyy;z2_5];
n22=n2starting + n2;
quiver3(n2starting(1),n2starting(2),n2starting(3),n22(1),n22(2),n22(3),10,'-b');
view([80 40])
hold off
%%
%fprintf('Surface 1: (%d)*(x-%d) + (%d)*(y-%d)+ (%d)*(z-%d)=0 \n',n1(1),centre1(1),n1(2),centre1(2),n1(3),centre1(3));
%fprintf('Surface 2: (%d)*(x-%d) + (%d)*(y-%d) + (%d)*(z-%d)=0 \n',n2(1),centre2(1),n2(2),centre2(2),n2(3),centre2(3));
fprintf('Angle between two surfaces: %d° \n\n',degrees);
disp('end');