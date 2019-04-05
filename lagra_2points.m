clc; clear;

x0 = 1; x1 = 2;
y0 = sqrt(x0); y1 = sqrt(x1);  % ����sqrt(x)������2���������ղ�ֵ(ֱ��)

syms x;

l0 = (x-x1)/(x0-x1);  
l1 = (x-x0)/(x1-x0);  % ����������
L = y0*l0 + y1*l1;

x = double(input('�����������x:'));    % ��þ���[xmin,xmax]֮��
fprintf('���ƽ��Ϊ:%f\n',double(subs(L)));  % �������ʽ��ֵ
fprintf('��ʵ���Ϊ:%f\n',sqrt(x));

figure(1);
x = 0:0.01:2;
plot(x,sqrt(x))
hold on;
