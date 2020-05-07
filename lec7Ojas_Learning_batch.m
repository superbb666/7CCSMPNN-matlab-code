function lec7Ojas_Learning_batch(x, w, eta)

% 输入：w=[-θ, w1, w2]，x=[0,0; 0,1; 1,0; 1,1].'每列是sample
fprintf('-----lec7 Ojas Learning batch-----\n');
epoch = 1;
fprintf('x的均值μ为：');
miu = mean(x,2)
fprintf('零均值数据：');
x_zero = x - miu
[xrow, xcol] = size(x_zero);

for epo = 1 : epoch
    fprintf('-- epoch %d ---\n', epo);
    eta_y_xyw = zeros(xcol, xrow);
    for i = 1 : xcol
        y = w * x_zero(:,i);
        x_yw = x_zero(:,i)' - y .* w;
        eta_y_xyw(i,:) = eta .* y .* x_yw;
        fprintf('iter=%d, x=[', i); disp(x_zero(:,i)'); fprintf('%c%c',8,8);
        fprintf('], y= %.4f, x-yw=[', y); disp(x_yw); fprintf('%c%c',8,8);
        fprintf('], ηy(x-yw)=['); disp(eta_y_xyw(i,:)); fprintf('%c%c',8,8);
        fprintf(']\n');
    end
    sum_delta = sum(eta_y_xyw, 1);  % 按列求和
    w = w + sum_delta;
    fprintf('sum_delta=['); disp(sum_delta); fprintf('%c%c',8,8);
    fprintf('], w=['); disp(w); fprintf('%c%c',8,8);
    fprintf(']\n');
end




end