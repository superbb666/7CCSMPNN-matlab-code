
function [V_new, miu] = lec7Karhunen_Loeve_Transform(x, num)
fprintf('--- lec7 Karhunen_Loeve_Transform ---\n');
[xrow, xcol] = size(x);

% ��ֵ
fprintf('x�ľ�ֵ��Ϊ��');
miu = mean(x,2)
% ���ֵ����
fprintf('���ֵ���ݣ�');
x_zero = x - miu

% Э�������
fprintf('Э�������ݣ�');
% covariance = cov(x_zero)
xxT = zeros(xrow);
for i = 1 : xcol
    xxT = xxT + x_zero(:,i) * x_zero(:,i)';
end
covariance = 1 ./ xcol .* xxT

% ����ֵ����������
fprintf('����ֵ������������');
[V, E] = eig(covariance)

% ɾ��ά��
fprintf('ɾ��ά�Ⱥ������ֵ������������');
E_vector = E * ones(size(E, 2), 1);  % E_vector = [0, 8, 6]
[E_aftersort, E_index]=sort(E_vector);  % E_aftersort=[0,6,8]; E_index=[1,3,2];
new_index = E_index(end-num+1:end);  % new_index=[3,2];ȡ������
V_new = V(:, new_index)
E_new = E(:, new_index)

% ��ά�������
fprintf('��ά������ݣ�');
y = V_new' * x_zero



end







