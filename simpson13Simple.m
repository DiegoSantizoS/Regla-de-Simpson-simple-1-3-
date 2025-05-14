clc; clear all;
% Definición de la función original
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Intervalo de integración
a = 0;
b = 0.8;

% Número de segmentos (debe ser par para Simpson 1/3)
n = 2;
h = (b - a) / n;

% Puntos de evaluación
x0 = a;
x1 = a + h;
x2 = b;

% Evaluación de la función en los puntos
f0 = f(x0);
f1 = f(x1);
f2 = f(x2);

% Aplicación de la regla de Simpson 1/3
I_simpson = (h / 3) * (f0 + 4*f1 + f2);

% Cálculo de la cuarta derivada de f(x)
syms x
f_sym = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
f4_sym = diff(f_sym, x, 4);
f4 = matlabFunction(f4_sym);

% Cálculo del valor medio de la cuarta derivada en [a, b]
media_f4 = integral(f4, a, b) / (b - a);

% Estimación del error de truncamiento
% Fórmula: E ≈ -((b - a)^5 / 2880) * f⁽⁴⁾(ξ), para algún ξ en [a, b]
error_truncamiento = -((b - a)^5 / 2880) * media_f4;

% Valor exacto de la integral proporcionado
I_exacta = 1.640533;

% Cálculo del error relativo porcentual
error_relativo = abs((I_exacta - I_simpson) / I_exacta) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3 Simple): %.6f\n', I_simpson);
fprintf('Valor medio de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6e\n', error_truncamiento);
fprintf('Error relativo porcentual: %.6f%%\n', error_relativo);
