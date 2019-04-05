clc; clear;

x0 = 1; x1 = 4; x2 = 9;
y0 = sqrt(x0); y1 = sqrt(x1); y2 = sqrt(x2); % ����sqrt(x)������2���������ղ�ֵ(ֱ��)

syms x;

l0 = (x-x1)*(x-x2)/( (x0-x1)*(x0-x2) );  
l1 = (x-x0)*(x-x2)/( (x1-x0)*(x1-x2) );  
l2 = (x-x0)*(x-x1)/( (x2-x0)*(x2-x1) );  % 3��������
L = y0*l0 + y1*l1 + y2*l2;

x = double(input('�����������x:'));     % ��þ���[xmin,xmax]֮��
fprintf('���ƽ��Ϊ:%f\n',double(subs(L)));  % �������ʽ��ֵ
fprintf('��ʵ���Ϊ:%f\n',sqrt(x));