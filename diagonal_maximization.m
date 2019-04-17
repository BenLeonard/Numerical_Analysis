clear ; clc;

% ���̵�ϵ��������Ҷ���
A = [1 2 3 1;1 4 6 2;2 9 8 3;3 7 7 2]
b = [3;2;7;12];

% --------------------�Խ����------------------ %
% ��ȡϵ������ĳߴ�
[row,col] = size(A);
% ������¼��x�ı仯˳��: ������ԭʼ˳��, ������A�ĵ���������; 
% �����������ٽⷽ�̵õ���x, Ҫ��������������˳�����Ų���ԭ��������Ԫ�ض�Ӧ�Ľ�
xx = [1:col]';  % һ��col��δ֪��(ͨ��)

% ÿ���н���ʱbҪ���ű�
% ÿ���н���ʱxҪ���ű�
flag = 1;
while 1
    Atmp = abs(A); % Atmp�ߴ粻�ϱ�С: ��Ϊǰ�����޸ĵ�һ��һ�в�Ӱ�����
    [maxrow,maxcol] = find( Atmp == max(max(Atmp(flag:row,flag:col))) ); % ����ֵ���ֵ����
    maxrow = maxrow(end);
    maxcol = maxcol(end);  % ���ж����ͬ���ֵ�����, ͳһȡ���һ��
    % ����: bһ�� 
    A([flag maxrow],:) = A([maxrow flag],:);
    b([flag maxrow],1) = b([maxrow flag],1);
    % ����: xһ��
    A(:,[flag maxcol]) = A(:,[maxcol,flag]);
    xx([flag maxcol],1) = xx([maxcol flag],1);
    
    flag = flag + 1;
    if flag > row-1
        break;
    end
end

% --------------------���¶�����------------------ %
D = diag(diag(A));
L = tril(A,-1);     % ��������һ�����������;
U = triu(A,1);      % ��������һ�����������;
B2 = -inv(D+L)*U;   % ���¶���������, ����������ж��������;

if det(A) == 0
    fprintf('ϵ������AΪ�������,�޷����!\n');
    return ;
end

radius = max(abs(eig(B2)));  % ����ֵ�п���Ϊ����, absȡ����ֵ + ȡģ
if radius > 1
    fprintf('��ǰ����������!\n');
    return ;
else
    fprintf('���¶����������װ뾶Ϊ: %.4f\n',radius);
end
    
% �������㲿��:
x = zeros(length(b),1);  % ��ʼ����4x1�ľ���(�о���)
error = double(input('�����������(����10^(-4)��0.0001):'));
count = 0;    % ����������
while 1
    tmp = B2*x + inv(D+L)*b;
    if max(abs(tmp - x)) < error
        break;
    end
    x = tmp;
    count = count + 1;
end

% --------------------�����(˳��Ҫ��һ��)------------------ %
x = x';
x_result = zeros(1,4);
for n = 1:length(x)
    x_result( xx(n) ) = x(n);
end
    
fprintf('���̵Ľ�Ϊ: x1 = %.4f  x2 = %.4f  x3 = %.4f  x4 = %.4f\n',x_result(1),x_result(2),x_result(3),x_result(4));
fprintf('������%d��\n',count);

