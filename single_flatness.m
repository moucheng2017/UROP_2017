%%
%white:0-0.02mm
%cyan:0.02-0.04mm
%dodgerblue:0.04-0.06mm
%blue:0.06-0.08mm
%yellow:0.08-0.1mm
%orange:0.1-0.26mm
%green:0.26-0.5mm
%red:0.5-0.76mm
%purple:0.76-1mm
%black:1-1.5mm
%black:>1.5mm
%%
[f1,v1]=stlread('3_c_up.stl');
sum_sur1=sum(v1);
no_rows=size(v1,1);

centre1=[sum_sur1(1)/no_rows sum_sur1(2)/no_rows sum_sur1(3)/no_rows];%centre point of surface1

A=[v1(:,1)-centre1(1) v1(:,2)-centre1(2) v1(:,3)-centre1(3)];

x=A(:,1);
y=A(:,2);
z=A(:,3);
no=length(x);

y_square_sum=sum(y.*y);
x_square_sum=sum(x.*x);
zx_sum=sum(z.*x);
xy_sum=sum(x.*y);
zy_sum=sum(z.*y);

a=(y_square_sum*zx_sum-xy_sum*zy_sum)/(x_square_sum*y_square_sum-xy_sum^2);
b=(x_square_sum*zy_sum-xy_sum*zx_sum)/(x_square_sum*y_square_sum-xy_sum^2);

z_estimated=x*a+y*b;

e=(z-z_estimated)./(sqrt(a^2+b^2+1));

e_max=max(e);
e_min=min(e);
error=e_max-e_min;
fprintf('maximum: %d mm \n',e_max);
fprintf('minimum: %d mm \n',e_min);
fprintf('flatness: %d mm \n\n',error);
%% plot:
figure
x1=[];y1=[];z1=[];x2=[];y2=[];z2=[];x3=[];y3=[];z3=[];x4=[];y4=[];z4=[];x5=[];y5=[];z5=[];x6=[];y6=[];z6=[];
x7=[];y7=[];z7=[];x8=[];y8=[];z8=[];x9=[];y9=[];z9=[];x10=[];y10=[];z10=[];x11=[];y11=[];z11=[];x12=[];y12=[];z12=[];
x13=[];y13=[];z13=[];x14=[];y14=[];z14=[];x15=[];y15=[];z15=[];x16=[];y16=[];z16=[];x17=[];y17=[];z17=[];x18=[];y18=[];z18=[];
x19=[];y19=[];z19=[];x20=[];y20=[];z20=[];x21=[];y21=[];z21=[];x22=[];y22=[];z22=[];x23=[];y23=[];z23=[];
x24=[];y24=[];z24=[];x25=[];y25=[];z25=[];x26=[];y26=[];z26=[];x27=[];y27=[];z27=[];x28=[];y28=[];z28=[];
x29=[];y29=[];z29=[];x30=[];y30=[];z30=[];x31=[];y31=[];z31=[];x32=[];y32=[];z32=[];x33=[];y33=[];z33=[];
x34=[];y34=[];z34=[];x35=[];y35=[];z35=[];x36=[];y36=[];z36=[];x37=[];y37=[];z37=[];x38=[];y38=[];z38=[];
x39=[];y39=[];z39=[];x40=[];y40=[];z40=[];x41=[];y41=[];z41=[];x42=[];y42=[];z42=[];x43=[];y43=[];z43=[];
x44=[];y44=[];z44=[];x45=[];y45=[];z45=[];x46=[];y46=[];z46=[];x47=[];y47=[];z47=[];x48=[];y48=[];z48=[];
x49=[];y49=[];z49=[];x50=[];y50=[];z50=[];x51=[];y51=[];z51=[];x52=[];y52=[];z52=[];x53=[];y53=[];z53=[];
x54=[];y54=[];z54=[];x55=[];y55=[];z55=[];x56=[];y56=[];z56=[];

for i=1:no
    e(i)=abs(e(i));
end

