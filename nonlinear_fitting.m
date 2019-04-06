% �������ʽ������ݵ�, ��Ȼ��ò�Ҫ����6��

clear; clc;

% �����޸�ԭʼ�۲�����:
xnum = 1:10;
ynum = [3.8 6.3 7.9 8.6 9.2 9.5 9.7 9.9 10.1 10.2];

m = double(input('��Ͻ���m = '));
n = length(xnum);

% �Ⱥ���߾���: ÿ��Ԫ�ص��� = row + col -2
A = zeros(m+1,m+1);
for row = 1:m+1
    for col = 1:m+1
        A(row,col) = sum(xnum.^(row+col-2));
    end
end

% �Ⱥ��ұ߾���: һ��m+1��
B = zeros(m+1,1);
for num = 1:m+1
    B(num,1) = sum((xnum.^(num-1)).*ynum);
end

% ����ʽϵ��/�������:
a = inv(A)*B;

syms x;
ytmp = sym(zeros(1,m+1));
for num = 1:num
    ytmp(num) = x^(num-1);
end
fprintf('��Ͻ��Ϊ:\n');
y = vpa(sum(ytmp.*a'),6)   % ��ϵĶ���ʽ���

figure(1);
scatter(xnum,ynum);
hold on;
x = min(xnum):0.1:max(xnum);
y = double(subs(y));
plot(x,y);
grid on;
xlabel('x'); ylabel('y');
title('ԭ��Ϊ������;ʵ��Ϊ����ʽ��Ͻ��');