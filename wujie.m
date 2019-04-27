clear; clc;
format short;

% �޽�:
A = [2 4 1 1;1 2 -1 2;-1 -2 -2 1];
b = [10;6;-7];

r = rank(A);         % ��¼A������r 
[row,col] = size(A); % ��¼A�ĳߴ�

H = rref(A);    % A���������ʽH
G = H(1:r,:);   % ȡ�������ʽǰ��r��

col_list = [];  % ��¼�������ʽ�и�����Ԫ1��Ӧ���к�
num = 1;        % һ��������
for m = 1:row
    for n = m:col
        if H(m,n) == 1
            col_list(num) = n;
            num = num + 1;
            break;
        end
    end
end
F = A(:,col_list);  % �����¼���к�����Ӧ��A�е���Щ��

% ����Ӻ���: 
Aplus = G'*inv(G*G')*inv(F'*F)*F';
[row_Aplus, col_Aplus] = size(Aplus);  % ����I��ҪAplus������

% ȫ����С���˽�: �ȴ�����δ֪������һ���ı���y
y = sym(zeros(col,1));
for m = 1:col
    y(m) = ['x' num2str(m)]; 
end 
x = Aplus*b + ( eye(row_Aplus) - Aplus*A )*y;

% Ψһ��С������С���˽�: 
x0 = Aplus*b;




