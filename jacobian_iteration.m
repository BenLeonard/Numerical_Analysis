% ���Է�����������: �ſ˱ȵ���"����"������Է�����
% ˵��1: �ſ˱ȵ�������B1���ж��������Ĺؼ�! B1���װ뾶(B1�ľ���ֵ��������ֵ)ҪС��1��
% ˵��2: �װ뾶ԽС(<1)�����ٶ�Խ��!  

clear; clc;

% ����ԭ������ĵ�������ر�����: ��ͬ����ÿ���޸�A��b���ɡ�
A = [10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];  % ϵ������
b = [7;14;-10;12];        % �Ⱥ��ұ߽��(�о���)
D = diag(diag(A));
E = eye(length(b));
B1 = E-inv(D)*A;    % �ſ˱ȵ�������, ����������ж��������

if det(A) == 0
    fprintf('ϵ������AΪ�������,�޷����!\n');
    return ;
end

radius = max(abs(eig(B1)));
if radius > 1
    fprintf('��ǰ����������!\n');
    return ;
else
    fprintf('�ſ˱ȵ��������װ뾶Ϊ: %.4f\n',radius);
end
    
% �������㲿��:
x = zeros(length(b),1);  % ��ʼ����3x1�ľ���(�о���)
error = double(input('�����������(����10^(-4)��0.0001):'));
count = 0;    % ����������
while 1
    tmp = B1*x + inv(D)*b;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

fprintf('���̵Ľ�Ϊ: x1 = %.4f  x2 = %.4f  x3 = %.4f\n',x(1),x(2),x(3));
fprintf('������%d��\n',count);

