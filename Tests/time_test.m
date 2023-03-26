function [] = time_test()

% Funkcja time_test służy wygenerowaniu wykresu zależności wymaganego czasu
% na rozwiązanie równania metodą Cholesky'ego i bazowej funkcji MATLab w 
% zależności od zmiany w macierzach A, B dla równania AX = B. W zależności
% od kontekstu w projekcie zmieniane są dwie pierwsze linijki pętli, które
% odpowiadają za tworzenie nowej pary macierzy w każdej iteracji.


for n = 1:100
    
    A = generatesparseSPDmatrix(400,(1/2));
    B = generatesparseSPDmatrix(400,(n/100));
    
    % Przypisanie funkcji do zmiennych
    cholesky_measure = @() cholesky(A, B);
    matlab_inv_measure = @() matlab_inv(A, B);   
    
    % Zapisanie pomiarów czasu do wekorów, by później przedstawić
    % je na wykresie
    y_1(1,n) = [timeit(cholesky_measure)];
    y_2(1,n) = [timeit(matlab_inv_measure)];
end

hold on

plot(x, y_1, "r")
plot(x, y_2, "b")

legend("y_1", "y_2", 'Location','northeast')
xlabel("Oś X")
ylabel("Oś Y")
title("Tytuł")
hold off
end