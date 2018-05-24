% This script is only for finding the ideal errors of cuttings
% input 1:d1, first depth of PSI, unit: mm;
% input 2:d2, last depth of PSI, unit: mm;
% output:err, error of angle, unit: radians;
% f1 f2 f3 f4 f5 f5 f6 are the coefficients of 5th degree polynomial functions
d1=5;
d2=205;

n= (d2-d1)/10+1;
result=zeros(1,n);
x=zeros(1,n);

w=1.6;%slot width
t=1.24;%blade thickness

for k=1:n
x(k)=d1;
%polynomial function solver:
f1 = d1/120;
f2 = -w/24;
f3 = -d1/6;
f4 = w/2;
f5 = d1;
f6 = t-w;
p = [f1 f2 f3 f4 f5 f6]; 
%answer displays:
fprintf ('The error for %d mm is:',d1);
error = roots(p);
real_error=real(error);
ab_error=abs(real_error);
err=min(ab_error);
disp(err);
result(k)=err*180/pi;
d1=d1+10;
end
plot(x,result,'b-o');
title('therotical angles errorr vs lengths of slots');
xlabel('lengths of slots/mm');
ylabel('errors/degrees');

result=result';
x=x';
T = table(x,result);
writetable(T,'therotical angle errors.xls');


