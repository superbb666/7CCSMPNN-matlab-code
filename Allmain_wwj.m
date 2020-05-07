%% 所有函数汇总
% 7CCSMPNN 用于备考的所有程序
% made by superbb666 04/05/2020
clear;
clc

lec = zeros(1, 10);
% lec = ones(1, 10);
lec(1) = 1;


%% lec1
if lec(1) == 1
%% 评分矩阵
    lec1confusion_matrix(15, 0, 0, 3);  % tp, fp, fn, tn
end

%% lec2
if lec(2) == 1
%% 已知w, x, w0求gx
    w =[2,1].';
    x = [2,2].';
    w0 = -5;
    lec2givewxw0_cal_gx(w, x, w0);

%% batch_perceptron和sequential_perceptron
    x = [5,1; 5,-1; 7,0; 3,0; 2,1; 1,-1].';
    classx = [1, 1, 1, -1, -1, -1];
    a = [-25, 5, 2].';
    eta = 1;
    sample_normalisation = false;
    epoch = 5;
    % x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1, a=[w0,w] 3x1
    lec2batch_perceptron_learning_algorithm(epoch, x, classx, a, eta, sample_normalisation);
    lec2sequential_perceptron_learning_algorithm(epoch, x, classx, a, eta, sample_normalisation);

%% multiclass
    x = [1,1; 2,0; 0,2; -1,1; -1,-1].';
    classx = [1,1,2,2,3];
    a = [0,0,0; 0,0,0; 0,0,0].'; 
    eta = 1;
    epoch = 5;
    % x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1,a=[a1 a2] 3x2, a1=[w0,w] 3x1, a2: 3x1, a3: 3x1
    lec2multiclass_sequential_perceptron_learning_algorithm(epoch, x, classx, a, eta);
    
%% WidrowHoff
    x = [0,2; 1,2; 2,1; -3,1; -2,-1; -3,-2].';
    classx = [1, 1, 1, -1, -1, -1];
    a = [1, 0, 0].';
    eta = 0.1;
    epoch = 5;
    b = [1, 1, 1, 1, 1, 1];
    % x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1,a=[a1 a2] 3x2, a1=[w0,w] 3x1, a2: 3x1, a3: 3x1
    lec2sequential_WidrowHoff_learning_algorithm(epoch, x, classx, a, eta, b)
end

%% lec3
if lec(3) == 1
%% Batch& Sequential Delta Learning
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
end

%% lec4
if lec(4) == 1
%% neural Network
    x = [1,0,1,0; 0,1,0,1; 1,1,0,0]';
    wji = [-0.7057, 1.9061, 2.6605, -1.1359; 0.4900, 1.9324, -0.4269, -5.1570; 0.9438, -5.4160, -0.3431, -0.2931];
    wj0 = [4.8432; 0.3973; 2.1761];
    wkj = [-1.1444, 0.3115, -9.9812; 0.0106, 11.5477, 2.6479];
    wk0 = [2.5230; 2.6463];
    
    lec4neuralNetwork(x, wji, wj0, wkj, wk0);
%% RBF neural Network
    % x = [0,0; 0,1; 1,0; 1,1]';
    % c = [0,0; 1,1];
    % pmax = norm(c(1,:)-c(2,:)); % sqrt(sum((c(1,:)-c(2,:)).^2));


    % lec4RBFneuralNetwork(x, wji, wj0, wkj, wk0);
end

%% lec5
if lec(5) == 1
    fprintf('--------lec5这章没有考-----------\n');
end

%% lec6
if lec(6) == 1
%% GAN生成对抗网络
    lec6GAN();  % 需要内部修改
end

%% lec7
if lec(7) == 1
%% Karhunen Loeve Transform PCA分析
    % x = [1,2,1; 2,3,1; 3,5,1; 2,2,1]';
    % num = 2;  % 缩减到几维的，比如缩减到两个主成分
    % x = [4,2,2; 0,-2,2; 2,4,2; -2,0,2]';
    % num = 2;
    x = [0,1;3,5;5,4;5,6;8,7;9,7]';
    num = 1;
    lec7Karhunen_Loeve_Transform(x, num);
%% Ojas 数据
    w = [-1,0];
    eta = 0.01;
    lec7Ojas_Learning_batch(x, w, eta);
%% Fisher LDA 数据
    x = [1,2; 2,1; 3,3; 6,5; 7,8]';
    classx = [1,1,1,2,2];
    % wt = [-1,5];
    wt = [2,-3];
    lec7Fisher_LDA(x, classx, wt);
end

%% lec8
if lec(8) == 1
%% SVM支持向量机
    x = [1,1; 1,-1; -1,1; -1,-1].'; 
    y = [1,1,-1,-1];  % one-one SVM
%     x = [5,1; 5,-1; 3,0].';
%     y = [1,1,-1];
%     x = [3,3; -1,-2].';
%     y = [1,-1];
    lec8SVM(x, y);
end

%% lec9
if lec(9) == 1
%% ENSEMBLE METHOD
    x = [1,0; -1,0; 0,1; 0,-1]'; 
    y = [1,1,-1,-1];  % y已被观察所以其实不需要
    h = [1,  -1,  -1,  -1; 
         -1,  1,  1,  1; 
         1,  -1,  1,  1; 
         -1,  1,  -1,  -1; 
         1,  1,  -1,  1; 
         -1,  -1,  1,  -1; 
         -1,  -1,  -1,  1; 
         1,  1,  1,  -1];  % 每行是观察法存储的误分类，1为正确分类，-1为错误分类
    lec9ENSEMBLE(x, y, h);
end

%% lec10
if lec(10) == 1
    fprintf('------lec10 我懒得写了------\n');
end




 

    
    
    
    
    
    
    
    
