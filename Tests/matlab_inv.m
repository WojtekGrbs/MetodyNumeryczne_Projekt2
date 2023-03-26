function [X] = matlab_inv(A, B)

% Funkcja matlab_inv oblicza równanie macierzowe AX=B za pomocą
% wbudowanej w język funkcji inv()

% A - Macierz odwracalna nxn
% B - Macierz rozmiarów nxm

X = inv(A)*B;

end