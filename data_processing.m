%% check if the data follows normal distribution
errors_15_raw = [2.322640285
2.006987891
0.619317709
0.201762799
0.183029172
0.500247365
3.167050768
1.302923762
1.078838687
1.056496934
0.994511327
1.373080672
0.24647892
0.141847243
    ];
errors_15 = (errors_15_raw-1.085372395)/0.903045195;
h_15 = kstest(errors_15);
% plot:
%{
[f,x_values] = ecdf(errors_15);
F = plot(x_values,f);
set(F,'LineWidth',2);
hold on;
G = plot(x_values,normcdf(x_values,0,1),'r-');
set(G,'LineWidth',2);
legend([F G],...
       'Empirical CDF','Standard Normal CDF',...
       'Location','SE');
%}
%%
errors_25_raw=[1.251750912
1.177737743
0.81733617
0.871866353
0.369599254
0.411372147
0.579495804
0.379489368
1.541004374
1.720430973
1.125413377
0.902381734
1.247629716
1.141572912
    ];
errors_25 = (errors_25_raw-0.966934346)/0.42548792;
h_25 = kstest(errors_25);
%%
errors_35_raw = [0.433582576
0.462138108
0.433925677
0.817391763
0.547917452
0.403507302
1.015201977
0.934208881
1.29104588
1.043684478
0.610634778
0.388546924
1.55529866
1.601219596
];
errors_35 = (errors_35_raw-0.824164575)/0.427669552;
h_35 = kstest(errors_35);
%%
errors_45_raw=[0.837783643
1.132842292
0.683952281
0.625474969
1.082016148
1.093277968
1.084097539
1.282288493
0.364442983
0.724346681
0.477059498
0.856957617
0.750161061
0.877944677
];
errors_45 = (errors_45_raw-0.848046132)/0.265185809;
h_45 = kstest(errors_45);
%%
fprintf('k-s test for 15:%d \n',h_15);
fprintf('k-s test for 25:%d \n',h_25);
fprintf('k-s test for 35:%d \n',h_35);
fprintf('k-s test for 45:%d \n',h_45);
%% Anderson-Darling test
[h_15_a,p_15,adstat_15,cv_15] = adtest(errors_15_raw);
[h_25_a,p_25,adstat_25,cv_25] = adtest(errors_25_raw);
[h_35_a,p_35,adstat_35,cv_35] = adtest(errors_35_raw);
[h_45_a,p_45,adstat_45,cv_45] = adtest(errors_45_raw);
fprintf('a-d test for 15:%d \n',h_15_a);
fprintf('a-d test for 25:%d \n',h_25_a);
fprintf('a-d test for 35:%d \n',h_35_a);
fprintf('a-d test for 45:%d \n',h_45_a);

%% for 5 gourps:
raw_15 = [2.322640285
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
raw_25 = [1.251750912
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
raw_35=[0.433582576
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
raw_45 = [0.837783643
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
errors_15_5groups = (raw_15-1.412361083)/0.868049252;
h_15_5groups = kstest(errors_15_5groups);
errors_25_5groups = (raw_25-1.036690681)/0.412325796;
h_25_5groups = kstest(errors_25_5groups);
errors_35_5groups = (raw_35-0.743036104)/0.319767508;
h_35_5groups = kstest(errors_35_5groups);
errors_45_5groups = (raw_45-0.8069246)/0.292867022;
h_45_5groups = kstest(errors_45_5groups);
fprintf('k-s test for 15 5 groups:%d \n',h_15_5groups);
fprintf('k-s test for 25 5 groups:%d \n',h_25_5groups);
fprintf('k-s test for 35 5 groups:%d \n',h_35_5groups);
fprintf('k-s test for 45 5 groups:%d \n',h_45_5groups);
[h_15_a_5,p_15_5,adstat_15_5,cv_15_5] = adtest(raw_15);
[h_25_a_5,p_25_5,adstat_25_5,cv_25_5] = adtest(raw_25);
[h_35_a_5,p_35_5,adstat_35_5,cv_35_5] = adtest(raw_35);
[h_45_a_5,p_45_5,adstat_45_5,cv_45_5] = adtest(raw_45);
fprintf('a-d test for 15 5 groups:%d \n',h_15_a_5);
fprintf('a-d test for 25 5 groups:%d \n',h_25_a_5);
fprintf('a-d test for 35 5 groups:%d \n',h_35_a_5);
fprintf('a-d test for 45 5 groups:%d \n',h_45_a_5);
%%
f_15_raw = [0.074261148
0.059385931
0.204789825
0.09830343
0.066551247
0.054071691
0.388375827
0.295559476
0.094571373
0.068290063
0.254706185
0.09276511
0.076374563
0.088963562
];
f_25_raw = [0.130587989
0.136952016
0.062109259
0.065878793
0.064019772
0.066872718
0.082538831
0.07837436
0.071798307
0.108775525
0.111820646
0.090738824
0.07940727
0.063493844
];
f_35_raw = [0.057298946
0.05921455
0.085620352
0.084690082
0.065311224
0.057213227
0.094670006
0.088247101
0.122102262
0.071135145
0.180022662
0.071432471
0.079187805
0.068080972
];
f_45_raw = [0.111555326
0.079075016
0.05804858
0.056105521
0.090928328
0.090335742
0.060893893
0.068301665
0.08615471
0.108246833
0.43401195
0.234853839
0.058287347
0.07665182
];
f15 = (f_15_raw-0.136926388)/0.105443977;
h15f = kstest(f15);
f25 = (f_25_raw-0.086669154)/0.025468288;
h25f = kstest(f25);
f35 = (f_35_raw-0.084587629)/0.032576979;
h35f = kstest(f35);
f45 = (f_45_raw-0.115246469)/0.102284577;
h45f = kstest(f45);
fprintf('k-s test for 15 f:%d \n',h15f);
fprintf('k-s test for 25 f:%d \n',h25f);
fprintf('k-s test for 35 f:%d \n',h35f);
fprintf('k-s test for 45 f:%d \n',h45f);
h_15_a_f = adtest(f_15_raw);
h_25_a_f = adtest(f_25_raw);
h_35_a_f = adtest(f_35_raw);
h_45_a_f = adtest(f_45_raw);
fprintf('a-d test for 15 f groups:%d \n',h_15_a_f);
fprintf('a-d test for 25 f groups:%d \n',h_25_a_f);
fprintf('a-d test for 35 f groups:%d \n',h_35_a_f);
fprintf('a-d test for 45 f groups:%d \n',h_45_a_f);
TF_15_f = isoutlier(f_15_raw');
TF_25_f= isoutlier(f_25_raw');
TF_35_f = isoutlier(f_35_raw');
TF_45_f= isoutlier(f_45_raw');
TF_15_e= isoutlier(errors_15_raw');
TF_25_e= isoutlier(errors_25_raw');
TF_35_e= isoutlier(errors_35_raw');
TF_45_e= isoutlier(errors_45_raw');