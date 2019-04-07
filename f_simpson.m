% n�㸴������ɭ��ʽ�������ܣ��ȸ������θ�׼��
% ˼·: �Ƚ�[a,b]����n�ȷ�, Ȼ��ÿ������ٲ���һ�����Ľڵ㣡ÿһ��3������3��(2��)�������ղ�ֵ
% ����: ����߽�ţ��-�ƴ�(�߽�)��������������, ��˵ȷ�Խ��Խ��!
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc;

syms x;
f = 4/(1+x^2);   % ÿ�������޸Ĳ�ͬ��������

up = double(input('�����������:'));
low = double(input('�����������:'));
n = double(input('����������n�ȷ�(ż��):'));
m = n/2;
% ��ʵ�����ֵĽ��: 
R = int(f,x,low,up); 

fmiddle1 = zeros(1,m);    % �Դ������е�һ��ļ�¼
fmiddle2 = zeros(1,m-1);  % �Դ������еڶ���ļ�¼
for num1 = 1:m
    x = low + (2*num1-1)*(up-low)/(2*m);
    fmiddle1(num1) = double(subs(f));
end

for num2 = 1:m-1
    x = low + (2*num2)*(up-low)/(2*m);
    fmiddle2(num2) = double(subs(f));
end

x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
% �������ι�ʽ���ƽ��:
FS = (up-low)/(6*m)*( flow + 4*sum(fmiddle1) + 2*sum(fmiddle2) + fup ); 

fprintf('�������������ʽ���ƽ��Ϊ: %.7f\n',FS);
fprintf('��ʵ���Ϊ: %f\n',R);
    

