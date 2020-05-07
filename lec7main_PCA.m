% lec7 主函数
% clear;
clc

% x = [1,2,1; 2,3,1; 3,5,1; 2,2,1]';
% num = 2;  % 缩减到几维的，比如缩减到两个主成分
% x = [4,2,2; 0,-2,2; 2,4,2; -2,0,2]';
% num = 2;
x = [0,1;3,5;5,4;5,6;8,7;9,7]';
num = 1;
% Ojas 数据
w = [-1,0];
eta = 0.01;
% Fisher LDA 数据
x = [1,2; 2,1; 3,3; 6,5; 7,8]';
classx = [1,1,1,2,2];
% wt = [-1,5];
wt = [2,-3];

lec7Karhunen_Loeve_Transform(x, num);
% lec7Ojas_Learning_batch(x, w, eta);
% lec7Fisher_LDA(x, classx, wt);



