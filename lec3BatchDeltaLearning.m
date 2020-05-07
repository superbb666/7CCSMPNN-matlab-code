function lec3BatchDeltaLearning(w, x, target, eta)

% 输入：w=[-θ, w1, w2]，x=[0,0; 0,1; 1,0; 1,1].'每列是sample
fprintf('-----Batch Delta Learning-----\n');
epoch = 5;
[xrow, xcol] = size(x);
x_argu = [ ones(1, xcol) ; x ];

for epo = 1 : epoch
    fprintf('-- epoch %d ---\n', epo);
    delta = zeros(xcol, xrow+1);
    for i = 1 : xcol
        wx = w * x_argu(:,i);
        y = Heaviside(wx);
        t_y = target(i) - y;
        delta(i,:) = eta * t_y * x_argu(:,i)';
        fprintf('iter=%d, x=[', i); disp(x_argu(:,i)'); fprintf('%c%c',8,8);
        fprintf('], t= %d, y= %d, t-y= %d, delta=[', target(i), y, t_y);
        disp(delta(i,:)); fprintf('%c%c',8,8);
        fprintf(']\n');
    end
    sum_delta = sum(delta, 1);  % 按列求和
    w = w + sum_delta;
    fprintf('sum_delta=['); disp(sum_delta); fprintf('%c%c',8,8);
    fprintf('], w=['); disp(w); fprintf('%c%c',8,8);
    fprintf(']\n');
end




end