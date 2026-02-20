function RBF_multistep (x,y,coeffs,color)
    % Griglia del piano complesso
    % x = linspace(-3, 3, 400);   % asse reale
    % y = linspace(-3, 3, 400);   % asse immaginario
    [X, Y] = meshgrid(x, y);
    Z = X + 1i*Y;

    Stable = zeros(size(Z));

    for i = 1:numel(Z)
        z = Z(i);
    
        % coeffs deve essere una function handle -> valutiamo
        poly_coeffs = coeffs(z);

        % calcola radici
        xi = roots(poly_coeffs);
    
        % Verifica stabilità (tutte le radici <= 1)
        if all(abs(xi) <= 1)
            Stable(i) = 1;
        end
    end

    % Plot della regione di stabilità
    contour(X, Y, Stable, [0.5 0.5], color, 'LineWidth', 2); 
    xlabel('\Re(h\lambda)');
    ylabel('\Im(h\lambda)');
    axis equal;
    grid on;
end

