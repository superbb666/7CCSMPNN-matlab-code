function lec9ENSEMBLE(x, y, h)

fprintf('-----lec9 ENSEMBLE METHOD -----\n');
epoch = 3;
[xrow, xnum] = size(x);  % xrow = attribute, xcol = ���ж��ٸ���
hnum = size(h,2);  % ���ж��ٸ�hx
syms hx1 hx2 hx3 hx4 hx5 hx6 hx7 hx8
hx = [hx1, hx2, hx3, hx4, hx5, hx6, hx7, hx8];
classifier = 0;

w = 1./xnum .* ones(1, xnum);  % ÿ�����Ȩ�أ���������ɸĴ˴�

for epo = 1 : epoch
    fprintf('---- epoch %d ----\n', epo);
    train_error = ( (h<0) * w.').';  % ��ÿ����ͣ���Ϊ8�У�ÿ��Ϊ�����ʡ�����Ϊ��������
    [sort_error, sort_index] = sort(train_error);
    index = sort_index(1);  % ����ѡ���hx
    if sort_error(1) > 0.5
        fprintf('---- NO WAY!!!!! ------\n'); disp(train_error);
        break;
    end
    e1 = train_error(index);  % һ������
    aerfa = 1/2*log((1-e1)/e1);  % ������
    aerfa_y_h = aerfa .* h(index,:);  %  .* y���Ѿ�����������ˣ����Բ��ó�y
    w_e_ayh = w .* exp(-1 .* aerfa_y_h);  % Ȩ�ظ��£���δ��һ��
    z = sum(w_e_ayh);
    w_new = w_e_ayh ./ z;  % ��Ȩ�أ��ѹ�һ��
    w = w_new;
    classifier = classifier + roundn(aerfa, -4) .* hx(index);
    
    % ������
    fprintf('train_errorΪ��\n'); disp(train_error);
    fprintf('����ѡ���hxΪ��hx %d\n', index);
    fprintf('һ�������� = %f, �������� = %f\n', e1, aerfa); 
    fprintf('δ��һ��Ȩ�أ�\n'); disp(w_e_ayh);
    fprintf('��һ��Ȩ�أ�\n'); disp(w_new);
    fprintf('classifier������Ϊ��\n'); disp(vpa(classifier));
    
    
end



%{
 ������
fprintf('lmbda���У�\n');disp(lmb);
fprintf('w����Ϊ��\n');disp(w);
fprintf('y(wx+w0)-1����Ϊ��\n');disp(y_wxw0_1.');
fprintf('��lmbda*y����Ϊ��\n');disp(lmb_y);
fprintf('�ⷽ�̱������Ϊ��\n');disp(solution);
fprintf('hyperplane��ƽ��Ϊ��\n');disp(hyperplane_after==0);
%}

end