% lec2 主函数
% clear;
clc

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

