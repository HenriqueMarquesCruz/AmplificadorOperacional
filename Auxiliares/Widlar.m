% ----------------------------------------------------------
% Encontrar a corrente Io do Widlar usando fzero
% ----------------------------------------------------------

% Parâmetros
Iref = 9.77e-3;     % Corrente de referência (A)
VT   = 25e-3;       % Tensão térmica (V)
RE   = 20;          % Resistência (ohms)

% Definição da função f(Io)
f = @(Io) RE*Io - VT*log(Iref./Io);

% Intervalo de busca (deve conter a raiz)
Io = fzero(f, [1e-6, Iref]);

fprintf("Corrente encontrada: Io = %.6f A (%.3f mA)\n", Io, Io*1000);

% ----------------------------------------------------------
% Plot para visualizar a interseção
% ----------------------------------------------------------

Io_vec = linspace(1e-6, Iref, 1000);

left  = RE*Io_vec;
right = VT*log(Iref./Io_vec);

figure;
plot(Io_vec*1000, left, 'LineWidth',2); hold on;
plot(Io_vec*1000, right, 'LineWidth',2);
xlabel('Io (mA)');
ylabel('Tensão (V)');
legend('RE * Io', 'VT * ln(Iref/Io)');
grid on;
title('Interseção do Widlar: RE*Io = VT ln(Iref/Io)');