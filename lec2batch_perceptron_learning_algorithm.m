function lec2batch_perceptron_learning_algorithm(epoch, x, classx, a, eta, sample_normalisation)
% x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1, a=[w0,w] 3x1
fprintf('-----lec2 batch_perceptron_learning_algorithm-----\n');

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
        gx = a.' * y;   % 1x3, 3x4 --> 1x4
        misclassified = zeros(size(gx));
        for i = 1 : size(gx,2)  % gx.shape = [1,4]
            if gx(i) <= 0
                misclassified(i) = 1;  % misclassified = yes
            end
        end
        for i = 1 : size(gx,2)  % gx.shape = [1,4]
            if misclassified(i) == 1
                a = a + eta * y(:,i);   % a = a + eta*¶≤y
            end
        end
        fprintf('gx=['); disp(gx); fprintf('%c%c',8,8);
        fprintf('], misclassified=['); disp(misclassified); fprintf('%c%c',8,8);
        fprintf('], a=['); disp(a.'); fprintf('%c%c',8,8);
        fprintf(']\n')
    end
elseif sample_normalisation == false
    for epochi = 1 : epoch
        fprintf('-------- epoch= %d -------\n' ,epochi);
        gx = a.' * y;   % 1x3, 3x4 --> 1x4
        misclassified = zeros(size(gx));
        for i = 1 : size(gx,2)  % gx.shape = [1,4]
            if gx(i) > 0
                gxclass = 1;
            else
                gxclass = -1;
            end
            if gxclass ~= classx(i)
                misclassified(i) = 1;  % misclassified = yes
            end
        end
        for i = 1 : size(gx,2)  % gx.shape = [1,4]
            if misclassified(i) == 1
                % w = classx(i)
                a = a + eta * classx(i) * y(:,i);  % a = a + eta*¶≤wy, w «class
            end
        end
        fprintf('gx=['); disp(gx); fprintf('%c%c',8,8);
        fprintf('], misclassified=['); disp(misclassified); fprintf('%c%c',8,8);
        fprintf('], a=['); disp(a.'); fprintf('%c%c',8,8);
        fprintf(']\n')
    end
end



end