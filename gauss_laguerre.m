% ���������ֵ�ڵ�ĸ�˹-���Ƕ������ʽ:
% ˵������Ϣͬ��˹-���õ�
% �ô�: ԭʼ����������ʽ�б�����һ��exp(-x)��! ��f(x) = exp(-x)*g(x)
% ע��: ���Ƽ���ʱ�õ���g(x)! ��Ai*g(xi)! ǰ���Ǹ�exp(-x)�ڽ��Ƽ������ǲ��õ�!

clear; clc;
format long;

syms x;
n = double(input('����ʹ�ü���(n)�ĸ�˹-���Ƕ���ֵ:'));
% n���ֵ�ĸ�˹-���Ƕ�����ʽP:
f = exp(-x)*x^n;
fprintf('%d���˹-���Ƕ�����ʽΪ:\n',n)
L = vpa( exp(x) * diff(f,x,n) )
% n���˹-���Ƕ���ֵ�ڵ�Xi:
Xi = sort(double(solve(L)))';

% n���˹-���Ƕ���ֵ�ڵ��Ӧ�Ĳ�ֵϵ��Ai:
xnum = Xi;
% l������¼�������ն���ʽ��: n���������ղ�ֵ����ʽ��n��������! 
% ��˹-���Ƕ����ϵ�����Ƕ�"ÿ������ʽ/������"����[0 +inf]�����֡���
% ��ֵ����������ʽ/���������������ϵ������һ�����໥��Ӧ��
l = sym(zeros(1,n));  
Ai = zeros(1,n);
for m = 1:n
    l(m) = prod(x - xnum([1:m-1 m+1:n]))/prod(xnum(m) - xnum([1:m-1 m+1:n])); 
    l_tmp = exp(-x)*l(m);
    Ai(m) = double(int(l_tmp,x,0,+inf));
end

fprintf('%d���˹-���Ƕ���ֵ�ڵ�Ϊ:\n',n);
Xi
fprintf('%d���˹-���Ƕ���ֵ�ڵ��Ӧ��ϵ��Ϊ:\n',n);
Ai


% �Ծ��庯���Ļ��ֽ���: ��˹-���Ƕ������޺ܼ�,������[0,+inf]
syms t;
gt = sin(t);    % ÿ���޸�����ĺ�������, ע��exp(-t)��һ�������
y = exp(-t)*gt;   
up = +inf;
low = 0;
R = int(y,t,low,up);  % ʵ�ʽ��

Result = 0;  % ��¼���ս��ƽ��
for num = 1:n
    t = Xi(num);
    y_tmp = double(subs(gt));
    Result = Result + Ai(num)*y_tmp;
end

fprintf('%d���˹-���Ƕ����ֽ��ƽ��Ϊ:%.10f\n', n, Result);
fprintf('��ʵ���Ϊ:%.10f\n', R);



