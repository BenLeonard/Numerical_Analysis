clear ; clc;

% δ֪��: 
syms x1 x2;

% ������: ͳһ��������
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
x = [x1;x2];
f = [f1;f2];

% ��ʼֵ: ͳһ��������
x0 = [5;4];
error_z = double( input('z�����ľ���:') );
error_fk = double( input('fk�����ľ���:') );
num = input('ֹͣ��������:');

% ֱ�����Դ��������ſ˱Ⱦ���:
jacobi = jacobian([f1,f2],[x1,x2]);

% Сѭ��mȡ���ٵ��ж�: �ͷ��̸���N�й�,��w�����ֵ
syms M N;
mn0 = [N;M];
% ����xzn�Ƿ��̵ĸ���:
xzn = length(x);  
% ԭʼ��Ч�ʶԱȷ���:
w = (N+1)*log(M+1)/( (N+M)*log(2) ); 
% ��w���������ֵ��xzmֵ:
xzm = double( solve( diff( subs(w,N,xzn),M ) ) );
mn1 = [xzn;xzm];
% ���Ч��ֵ:
wax = double( subs(w,mn0,mn1) );

% ��ʼ����ţ�ٵ���:
xki = x0;
for k = 1:num
    fk = double( subs(f,x,x0) );
    Ak = inv( double( subs(jacobi, x, x0) ) );
    for m = 1:round(xzm)
        b = fk;
        x0 = x0 - Ak*b;
        fki = double( subs(f,x,x0) );
        fk = fki;
        z = Ak*b;    
    end
    if norm(z) < error_z | norm(fk) < error_fk
        break;
    end
end

if k < num
    x_result = x0;
    fprintf('�����Ѵ�Ҫ�󣬵�����ǰ����!\n');
    fprintf('%d�ε�����, ���ƽ�Ϊ:\n',k);
    x_result
else
    x_result = x0;
    fprintf('���������Ѵ�����!\n');
    fprintf('�ƽ�Ϊ:\n',k);
    x_result
end

fprintf('f1���Ϊ:%f\n',double( subs(f1,x,x0) ));
fprintf('f2���Ϊ:%f\n',double( subs(f2,x,x0) ));
fprintf('z����:%f\n',norm(z));
fprintf('fk����:%f\n',norm(fk));