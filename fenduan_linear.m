clear; clc;

xnum = [1 2 2.3 5.1 6.2 6.8 8 8.4 9.1];  
ynum = sqrt(xnum);  % ��Ե�sqrt(x)�ĺ���,����������ͬ��

n = length(xnum);
syms x L;
L_tmp = sym(zeros(1,n-1));

% ÿһ��(�������ڵ�)�������ղ�ֱֵ��:
for m = 1:n-1
    l0 = (x-xnum(m+1))/(xnum(m)-xnum(m+1));
    l1 = (x-xnum(m))/(xnum(m+1)-xnum(m));
    L_tmp(m) = ynum(m)*l0 + ynum(m+1)*l1;
end

% �ֶκ�����ͼû������:����һ��һ�λ�����
figure(1);
for m = 1:n-1
    x = [xnum(m),xnum(m+1)];
    y = double(subs(L_tmp(m)));
    plot(x,y);
    hold on;
end
grid on;

% ԭʼ����ͼ��(����һ��)
x1 = xnum(1):0.1:xnum(n);
y1 = sqrt(x1);
plot(x1,y1,'--k');
title('�ֶ����Խ���y=sqrt(x)����');
xlabel('x');  ylabel('y');