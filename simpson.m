% ��������ɭ�����ʽ
% ˼·: �Ƚ�[a,b]������ȷ�, Ȼ��3������3��(2��)�������ղ�ֵ
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc;
format long;

syms x;
f = 4/(1+x^2);   % ÿ�������޸Ĳ�ͬ��������

up = double(input('�����������:'));
low = double(input('�����������:'));
% ��ʵ�����ֵĽ��: 
R = int(f,x,low,up);  

x = up;
fup = double(subs(f));   % �϶˵�ֵ 
x = low;
flow = double(subs(f));  % �¶˵�ֵ
x = (up + low)/2;
fmiddle = double(subs(f));  % �м��ֵ

% ����ɭ�����ʽ���ƽ��:
S = (up-low)/6*(fup + 4*fmiddle + flow);
fprintf('����ɭ�����ʽ���ƽ��Ϊ: %.7f\n',S);
fprintf('��ʵ���Ϊ: %.7f\n',R);
