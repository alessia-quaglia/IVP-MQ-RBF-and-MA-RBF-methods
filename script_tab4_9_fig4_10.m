% The following script computes and shows the global errors 
% versus various N and local convergence orders for the two-step 
% Adams-Bashforth method, MQ-RBF and MA-RBF Euler's method applied to the IVP: 
% u'= -4t^3u^2, u(-10) = 1/10001

addpath('Classic methods IVP')
addpath('RBF methods IVP')

f = @(t,u) -4.*t.^3.*u.^2;
u_esatta = @(t) 1./(t.^4+1);
a = -10;
b = 0;
u0 = 1/10001;
N = [200, 400, 800, 1600, 3200, 6400];

err_ab2 = zeros(size(N));
err_MQeuler = zeros(size(N));
err_MAeuler = zeros(size(N));

for i = 1:length(N)
    n = N(i);
    err_ab2(i) = ab2(f, u_esatta, a, b, u0, n);
    err_MQeuler(i) = RBF_euler(f, u_esatta, a, b, u0, n, 1);
    err_MAeuler(i) = RBF_euler(f, u_esatta, a, b, u0, n, 2);
end

ord_ab2 = [NaN, log2(err_ab2(1:end-1)./err_ab2(2:end))];
ord_MQeuler = [NaN, log2(err_MQeuler(1:end-1)./err_MQeuler(2:end))];
ord_MAeuler = [NaN, log2(err_MAeuler(1:end-1)./err_MAeuler(2:end))];

%% Table generation
met_name = {'AB2', 'MQ-RBF Euler 2', 'MA-RBF Euler 2'};
met_err = {err_ab2, err_MQeuler, err_MAeuler};
met_ord  = {ord_ab2, ord_MQeuler, ord_MAeuler};
table_latex(met_name, N, met_err, met_ord);

%% Figure generation
figure
hold on; 
slope_N = [200, 6400];
slope = 0.5e-0 * (slope_N/slope_N(1)).^-2; 
g_s = loglog(slope_N, slope, 'k--', 'LineWidth', 1.2);
g_ab2   = loglog(N, err_ab2, 'b-o', 'LineWidth', 1, 'MarkerSize', 7);
g_MQeuler  = loglog(N, err_MQeuler, 'k-s', 'LineWidth', 1, 'MarkerSize', 7);
g_MAeuler = loglog(N, err_MAeuler, 'r-*', 'LineWidth', 1, 'MarkerSize', 7);
legend([g_ab2, g_MQeuler, g_MAeuler, g_s], ...
       {'AB2', 'MQ-RBF Euler 2', 'MA-RBF Euler 2', 'Slope -2'}, ...
       'Location', 'southwest', 'FontSize', 9);
xlabel('N'); ylabel('Global error');
set(gca, 'XScale', 'log', 'YScale', 'log');
set(gca, 'XTick', N, 'XTickLabel', string(N))
axis([200 7000 0.5*10^(-3) 10^(0)])
title('Global errors for $u'' = -4t^3u^2$', 'Interpreter', 'latex');
axis square; grid on; box on;
hold off;
