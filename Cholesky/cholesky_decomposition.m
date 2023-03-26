function [L] = cholesky_decomposition(A)

% Funkcja cholesky_decomposition() jako argument przyjmuje 
% macierz A o współczynnikach z R, która jest jednocześnie symetryczna
% i dodatnio określona.

% Funkcja zwraca macierz dolnotrójkątną L według dekompozycji
% Cholesky'ego-Banachiewicza taką, że LL^T = A

n = size(A, 1);

% Deklarujemy L dla większej efektywności algorytmu
L = zeros(n);

% Stosujemy algorytm podany na wykładzie
for k = 1:n
    L(k,k) = sqrt(A(k,k) - sum(L(k,1:k-1).^2));
    wektor_sum = squeeze(sum(L(k+1:n,1:k-1).*L(k,1:k-1), 2));
    L(k+1:n,k) = (A(k+1:n,k) - wektor_sum)/L(k,k);
end
end