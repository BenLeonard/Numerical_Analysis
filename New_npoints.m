clear; clc;

xnum = [1 4 9 12 13 18];
ynum = sqrt(xnum);
syms x N;

n = length(xnum);
f = sym(zeros(1,n));  % ���̵ļ�¼

for m = 1:n
    f(m) = 