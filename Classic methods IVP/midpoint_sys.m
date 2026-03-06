function [err1, err2] = midpoint_sys(f, u_es1, u_es2, a, b, u0, N)
%
% Usage:     [err1, err2] = midpoint_sys(f, u_es1, u_es2, a, b, u0, N)
% Purpose:   it solves a system of 2 first order differential equations
%            u'(t) = f(u(t),t) with an initial condition u(a) = u0 
%            and computes the global error for both components
%            using the Midpoint method 
% Input:     f = given function f(t,u) of the problem
%        u_es1 = exact solution of the first component
%        u_es2 = exact solution of the second component
%            a = initial point
%            b = end point 
%           u0 = row vector containing the 2 initial values
%            N = controls the step size h
% Output: err1 = global error of the first component at the final point t = b
%         err2 = global error of the second component at the final point t = b
%
h = (b-a) / N;
t = linspace(a, b, N+1)';
u = u0' * ones(1, N+1); 
u(1, 2) = u_es1(t(2));
u(2, 2) = u_es2(t(2));
for n = 1:N-1
    T1 = f(t(n+1), u(:,n+1));
    u(:,n+2) = u(:,n) + 2 * h * T1;
end
u = u';
err1 = abs(u(end,1) - u_es1(b));
err2 = abs(u(end,2) - u_es2(b));

