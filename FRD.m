% ���ȷֽ�: A = FG
% ����A��m*n, ��Ϊr; ��F��m*r, ��Ϊr; G��r*n, ��ҲΪr
% ���ȷֽⲻ��Ψһ�ģ�����һ�������������ַ���

clear ; clc;

A = [1 5 1 3;1 2 -1 2;-1 -2 -2 1];
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

% �ж����ȷֽ���������Ƿ��ԭ����һ��: 1��һ��, 0�ǲ�һ��
isequal(A,F*G)
        

