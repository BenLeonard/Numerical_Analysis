% �������������ʽ
% ˼·: ��"2���������ղ�ֵ����ʽ"���汻������f(x)
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc
format long;

syms x;
f = 4/(1+x^2);   % ÿ�������޸Ĳ�ͬ��������

up = double(input('�����������:'));
low = double(input('�����������:'));
% ��ʵ�����ֵĽ��: 
R = int(f,x,low,up);  

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));

% ���������ʽ���ƽ��:
T = (up - low)/2*(fup+flow);
fprintf('���������ʽ���ƽ��Ϊ: %f\n',T);
fprintf('��ʵ���Ϊ: %.8f\n',R);
