[f1,v1] = stlread('1_c_bo.stl');
[f2,v2] = stlread('1_c_up.stl');
[f3,v3] = stlread('3_c_bo.stl');
[f4,v4] = stlread('3_c_up.stl');
%% plots
figure
scatter3(v1(:,1),v1(:,2),v1(:,3),1,rgb('red'),'filled');
hold on
scatter3(v2(:,1),v2(:,2),v2(:,3),1,rgb('blue'),'filled');
hold off
figure
scatter3(v3(:,1),v3(:,2),v3(:,3),1,rgb('green'),'filled');
hold on
scatter3(v4(:,1),v4(:,2),v4(:,3),1,rgb('yellow'),'filled');
hold off
%% distance calculation using k-d tree search
ns = createns(v2,'nsmethod','kdtree');[idx, dist] = knnsearch(ns,v1,'k',1);

ns3 = createns(v4,'nsmethod','kdtree');[idx3, dist3] = knnsearch(ns3,v3,'k',1);

meandist1 = mean(dist);
meandist2 = mean (dist3);
disp('end');
