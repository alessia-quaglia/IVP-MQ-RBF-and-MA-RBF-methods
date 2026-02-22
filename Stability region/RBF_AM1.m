function RBF_AM1 ()
    % Griglia del piano complesso
    x = linspace(-3, 3, 400);   % asse reale
    y = linspace(-3, 3, 400);   % asse immaginario
    [X, Y] = meshgrid(x, y);
    Z = X + 1i*Y;

    Stable = zeros(size(Z));

    for i = 1:numel(Z)
        z = Z(i);
    
        % polinomio caratteristico in funzione di z
        coeffs = [ 0, (1-z/2+z^3/24), -(1+z/2-z^3/24)]; 
    
        xi = roots(coeffs);
    
        if all(abs(xi) <= 1)
            Stable(i) = 1;
        end
    end

    % Plot della regione di stabilità
    contourf(X, Y, Stable, [0.5 1.5], 'LineColor','none');
    colormap([1 1 1; 0.6 0.8 1]);
    hold on
    contour(X, Y, Stable, [0.5 0.5], 'LineWidth', 2, 'Color', 'b'); 
    xlabel('\Re(h\lambda)');
    ylabel('\Im(h\lambda)');
    axis equal;
    grid on;
