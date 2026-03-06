function [err1, err2] = RBF_midpoint_sys(f, u_es1, u_es2, a, b, u0, N, Meth)
%
% Usage:     [err1, err2] = RBF_midpoint_sys(f, u_es1, u_es2, a, b, u0, N, Meth)
% Purpose:   it solves a system of 2 first order differential equations 
%            u'(t) = f(u(t),t) with an initial condition u(a) = u0 
%            and computes the global error for both components
%            using a RBF Midpoint method of the third order
% Input:     f = given function f(t,u) of the problem
%        u_es1 = exact solution of the first component
%        u_es2 = exact solution of the second component
%            a = initial point
%            b = end point 
%           u0 = row vector containing the 2 initial values
%            N = controls the step size h
%         Meth = RBF Midpoint method: '1' MQ-RBF (or equivalently
%                MA-RBF), '2' GA-RBF 
% Output: err1 = global error of the first component at the final point t = b
%         err2 = global error of the second component at the final point t = b
%
h = (b-a) / N;
t = linspace(a, b, N+1)';
u = u0' * ones(1, N+1); 
u(1, 2) = u_es1(t(2));
u(2, 2) = u_es2(t(2));
u(1, 3) = u_es1(t(3));
u(2, 3) = u_es2(t(3));
for n = 2:N-1
    fn = f(t(n), u(:,n)); 
    fn_m1 = f(t(n-1), u(:,n-1));
    fn_p1 = f(t(n+1), u(:,n+1));
    if Meth == 1
        eps2 = -(fn_p1 - 2.*fn + fn_m1) ./ (3 * h^2 .* fn);
        u(:,n+2) = u(:,n) + (2*h - eps2.*h^3) .* fn_p1;
    elseif Meth == 2
        eps2 = -(fn_p1 - 2.*fn + fn_m1) ./ (6 * h^2 .* fn);
        u(:,n+2) = u(:,n) + 2*h.*fn_p1.*exp(-eps2.*h^2);
    else 
        warning('Method not available')
    end
end
u = u';
err1 = abs(u(end,1) - u_es1(b));
err2 = abs(u(end,2) - u_es2(b));
