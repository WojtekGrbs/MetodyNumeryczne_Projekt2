function [X] = cholesky(A, B)
% Funkcja cholesky(A, B) ma za zadanie zwrócić macierz wynikową
% będącą rozwiązaniem układu macierzowego AX = B korzystając z poprzednio
% zdefiniowanych funkcji cholesky_decomposition oraz
% lower_triangular_solver

% Rozkładamy macierz A metodą Cholesky'ego-Banachiewicza
L = cholesky_decomposition(A);

% Rozwiązujemy podukład LY = B
Y = lower_triangular_solver(L, B);
% Wektor wynikowy permutujemy tak, by i-ty wiersz stał się (n-i)-tym
Y = flip(Y,1);

% Rozwiązujemy podukład L^{T}X=Y (argumentem nadal jest L, bo wymagana jest
% macierz dolnotrojkatna, co umożliwia wczesniejsze odwrocenie Y
X = lower_triangular_solver(L, Y);

% Otrzymana macierz wynikowa rowniez ma odwrocone wiersze wzgledem
% poprawnego wyniku
X = flip(X,1);

end