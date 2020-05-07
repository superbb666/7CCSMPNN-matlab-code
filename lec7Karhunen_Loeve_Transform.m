
function [V_new, miu] = lec7Karhunen_Loeve_Transform(x, num)
fprintf('--- lec7 Karhunen_Loeve_Transform ---\n');
[xrow, xcol] = size(x);

% 均值
fprintf('x的均值μ为：');
miu = mean(x,2)
% 零均值数据
fprintf('零均值数据：');
x_zero = x - miu

% 协方差矩阵
fprintf('协方差数据：');
% covariance = cov(x_zero)
xxT = zeros(xrow);
for i = 1 : xcol
    xxT = xxT + x_zero(:,i) * x_zero(:,i)';
end
covariance = 1 ./ xcol .* xxT

% 特征值和特征向量
fprintf('特征值和特征向量：');
[V, E] = eig(covariance)

% 删除维度
fprintf('删除维度后的特征值和特征向量：');
E_vector = E * ones(size(E, 2), 1);  % E_vector = [0, 8, 6]
[E_aftersort, E_index]=sort(E_vector);  % E_aftersort=[0,6,8]; E_index=[1,3,2];
new_index = E_index(end-num+1:end);  % new_index=[3,2];取后两个
V_new = V(:, new_index)
E_new = E(:, new_index)

% 降维后的数据
fprintf('降维后的数据：');
y = V_new' * x_zero



end







