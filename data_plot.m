errors_15=[2.322640285
2.006987891
0.619317709
0.201762799
3.167050768
1.302923762
1.078838687
1.056496934
0.994511327
1.373080672
];
x_15=[15
    15
    15
    15
    15
    15
    15
    15
    15
    15];
errors_25=[1.251750912
1.177737743
0.81733617
0.871866353
0.579495804
0.379489368
1.541004374
1.720430973
1.125413377
0.902381734
];
x_25=[25
    25
    25
    25
    25
    25
    25
    25
    25
    25];
errors_35=[0.433582576
0.462138108
0.433925677
0.817391763
1.015201977
0.934208881
1.29104588
1.043684478
0.610634778
0.388546924
];
x_35=[35
    35
    35
    35
    35
    35
    35
    35
    35
    35];
errors_45=[0.837783643
1.132842292
0.683952281
0.625474969
1.084097539
1.282288493
0.364442983
0.724346681
0.477059498
0.856957617
];
x_45=[45
    45
    45
    45
    45
    45
    45
    45
    45
    45];
averages=[1.412361083,1.036690681,0.743036104,0.8069246];
x_averages=[15,25,35,45];
sz = 50;
figure
scatter(x_15',errors_15',sz,'filled');
xlabel('Depths: 15cm 25cm 35cm 45cm')
ylabel('Error angles in degrees')
hold on
scatter(x_25',errors_25',sz,'filled');
scatter(x_35',errors_35',sz,'filled');
scatter(x_45',errors_45',sz,'filled');
plot(x_averages,averages,'-b');
scatter(x_averages,averages,100,'b','filled');
hold off
figure
err = [.868 .412 .320 .292];
e=errorbar(x_averages,averages,err);
e.Color = 'blue';
%e.CapSise = 20;
e.Marker = 'o';
xlabel('Depths: 15cm 25cm 35cm 45cm')
ylabel('Error angles in degrees')
figure
xx = [errors_15 errors_25 errors_35 errors_45];
boxplot(xx,x_averages)
xlabel('Depths: 15cm 25cm 35cm 45cm')
ylabel('Error angles in degrees')