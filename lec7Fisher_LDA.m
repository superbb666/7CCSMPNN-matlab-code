function [Jw,m] = lec7Fisher_LDA(x, classx, wt)

fprintf('-----lec7 Fisher LDA-----\n');

[xrow, xcol] = size(x);
% ��ֵ
m = zeros(xrow, max(classx));
for classi = 1 : max(classx)
    m(:,classi) = mean(x(:,classx == classi),2);
end
fprintf('x����ÿ��class�ľ�ֵΪ��ÿ�У���\n'); disp(m);

% ��ֵ������
sb = ( wt * (m(:,1) - m(:,2)) )^2;
sw = sum(( wt * (x(:,classx == 1) - m(:,1)) ).^2, 2) + ...
     sum(( wt * (x(:,classx == 2) - m(:,2)) ).^2, 2);
Jw = sb ./ sw;
fprintf('sb = %f, sw = %f, Jw = %f\n', sb, sw, Jw);


end