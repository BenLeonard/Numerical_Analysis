clear; clc;

x0 = 1; x1 = 4; x2 = 9;
y0 = sqrt(x0); y1 = sqrt(x1); y2 = sqrt(x2); % ����sqrt(x)������2���������ղ�ֵ(ֱ��)

syms x;

f01 = (y0 - y1)/(x0 - x1);  % 0 1����һ�ײ���
f12 = (y1 - y2)/(x1 - x2);  % 1 2����һ�ײ���
f012 = (f01 - f12)/(x0 - x2);  % 0 1 2������ײ���

N = y0 + f01*(x-x0) + f012*(x-x0)*(x-x1);

x = double(input('�����������x = '));    % ��þ���[xmin,xmax]֮��
fprintf('���ƽ��N = %f\n',double(subs(N)));  % �������ʽ��ֵ
fprintf('��ʵ���Y = %f\n',sqrt(x));