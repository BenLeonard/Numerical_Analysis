clear; clc;

x0 = 4; x1 = 9;
y0 = sqrt(x0); y1 = sqrt(x1);

syms x;

f01 = (y0 - y1)/(x0 - x1);  % 0,1����һ�ײ���f01
N = y0 + f01*(x-x0);

x = double(input('�����������x = '));    % ��þ���[xmin,xmax]֮��
fprintf('���ƽ��N = %f\n',double(subs(N)));  % �������ʽ��ֵ
fprintf('��ʵ���Y = %f\n',sqrt(x));

