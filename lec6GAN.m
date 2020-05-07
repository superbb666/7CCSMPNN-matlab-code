function lec6GAN()

fprintf('----------lec6 GAN -----------\n');
%% 建立DX方程
syms xtd1 xtd2 x1 x2
DX = 1 / ( 1 + exp( -1* (xtd1*x1-xtd2*x2-2)) );
lnDX_d1 = diff(log(DX), xtd1);
lnDX_d2 = diff(log(DX), xtd2);
ln_1_DGz_d1 = diff(log(1-DX), xtd1);
ln_1_DGz_d2 = diff(log(1-DX), xtd2);

%% 参数传递
xreal = [1,2; 3,4]';
xfake = [5,6; 7,8]';
[attribute, m] = size(xreal);
xitad1 = 0.1;
xitad2 = 0.2;
dxreal1 = double( subs(DX,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,1), xreal(2,1)}) );
dxreal2 = double( subs(DX,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,2), xreal(2,2)}) );
pdatax1 = 0.5;
pdatax2 = 0.5;
dxfake1 = double( subs(DX,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,1), xfake(2,1)}) );
dxfake2 = double( subs(DX,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,2), xfake(2,2)}) );
pgx1 = 0.5;
pgx2 = 0.5;
eta = 0.02;

%% V(D,G)的计算
Ex_pdata = log(dxreal1) * pdatax1 + log(dxreal2) * pdatax2;
Ex_pz = log(1-dxfake1) * pgx1 + log(1-dxfake2) * pgx2;
V_DG = Ex_pdata + Ex_pz


%% ▽θd的计算
aerfa1_m1 = double( subs(lnDX_d1,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,1), xreal(2,1)}) );
aerfa1_m2 = double( subs(lnDX_d1,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,2), xreal(2,2)}) );
aerfa2_m1 = double( subs(lnDX_d2,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,1), xreal(2,1)}) );
aerfa2_m2 = double( subs(lnDX_d2,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xreal(1,2), xreal(2,2)}) );
beta1_m1 = double( subs(ln_1_DGz_d1,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,1), xfake(2,1)}) );
beta1_m2 = double( subs(ln_1_DGz_d1,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,2), xfake(2,2)}) );
beta2_m1 = double( subs(ln_1_DGz_d2,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,1), xfake(2,1)}) );
beta2_m2 = double( subs(ln_1_DGz_d2,{xtd1, xtd2, x1, x2},{xitad1, xitad2, xfake(1,2), xfake(2,2)}) );

delta_xitad = 1./m.*[aerfa1_m1+beta1_m1; aerfa2_m1+beta2_m1] + ...
              1./m.*[aerfa1_m2+beta1_m2; aerfa2_m2+beta2_m2]

xitad = [xitad1; xitad2];
xitad = xitad + eta .* delta_xitad

end






