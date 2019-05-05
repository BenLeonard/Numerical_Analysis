clear ; clc

% δ֪��: 
syms x1 x2;

% ������: ͳһ��������
f1 = x1^2 - 10*x1 + x2^2 + 8;
f2 = x1*x2^2 + x1 - 10*x2 + 8;
% f1 = 4*x1 - x2 + 0.1*exp(x1)-1;
% f2 = -x1 + 4*x2 + 1/8*x1^2;
x = [x1;x2];
f = [f1;f2];

% ��ʼֵ: ͳһ��������
x0 = [1;2];
error_dxk = double( input('dxk�����ľ���:') );
error_fkk = double( input('fkk�����ľ���:') );
num = input('ֹͣ��������:');

% jacobi1 = [diff(f1,x1) diff(f1,x2);diff(f2,x1) diff(f2,x2)]
% ֱ�����Դ��������ſ˱Ⱦ���:
jacobi = jacobian([f1,f2],[x1,x2]);

for k = 1:num
    Ak = double( subs(jacobi, x, x0) );
    bk = double( subs(f, x, x0) );
    dxk = pre_seidel(Ak,-bk,k);  % ����
    x0 = x0 + dxk;
    fkk = double( subs(f, x, x0) );  % ���������ж�
    if norm(dxk) < error_dxk | norm(fkk) < error_fkk
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
fprintf('dxk����:%f\n',norm(dxk));
fprintf('fkk����:%f\n',norm(fkk));
    
    


