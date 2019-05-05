clear; clc;

% δ֪��: 
syms x1 x2;

% ������: ͳһ��������
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
x = [x1;x2];
f = [f1;f2];

% ��ʼֵ: ͳһ��������
x0 = [5;4];
error_sk = double( input('sk�����ľ���:') );
error_fkk = double( input('fkk�����ľ���:') );
num = input('ֹͣ��������:');

% ֱ�����Դ��������ſ˱Ⱦ���:
jacobi = jacobian([f1,f2],[x1,x2]);

% ��ʼ���ǰ�ĳ�ֵ:
Bk = inv( double( subs(jacobi,x,x0) ) );
fk = double( subs(f,x,x0) );

for k = 1:num
    sk = -Bk*fk;
    x0 = x0 + sk;
    fkk = double( subs(f,x,x0) );
    if norm(sk) < error_sk | norm(fkk) < error_fkk 
        break;
    end
    yk = fkk - fk;
    Bkk = Bk + (sk-Bk*yk)*(sk-Bk*yk)'/((sk-Bk*yk)'*yk);
    fk = fkk;
    Bk = Bkk;
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
fprintf('sk����:%f\n',norm(sk));
fprintf('fkk����:%f\n',norm(fkk));
