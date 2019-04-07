% n�㸴�������ʽ�������ܣ�
% ˼·: �Ƚ�[a,b]����n�ȷ�, Ȼ��ÿ������������������ղ�ֵ�����ֶ����Բ�ֵ���ѡ�
% ����: ����߽�ţ��-�ƴ�(�߽�)��������������, ��˵ȷ�Խ��Խ��!
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc;

syms x;
f = 4/(1+x^2);   % ÿ�������޸Ĳ�ͬ��������

up = double(input('�����������:'));
low = double(input('�����������:'));
n = double(input('���������伸�ȷ�:'));
% ��ʵ�����ֵĽ��: 
R = int(f,x,low,up); 

xnum = low:(up-low)/n:up;
fmiddle = zeros(1,n-1);  % ���м���Щ����ļ�¼
for num = 1:n-1
    x = low + num*(up-low)/n;
    fmiddle(num) = double(subs(f));
end

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
% �������ι�ʽ���ƽ��:
FT = (up-low)/(2*n)*( flow + 2*sum(fmiddle) + fup ); 

fprintf('�������������ʽ���ƽ��Ϊ: %.7f\n',FT);
fprintf('��ʵ���Ϊ: %f\n',R);
    

