function lec2sequential_WidrowHoff_learning_algorithm(epoch, x, classx, a, eta, b)
% x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1, a=[w0,w] 3x1
fprintf('-----lec2 sequential_WidrowHoff_learning_algorithm-----\n');

x1 = ones(1, size(x,2));
y = [x1;x];  % y=[1 x1, x2], 3x4
for i = 1 : length(classx)
    if classx(i) < 0
        y(:,i) = -1 * y(:,i);
    end
end
for epochi = 1 : epoch
    fprintf('-------- epoch= %d -------\n' ,epochi);
    for i = 1 : size(y,2)
        atyk = a.' * y(:,i);   % 1x3, 3x1 --> 1x1
        a = a + eta .* (b(i) - atyk) .* y(:,i);  % a = a + eta*y
        fprintf('iter=%d, y=[', i); disp(y(:,i).'); fprintf('%c%c',8,8);
        fprintf('], atyk=%f, a=[', atyk); disp(a.'); fprintf('%c%c',8,8);
        fprintf(']\n')
    end
end

end