function lec8SVM(x, y)

fprintf('-----lec8 SVM -----\n');

syms lmb1 lmb2 lmb3 lmb4 lmb5 lmb6 w0
syms x1 x2 x3 x4
lmb = [lmb1, lmb2, lmb3, lmb4, lmb5, lmb6];
lmb = lmb(1: size(y,2));  % ɾ������Ҫ��lambda
sym_x = [x1, x2, x3, x4];
sym_x = sym_x(1: size(x, 1)).';  % ȷ��x�����Թ��м���

w = x * (lmb .* y).';  %2x1���󣬶�w�󵼹�ʽ
% w2 = lmb1*y(1)*x(:,1) + lmb2*y(2)*x(:,2) + lmb3*y(3)*x(:,3) + lmb4*y(4)*x(:,4) 
% hyperplane = w' * x + w0;  % 1x4����
y_wxw0_1 = y .* (w.' * x + w0) - 1;  % 1x4����4������
lmb_y = sum(lmb .* y);  % 1������

% �ⷽ��
% [lmb1, lmb2, lmb3, lmb4, w0] = solve([y_wxw0_1==0, lmb_y]==0)
solution = solve([y_wxw0_1==0, lmb_y]==0);

% ���ṹ���ڲ�syms��Ϊdouble
fileds = fieldnames(solution);
allsyms = cell(1, length(fileds));
allvalues = zeros(1, length(fileds));
for i=1:length(fileds)
    k = fileds(i);
    key = k{1};  % ��������
    solution.(key) = double( solution.(key) );  %����ֵ��Ϊdouble��
    allsyms{i} = key;
    allvalues(i) = solution.(key);
end
hyperplane = w.' * sym_x + w0;  % 1x4����
hyperplane_after = subs(hyperplane, allsyms, allvalues);


% ������
fprintf('lmbda���У�\n');disp(lmb);
fprintf('w����Ϊ��\n');disp(w);
fprintf('y(wx+w0)-1����Ϊ��\n');disp(y_wxw0_1.');
fprintf('��lmbda*y����Ϊ��\n');disp(lmb_y);
fprintf('�ⷽ�̱������Ϊ��\n');disp(solution);
fprintf('hyperplane��ƽ��Ϊ��\n');disp(vpa(hyperplane_after==0));

end