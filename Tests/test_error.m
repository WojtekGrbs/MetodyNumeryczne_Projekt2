function [z] = test_error()

% Funkcja test_error służy wygenerowaniu wykresu zależności:
% Błędu względnego rozkładu
% Współczynnika stabilności
% Współczynnika poprawności
% od pewnych ustalonych zmian w macierzach A lub B dla równania
% macierzowego AX = B. Funkcja zwraca również wektor zawierające powyższe
% wartości, oprócz nich jeszcze błąd rozkładu oraz wskaźnik uwarunkowania
% macierzy A dla każdej z iteracji pętli.


for n = 1:100
    
    A = generatesparseSPDmatrix(400,(1/2));
    B = generatesparseSPDmatrix(400,(n/100));

    % test_cholesky przyjmuje macierze jako argumenty, stąd
    % uogólniamy obiekty Sparse funkcją full()
    z(n,:) = test_cholesky(full(A),full(B));
end

% w wypadku gęstości OX prezentuje jej wielkość
x = x./100;

hold on

plot(x, z(:,3), "g")
plot(x, z(:,4), "r")
plot(x, z(:,5), "b")

legend("Błąd względny rozkładu", "Współczynnik stabilności", "Współczynnik poprawności", 'Location','northeast')
xlabel("Rozmiar macierzy B")
ylabel("Wartość")
title("Wartość współczynników w zależności od rozamiru macierzy B")

hold off
end