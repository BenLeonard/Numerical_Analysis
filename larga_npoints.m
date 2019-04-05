clc; clear;

% xnum�ǵ����仯��
xnum = [1 4 9 12 13 18];
ynum = sqrt(xnum);
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

L = sum(l)   % n�ײ�ֵ���ʽ
% ezplot(L);   % ��ֵ����ͼ��

x = input('�������ֵx = ');
fprintf('ģ����ΪL = %f\n', double(subs(L)) );
fprintf('��ʵ���ΪY = %f\n', sqrt(x));



