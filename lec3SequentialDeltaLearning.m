function lec3SequentialDeltaLearning(w, x, target, eta)

% 输入：w=[-θ, w1, w2]，x=[0,0; 0,1; 1,0; 1,1].'每列是sample
fprintf('-----Sequential Delta Learning-----\n');
epoch = 5;
[xrow, xcol] = size(x);
x_argu = [ ones(1, xcol) ; x ];
for epo = 1 : epoch
    fprintf('-- epoch %d ---\n', epo);
    for i = 1 : xcol
        wx = w * x_argu(:,i);
        y = Heaviside(wx);
        t_y = target(i) - y;
        delta = eta * t_y * x_argu(:,i)';
        w = w + delta;
        fprintf('iter=%d, x=[', i); disp(x_argu(:,i)'); fprintf('%c%c',8,8);
        fprintf('], t= %d, y= %d, t-y= %d, delta=[', target(i), y, t_y);
        disp(delta); fprintf('%c%c',8,8);
        fprintf('], w=['); disp(w); fprintf('%c%c',8,8);
        fprintf(']\n');
    end
end




end