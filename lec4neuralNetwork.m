function lec4neuralNetwork(x, wji, wj0, wkj, wk0)

% 输入：w=[-θ, w1, w2]，x=[0,0; 0,1; 1,0; 1,1].'每列是sample
fprintf('-----lec4 neural Network-----\n');
input_x = x;  % input_x = f(x)
hidden_x = wji * input_x + wj0;
hidden_y = Symmetric_sigmoid(hidden_x);  % hidden_y = f(x)
output_x = wkj * hidden_y + wk0;
output_z = Logarithmic_sigmoid(output_x);  % output_z = f(x)
output_z





%{
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
%}



end