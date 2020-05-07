function lec2givewxw0_cal_gx(w, x, w0)
% w: 2x1, x: 2x1, w0: 1x1, gx=wtx+w0
fprintf('-----givewxw0 calculate gx-----\n');

w0 = zeros(1, size(w, 2)) + w0;
w_w0 = [w0; w];
x1 = ones(1, size(x, 2));
x_x1 = [x1; x];
gx = w_w0.' * x_x1;
% distance = norm(gx) ./ norm(w)  % ≈∑ Ωæ‡¿Î
fprintf('gx=\n'); disp(gx);  % fprintf('%c%c',8,8);



end