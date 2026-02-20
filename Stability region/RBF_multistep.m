function RBF_multistep(x, y, coeffs, color)
%
% Usage:   RBF_multistep(x, y, coeffs, color)
% Purpose: the function plots the stability region of a 
%          multistep method in the complex plane, based on
%          its characteristic polynomial
% Input:   x = row vector defining the real axis of the 
%              complex plane
%          y = row vector defining the imaginary axis of the
%              complex plane
%     coeffs = function returning the characteristic 
%              polynomial coefficients of the method
%      color = line color specification for the contour plot 
% Output:  this function does not return outputs, it 
%          produces a contour plot showing the stability 
%          region, where all roots of the characteristic 
%          polynomial satisfy |xi| <= 1
%
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;
Stable = zeros(size(Z));
for i = 1:numel(Z)
    z = Z(i);
    poly_coeffs = coeffs(z); 
    xi = roots(poly_coeffs);
    if all(abs(xi) <= 1)
        Stable(i) = 1;
    end
end
contour(X, Y, Stable, [0.5 0.5], color, 'LineWidth', 2); 
xlabel('\Re(h\lambda)');
ylabel('\Im(h\lambda)');
axis equal;
grid on;
