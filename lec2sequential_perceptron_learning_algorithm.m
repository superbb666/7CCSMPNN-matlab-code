function lec2sequential_perceptron_learning_algorithm(epoch, x, classx, a, eta, sample_normalisation)
% x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1, a=[w0,w] 3x1
fprintf('-----lec2 sequential_perceptron_learning_algorithm-----\n');

x1 = ones(1, size(x,2));
y = [x1;x];  % y=[1 x1, x2], 3x4
if sample_normalisation == true
    for i = 1 : length(classx)
        if classx(i) < 0
            y(:,i) = -1 * y(:,i);
        end
    end
    for epochi = 1 : epoch
        fprintf('-------- epoch= %d -------\n' ,epochi);
        for i = 1 : size(y,2)
            gx = a.' * y(:,i);   % 1x3, 3x1 --> 1x1
            if gx <= 0
                a = a + eta .* y(:,i);  % a = a + eta*y
            end
        end
        fprintf('iter=%d, gx=[', i); disp(gx); fprintf('%c%c',8,8);
        fprintf('], a=['); disp(a.'); fprintf('%c%c',8,8);
        fprintf(']\n')
    end
elseif sample_normalisation == false
    for epochi = 1 : epoch
        fprintf('-------- epoch= %d -------\n' ,epochi);
        for i = 1 : size(y,2)
            gx = a.' * y(:,i);   % 1x3, 3x1 --> 1x1
            if gx > 0
                gxclass = 1;
            else
                gxclass = -1;
            end
            w = classx(i);
            if gxclass ~= w
                a = a + eta .* w .* y(:,i);   % a = a + eta*w*y, w «class
            end
            fprintf('iter=%d, gx=[', i); disp(gx); fprintf('%c%c',8,8);
            fprintf('],  w%d= %d, a=[', i, w); disp(a.'); fprintf('%c%c',8,8);
            fprintf(']\n')
        end
    end
end


end