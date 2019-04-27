clear; clc;
format short;

% Ψһ��:
A = [5 2 0;-1 4 2;2 -3 10];
b = [3;-3;15];

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

% Ψһ��: 
x0 = Aplus*b;