for i=1:no
    if (e(i)>0)&&(e(i)<0.02) 
        x1(end+1)=x(i);
        y1(end+1)=y(i);
        z1(end+1)=0;
    elseif (e(i)>=0.02)&&(e(i)<0.04)
        x2(end+1)=x(i);
        y2(end+1)=y(i);
        z2(end+1)=0;
    elseif (e(i)>=0.04)&&(e(i)<0.06)
        x3(end+1)=x(i);
        y3(end+1)=y(i);
        z3(end+1)=0;
    elseif (e(i)>=0.06)&&(e(i)<0.08)
        x4(end+1)=x(i);
        y4(end+1)=y(i);
        z4(end+1)=0;
    elseif (e(i)>=0.08)&&(e(i)<0.1)
        x5(end+1)=x(i);
        y5(end+1)=y(i);
        z5(end+1)=0;
    elseif (e(i)>=0.1)&&(e(i)<0.12)
        x6(end+1)=x(i);
        y6(end+1)=y(i);
        z6(end+1)=0;
    elseif (e(i)>=0.12)&&(e(i)<0.14)
        x7(end+1)=x(i);
        y7(end+1)=y(i);
        z7(end+1)=0;
    elseif (e(i)>=0.14)&&(e(i)<0.16)
        x8(end+1)=x(i);
        y8(end+1)=y(i);
        z8(end+1)=0;
    elseif (e(i)>=0.16)&&(e(i)<0.18)
        x9(end+1)=x(i);
        y9(end+1)=y(i);
        z9(end+1)=0;
    elseif (e(i)>=0.18)&&(e(i)<0.2)
        x10(end+1)=x(i);
        y10(end+1)=y(i);
        z10(end+1)=0;  
    elseif (e(i)>=0.2)&&(e(i)<0.22)
        x11(end+1)=x(i);
        y11(end+1)=y(i);
        z11(end+1)=0; 
    elseif (e(i)>=0.22)&&(e(i)<0.24)
        x12(end+1)=x(i);
        y12(end+1)=y(i);
        z12(end+1)=0;
    elseif (e(i)>=0.24)&&(e(i)<0.26)
        x13(end+1)=x(i);
        y13(end+1)=y(i);
        z13(end+1)=z(i);
    elseif (e(i)>=0.26)&&(e(i)<0.28)
        x14(end+1)=x(i);
        y14(end+1)=y(i);
        z14(end+1)=z(i);
    elseif (e(i)>=0.28)&&(e(i)<0.3)
        x15(end+1)=x(i);
        y15(end+1)=y(i);
        z15(end+1)=z(i);
    elseif (e(i)>=0.3)&&(e(i)<0.32)
        x16(end+1)=x(i);
        y16(end+1)=y(i);
        z16(end+1)=z(i);
    elseif (e(i)>=0.32)&&(e(i)<0.34)
        x17(end+1)=x(i);
        y17(end+1)=y(i);
        z17(end+1)=z(i);
    elseif (e(i)>=0.34)&&(e(i)<0.36)
        x18(end+1)=x(i);
        y18(end+1)=y(i);
        z18(end+1)=z(i);
    elseif (e(i)>=0.36)&&(e(i)<0.38)
        x19(end+1)=x(i);
        y19(end+1)=y(i);
        z19(end+1)=z(i);
    elseif (e(i)>=0.38)&&(e(i)<0.4)
        x20(end+1)=x(i);
        y20(end+1)=y(i);
        z20(end+1)=z(i);
    elseif (e(i)>=0.4)&&(e(i)<0.42)
        x21(end+1)=x(i);
        y21(end+1)=y(i);
        z21(end+1)=z(i);
    elseif (e(i)>=0.42)&&(e(i)<0.44)
        x22(end+1)=x(i);
        y22(end+1)=y(i);
        z22(end+1)=z(i);
    elseif (e(i)>=0.44)&&(e(i)<0.46)
        x23(end+1)=x(i);
        y23(end+1)=y(i);
        z23(end+1)=z(i);
    elseif (e(i)>=0.46)&&(e(i)<0.48)
        x24(end+1)=x(i);
        y24(end+1)=y(i);
        z24(end+1)=z(i);
    elseif (e(i)>=0.48)&&(e(i)<0.5)
        x25(end+1)=x(i);
        y25(end+1)=y(i);
        z25(end+1)=z(i);
    elseif (e(i)>=0.5)&&(e(i)<0.52)
        x26(end+1)=x(i);
        y26(end+1)=y(i);
        z26(end+1)=z(i);
    elseif (e(i)>=0.52)&&(e(i)<0.54)
        x27(end+1)=x(i);
        y27(end+1)=y(i);
        z27(end+1)=z(i);
    elseif (e(i)>=0.54)&&(e(i)<0.56)
        x28(end+1)=x(i);
        y28(end+1)=y(i);
        z28(end+1)=z(i);
    elseif (e(i)>=0.56)&&(e(i)<0.58)
        x29(end+1)=x(i);
        y29(end+1)=y(i);
        z29(end+1)=z(i);
    elseif (e(i)>=0.58)&&(e(i)<0.6)
        x30(end+1)=x(i);
        y30(end+1)=y(i);
        z30(end+1)=z(i);
   elseif (e(i)>=0.6)&&(e(i)<0.62)
        x31(end+1)=x(i);
        y31(end+1)=y(i);
        z31(end+1)=z(i);
    elseif (e(i)>=0.62)&&(e(i)<0.64)
        x32(end+1)=x(i);
        y32(end+1)=y(i);
        z32(end+1)=z(i);
    elseif (e(i)>=0.64)&&(e(i)<0.66)
        x33(end+1)=x(i);
        y33(end+1)=y(i);
        z33(end+1)=z(i);
    elseif (e(i)>=0.66)&&(e(i)<0.68)
        x34(end+1)=x(i);
        y34(end+1)=y(i);
        z34(end+1)=z(i);
    elseif (e(i)>=0.68)&&(e(i)<0.7)
        x35(end+1)=x(i);
        y35(end+1)=y(i);
        z35(end+1)=z(i);
    elseif (e(i)>=0.7)&&(e(i)<0.72)
        x36(end+1)=x(i);
        y36(end+1)=y(i);
        z36(end+1)=z(i);
    elseif (e(i)>=0.72)&&(e(i)<0.74)
        x37(end+1)=x(i);
        y37(end+1)=y(i);
        z37(end+1)=z(i);
    elseif (e(i)>=0.74)&&(e(i)<0.76)
        x38(end+1)=x(i);
        y38(end+1)=y(i);
        z38(end+1)=z(i);
    elseif (e(i)>=0.76)&&(e(i)<0.78)
        x39(end+1)=x(i);
        y39(end+1)=y(i);
        z39(end+1)=z(i);
    elseif (e(i)>=0.78)&&(e(i)<0.8)
        x40(end+1)=x(i);
        y40(end+1)=y(i);
        z40(end+1)=z(i);
   elseif (e(i)>=0.8)&&(e(i)<0.82)
        x41(end+1)=x(i);
        y41(end+1)=y(i);
        z41(end+1)=z(i);
    elseif (e(i)>=0.82)&&(e(i)<0.84)
        x42(end+1)=x(i);
        y42(end+1)=y(i);
        z42(end+1)=z(i);
    elseif (e(i)>=0.84)&&(e(i)<0.86)
        x43(end+1)=x(i);
        y43(end+1)=y(i);
        z43(end+1)=z(i);
    elseif (e(i)>=0.86)&&(e(i)<0.88)
        x44(end+1)=x(i);
        y44(end+1)=y(i);
        z44(end+1)=z(i);
    elseif (e(i)>=0.88)&&(e(i)<0.9)
        x45(end+1)=x(i);
        y45(end+1)=y(i);
        z45(end+1)=z(i);
    elseif (e(i)>=0.9)&&(e(i)<0.92)
        x46(end+1)=x(i);
        y46(end+1)=y(i);
        z46(end+1)=z(i);
    elseif (e(i)>=0.92)&&(e(i)<0.94)
        x47(end+1)=x(i);
        y47(end+1)=y(i);
        z47(end+1)=z(i);
    elseif (e(i)>=0.94)&&(e(i)<0.96)
        x48(end+1)=x(i);
        y48(end+1)=y(i);
        z48(end+1)=z(i);
    elseif (e(i)>=0.96)&&(e(i)<0.98)
        x49(end+1)=x(i);
        y49(end+1)=y(i);
        z49(end+1)=z(i);
    elseif (e(i)>=0.98)&&(e(i)<1)
        x50(end+1)=x(i);
        y50(end+1)=y(i);
        z50(end+1)=z(i);
    elseif (e(i)>=1)&&(e(i)<1.1)
        x51(end+1)=x(i);
        y51(end+1)=y(i);
        z51(end+1)=z(i);
    elseif (e(i)>=1.1)&&(e(i)<1.2)
        x52(end+1)=x(i);
        y52(end+1)=y(i);
        z52(end+1)=z(i);
    elseif (e(i)>=1.2)&&(e(i)<1.3)
        x53(end+1)=x(i);
        y53(end+1)=y(i);
        z53(end+1)=z(i);
    elseif (e(i)>=1.3)&&(e(i)<1.4)
        x54(end+1)=x(i);
        y54(end+1)=y(i);
        z54(end+1)=z(i);
    elseif (e(i)>=1.4)&&(e(i)<1.5)
        x55(end+1)=x(i);
        y55(end+1)=y(i);
        z55(end+1)=z(i);
    else 
        x56(end+1)=x(i);
        y56(end+1)=y(i);
        z56(end+1)=z(i);
    end 
