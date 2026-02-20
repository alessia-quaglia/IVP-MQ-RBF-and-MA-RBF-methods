function plot_stability(x, y, R, color)
%
% Usage:   plot_stability(x, y, R, color)
% Purpose: the function plots the absolute stability region 
%          of a one step method
% Input:   x = row vector defining the real axis of the 
%              complex plane
%          y = row vector defining the imaginary axis of the 
%              complex plane
%          R = matrix obtained from the method's 
%              characteristic polynomial, the absolute 
%              stability region is given by |R| <= 1.
%      color = line color specification for the contour plot 
% Output:  the function does not return outputs, it produces 
%          a contour plot showing where |R| = 1, which 
%          represents the boundary of the absolute stability 
%          region
%
[X, Y] = meshgrid(x,y);
Rmag = abs(R); 
contour(X, Y, Rmag, [1 1], color, 'LineWidth', 2); 
axis equal;
xlabel('\Re(h\lambda)');
ylabel('\Im(h\lambda)');
grid on;
