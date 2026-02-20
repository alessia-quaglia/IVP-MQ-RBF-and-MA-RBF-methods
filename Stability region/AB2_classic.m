function AB2_classic()
%
% Usage:   AB2_classic
% Purpose: the function plots the stability region of the 
%          classic Adams-Bashforth two-step method
% Input:   none 
% Output:  the function does not return variables, it 
%          produces a contour plot of the stability region 
%          in the complex plane, showing where the method is 
%          stable
%
theta = linspace(0, 2*pi, 1000);
r = exp(1i*theta);
z = (r.^2 - r) ./ (1.5*r - 0.5);
plot(real(z), imag(z),'Color', 'b', 'LineWidth', 2);
grid on;
axis equal;
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');


