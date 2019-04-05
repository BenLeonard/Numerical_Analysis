clc; clear;

% ����1/(1+x^2)����������������
xnum = -5:1:5;
% ynum = 1./(1+xnum.^2);
% ynum = sin(xnum)./(1+xnum.^2);
 ynum = (1-xnum)./( 2 - cos(xnum) + xnum.^2);
syms x L;  % L�Ǽ�¼�����ʽ��

n = length(xnum);     % ��¼�ܳ���(�״�)
l = sym(zeros(1,n));  % ������������
for m = 1:n
    % ���������: 
    % prod������Ԫ�ص��۳� e.g. prod([1 2 3 5]) = 1*2*3*5 = 30
    % [1:m-1 m+1:n] �պðѵ��µ�m����ȥ����ֻҪ����m��ŵ�����Ԫ��
    l(m) = prod(x - xnum([1:m-1 m+1:n]))/prod(xnum(m) - xnum([1:m-1 m+1:n]));
    l(m) = l(m)*ynum(m);
end

L = sum(l);   % n�ײ�ֵ���ʽ

x = -5:0.1:5;
y = double(subs(L));  % L�͵��������������ʽ�������
% y1 = 1./(1+x.^2);   % ÿ�θı���Ժ���, ����ǵ��޸�!
% y1 = sin(x)./(1+x.^2);
y1 = (1-x)./(2 - cos(x) + x.^2);
plot(x,y,'k');
hold on;
plot(x,y1,'r');
grid on;
title('�����Ǹ߽��������ղ�ֵ;����Ϊԭʼ����');



