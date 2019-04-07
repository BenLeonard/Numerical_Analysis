% �������ι�ʽ����
% ����: ���ټ���"�ȷ�"������"ÿ��С�ݲ��϶Է�"�ļ����㷨! ����Ϊ�˼��ټ����
% ��ʽ: ֪��1�ȷֺ�, �ü��ܷ������Կ��ټ�������2^k�ȷֵĽ��
% ��f(x) = 4/(1+x^2)����Ϊ��

clear; clc

syms x;
f = 4/(1+x^2);   % ÿ�������޸Ĳ�ͬ��������

up = double(input('�����������:'));
low = double(input('�����������:'));
k = double(input('����Ŀ��Է�/���ܴ���:'));
% ��ʵ�����ֵĽ��: 
R = int(f,x,low,up);  

% �ȼ���1�ȷֵĽ��, ������ܸߵȷֶ��ǻ��ڴ��Ƴ��ģ�
x = up;
fup = double(subs(f));
x = low;
flow = double(subs(f));
Torg = (up - low)/2*(fup+flow);  % 0�ȷ�(���ι�ʽ���)

% �������μ���:
T = zeros(1,k+1);  % ��¼ÿһ�μ��ܵĽ��
T(1) = Torg;       % ��1�ȷֵķŵ���һ��, ��������ѭ��
h = up - low;  % ����ԭ��
tmp = 1;       % ��¼T�����õ�
for numk = 0:k
    fmiddle = zeros(1,2^(numk));  
    % Сѭ�������к�k�йض��Ǳ仯��!���͵�ǰnumk�й�:
    for numi = 1:2^(numk)
        x = low + (2*numi-1)*h/2^(numk+1);
        fmiddle(numi) = double(subs(f));
    end
    T(tmp+1) = 0.5*T(tmp) + h/2^(numk+1)*sum(fmiddle);
    tmp = tmp + 1;
    if tmp == k+1    % �Ѿ�����,���Խ�����
        break;
    end
end

% ���ܹ����е�һϵ�н������T��, ��ӡֻ��ʾ��󾫶���ߵ��Ǹ�T(k+1):
fprintf('�������μ���Ϊ%d�ȷֺ�,��ǰ���ƽ��Ϊ: %.7f\n',2^k,T(k+1));
fprintf('��ʵ���Ϊ: %.10f\n',R);

    