end

scatter3(x1',y1',z1',1,rgb('white'),'filled');
hold on
scatter3(x2',y2',z2',1,rgb('Cyan'),'filled');
scatter3(x3',y3',z3',1,rgb('DodgerBlue'),'filled');
scatter3(x4',y4',z4',1,rgb('Blue'),'filled');
scatter3(x5',y5',z5',1,rgb('yellow'),'filled');
scatter3(x6',y6',z6',1,rgb('orange'),'filled');
scatter3(x7',y7',z7',1,rgb('orange'),'filled');
scatter3(x8',y8',z8',1,rgb('orange'),'filled');
scatter3(x9',y9',z9',1,rgb('orange'),'filled');
scatter3(x10',y10',z10',1,rgb('orange'),'filled');
scatter3(x11',y11',z11',1,rgb('orange'),'filled');
scatter3(x12',y12',z12',1,rgb('orange'),'filled');
scatter3(x13',y13',z13',1,rgb('orange'),'filled');
scatter3(x14',y14',z14',1,rgb('green'),'filled');
scatter3(x15',y15',z15',1,rgb('green'),'filled');
scatter3(x16',y16',z16',1,rgb('green'),'filled');
scatter3(x17',y17',z17',1,rgb('green'),'filled');
scatter3(x18',y18',z18',1,rgb('green'),'filled');
scatter3(x19',y19',z19',1,rgb('green'),'filled');
scatter3(x20',y20',z20',1,rgb('green'),'filled');
scatter3(x21',y21',z21',1,rgb('green'),'filled');
scatter3(x22',y22',z22',1,rgb('green'),'filled');
scatter3(x23',y23',z23',1,rgb('green'),'filled');
scatter3(x24',y24',z24',1,rgb('green'),'filled');
scatter3(x25',y25',z25',1,rgb('green'),'filled');
scatter3(x26',y26',z26',1,rgb('red'),'filled');
scatter3(x27',y27',z27',1,rgb('red'),'filled');
scatter3(x28',y28',z28',1,rgb('red'),'filled');
scatter3(x29',y29',z29',1,rgb('red'),'filled');
scatter3(x30',y30',z30',1,rgb('red'),'filled');
scatter3(x31',y31',z31',1,rgb('red'),'filled');
scatter3(x32',y32',z32',1,rgb('red'),'filled');
scatter3(x33',y33',z33',1,rgb('red'),'filled');
scatter3(x34',y34',z34',1,rgb('red'),'filled');
scatter3(x35',y35',z35',1,rgb('red'),'filled');
scatter3(x36',y36',z36',1,rgb('red'),'filled');
scatter3(x37',y37',z37',1,rgb('red'),'filled');
scatter3(x38',y38',z38',1,rgb('red'),'filled');
scatter3(x39',y39',z39',1,rgb('purple'),'filled');
scatter3(x40',y40',z40',1,rgb('purple'),'filled');
scatter3(x41',y41',z41',1,rgb('purple'),'filled');
scatter3(x42',y42',z42',1,rgb('purple'),'filled');
scatter3(x43',y43',z43',1,rgb('purple'),'filled');
scatter3(x44',y44',z44',1,rgb('purple'),'filled');
scatter3(x45',y45',z45',1,rgb('purple'),'filled');
scatter3(x46',y46',z46',1,rgb('purple'),'filled');
scatter3(x47',y47',z47',1,rgb('purple'),'filled');
scatter3(x48',y48',z48',1,rgb('purple'),'filled');
scatter3(x49',y49',z49',1,rgb('purple'),'filled');
scatter3(x50',y50',z50',1,rgb('purple'),'filled');
scatter3(x51',y51',z51',1,rgb('black'),'filled');
scatter3(x52',y52',z52',1,rgb('black'),'filled');
scatter3(x53',y53',z53',1,rgb('black'),'filled');
scatter3(x54',y54',z54',1,rgb('black'),'filled');
scatter3(x55',y55',z55',1,rgb('black'),'filled');
scatter3(x56',y56',z56',1,rgb('Black'),'filled');
hold off
title('deviations distribution map');
view([0 90])
%% Distribution 
xx={};
xx=[xx,{x1},{x2},{x3},{x4},{x5},{x6},{x7},{x8},{x9},{x10},{x11},{x12},{x13},{x14},{x15},{x16},{x17},{x18},{x19},{20},...
    {x21},{x22},{x23},{x24},{x25},{x26},{x27},{x28},{x29},{x30},{x31},{x32},{x33},{x34},{x35},{x36},{x37},{x38},{x39},{40},...
    {x41},{x42},{x43},{x44},{x45},{x46},{x47},{x48},{x49},{x50},{x51},{x52},{x53},{x54},{x55},{x56}];

pp=zeros(56,1);
for i=1:length(xx)
    l=length(xx{i});
    digits(2);
    pp(i)=100*l/no;
end

pp_acc=zeros(57,1);
pp_t=0;

for i=2:length(pp)+1
    pp_acc(i)=pp_t+pp(i-1);
    pp_t=pp_acc(i);
end

figure 
x_axis=0:0.02:0.3;
y_axis=pp_acc(1:16);
plot(x_axis,y_axis,'-o');
xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26 0.28 0.3]);
xticklabels({'0','0.02','0.04','0.06','0.08','0.1','0.12','0.14','0.16','0.18','0.2','0.22','0.24','0.26','0.28','0.3'});
title('accumulations of percentages');
xlabel({'deviations','(mm)'});
ylabel({'accumulations','(%)'});
disp('end');