function plot_stability(x,y,R,color)
    % Funzione per disegnare la regione di assoluta stabilità
    % per metodi ad un passo
    % Preso spunto da PlotS di Leveque

    % Crea una griglia nel piano complesso
    % x = linspace(-4, 2, 400);
    % y = linspace(-3, 3, 400);
    [X, Y] = meshgrid(x, y);
    % Z = X + 1i*Y;

    % Calcola il modulo della funzione di amplificazione
    Rmag = abs(R);

    %stable = (Rmag <= 1);  

    contour(X, Y, Rmag, [1 1], color, 'LineWidth', 2);  % contorno dove |R(z)|=1
    axis equal;
    xlabel('\Re(h\lambda)');
    ylabel('\Im(h\lambda)');
    %title('Regione di stabilità |R(z)| <= 1');
    grid on;