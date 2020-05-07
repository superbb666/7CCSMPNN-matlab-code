% lec3 Ö÷º¯Êý
% clear;
clc

% wx = [1,2,3;-1,-2,0];
% y = Heaviside(wx)

% xita = -0.5;
% w = [-xita, 1,1];
% x = [0,0 ; 0,1 ; 1,0 ; 1,1]';
% target = [0,0,0,1];
w = [-1.5, 2];
x = [0;1]';
target = [1,0];
% xita = -1;
% w = [-xita, 0,0];
% x = [0,2 ; 1,2 ; 2,1 ; -3,1 ; -2,-1 ; -3,-2]';
% target = [1,1,1,0,0,0];


eta = 1;
% lec3SequentialDeltaLearning(w, x, target, eta)
lec3BatchDeltaLearning(w, x, target, eta)
