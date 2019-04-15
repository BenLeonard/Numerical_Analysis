clear ; clc;

% ÿ���޸�����ķ�����ز���:
A = [1 2 4;2 1 1;1 1 2;1 -1 -2];
b = [-1;4;2;1];

zg = [A,b];  % �������: �����ж��õ�
if rank(zg) > rank(A)
    fprintf('����������!\n');
else
    return ;
end

fprintf('��С���˽�����⿪ʼ:\n');
% ������� + ����������: 
x = inv(A'*A)*A'*b; 
error = (b(1) - sum(A(1,:).*x'))^2 + (b(2) - sum(A(2,:).*x'))^2 + (b(3) - sum(A(3,:).*x'))^2; 

fprintf('���̽��ƽ�Ϊ: x1 = %.4f  x2 = %.4f  x3 = %.4f\n', x(1),x(2),x(3));
fprintf('��������(��С)���Ϊ: error = %.4f\n',error);