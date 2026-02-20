% function err = ab2am1(f, u_es, a, b, u0, N)
%     h = (b-a)/N;
%     t = linspace(a,b,N+1)';
%     u = zeros(1, N+1); 
%     u(1) = u0;
%     u(2) = u_es(t(2));
%     for n = 2:N
%         fn = f(t(n),u(n));
%         fn_1 = f(t(n-1),u(n-1));
%         u_p = u(n) + h * (3/2 * fn - 1/2 * fn_1); % PREDITTORE (Adams-Bashforth 2) 
%         t0 = f(t(n+1),u_p);
%         u(n+1) = u(n) + (h/2) * (t0 + fn); % CORRETTORE (Adams-Moulton 1)
%     end
%     err = abs(u(end) - u_es(b));
% end

function err = ab2am1(f, u_es, a, b, u0, N)
%
% Usage:    err = ab2am1(f, u_es, a, b, u0, N)
% Purpose:  it solves the differential equation u'(t) = f(u(t),t) with
%           an initial condition u(a) = u0 and computes the global error
%           using the two-step Adams-Bashforth
%           one-step Adams Moulton predictor-corrector method
% Input:    f = given function f(t,u) of the problem
%        u_es = exact solution
%           a = initial point
%           b = end point 
%          u0 = initial value
%           N = controls the step size h
% Output: err = global error at the final point t = b
%
h = (b-a)/N;
t = linspace(a,b,N+1)';
u = zeros(N+1, 1); 
u(1) = u0;
u(2) = u_es(t(2));
t2 = f(t(1),u(1));
for n = 2:N
    t1 = f(t(n),u(n));
    u_p = u(n) + h/2 * (3 * t1 - t2); % PREDITTORE (Adams-Bashforth 2) 
    t0 = f(t(n+1),u_p);
    u(n+1) = u(n) + (h/2) * (t0 + t1); % CORRETTORE (Adams-Moulton 1)
    if n < N
       t2 = t1;
    else
       break
    end
end
err = abs(u(end) - u_es(b));
