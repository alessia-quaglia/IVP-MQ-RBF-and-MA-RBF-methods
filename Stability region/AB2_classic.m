function AB2_classic ()
    theta = linspace(0, 2*pi, 1000);
    r = exp(1i*theta);

    z = (r.^2 - r) ./ (1.5*r - 0.5);

    plot(real(z), imag(z),'Color', 'b', 'LineWidth', 2);
    grid on;
    axis equal;
    xlabel('Re(h \lambda)');
    ylabel('Im(h \lambda)');
end
