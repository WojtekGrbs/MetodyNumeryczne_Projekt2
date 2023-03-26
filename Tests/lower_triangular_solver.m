function [X] = lower_triangular_solver(L, B)
% Funkcja lower_triangular_solver(L,B) ma za zadanie zwrócić
% macierz X będącą rozwiązaniem układu macierzowego LX=B, przy czym
% wymagane jest, by macierz L była macierzą dolnotrójkątną

% L - Macierz kwadratowa dolnotrójkątna o wymiarach nxn,
%     dla której rozwiązane ma być równanie LX=B
% B - Macierz o wymiarach nxm, będąca prawą stroną równania

% Ustalamy rozmiar macierzy wynikowej i deklarujemy ją
% w celach przyspieszenia algorytmu
n = size(L,1);
m = size(B,2);

X = zeros(n, m);
% Wektorowo bierzemy pod uwagę odpowiednią długość danego wiersza
% tak, by operować tylko na trójkątnej części macierzy
for i = 1:n
    column_vector = 1:i-1;
    
    % Tworzymy zmienną tymczasową reprezentującą wartość liczbową
    % iloczynu L oraz X do elementu na diagonali
    temp = L(i,column_vector) * X(column_vector,:);

    % Po odjęciu temp od B(i,:) wystarczy podzielić przez współczynnik na 
    % diagonali
    X(i,:) = (B(i,:) - temp) / L(i,i);
end
end