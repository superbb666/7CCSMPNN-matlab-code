function lec2multiclass_sequential_perceptron_learning_algorithm(epoch, x, classx, a, eta)
% x = [[1,5]^t, [2,5]^t] 2x4, classx=[[1],[1],[-1],[-1]] 4x1,a=[a1 a2] 3x2, a1=[w0,w] 3x1, a2: 3x1, a3: 3x1
fprintf('-----lec2 multiclass sequential perceptron learning algorithm-----\n');

x1 = ones(1, size(x,2));
y = [x1; x];  % y=[1 x1, x2], 3x4
for epochi = 1 : epoch
    fprintf('-------- epoch= %d -------\n',epochi);
    for i = 1 : size(y, 2)
        gx = zeros(1, size(a,2));
        for ci = 1 : size(a,2)  % multiclass i
            gx(ci) = a(:,ci).' * y(:,i);  % gx = aTy, ����ĵģ�1x3, 3x1 --> 1x1
        end
        [gxsort, gxindex] = sort(gx);
        gxclass = gxindex(end);  % gx ������Ϊ��ʤ��
        if gxsort(end-1)  == gxsort(end)   % ����������õ�
            allgxindex = gxindex(gxsort == gxsort(end));
            gxclass = min(allgxindex);  % ѡ����С��index��Ϊ��ʤ��
%             gxclass = max(allgxindex);  % ѡ������index��Ϊ��ʤ��
        end
        w = classx(i);
        if gxclass ~= w
            a(:,w) = a(:,w) + eta .* y(:,i);  % a = a + eta*y
            a(:,gxclass) = a(:,gxclass) - eta .* y(:,i);  % a = a - eta*y
        end
        fprintf('iter= %d, y=[', i); disp(y(:,i).');  fprintf('%c%c',8,8);
        fprintf('], gx=['); disp(gx);  fprintf('%c%c',8,8);
        fprintf('], gxclass=%d, class=%d', gxclass, w); 
        fprintf(', a1=['); disp(a(:,1).');  fprintf('%c%c',8,8);
        fprintf('], a2=['); disp(a(:,2).');  fprintf('%c%c',8,8);
        fprintf('], a3=['); disp(a(:,3).');  fprintf('%c%c',8,8);
        fprintf(']\n');
    end
end


end