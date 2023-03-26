function [ERROR] = test_cholesky(A, B)
% Funkcja test_cholesky(A, B) ma na celu zwrócenie wektora wartości
% parametrów i współczynników towarzyszącym numerycznej implementacji
% metody Choesky'ego-Banachiewicza

% A, B - macierze, dla których obliczamy rozwiązanie równania macierzowego
%        postaci AX=B, A - macierz dodatnio określona i symetryczna

% ERROR - wektor wskaźnika uwarunkowania macierzy A, błędu rozkładu, błędu
% względnego, współczynnika stabilności i poprawności

    % Wskaźnik uwarunkowania
    cond_a = cond(A);
    
    % Rozkład Cholesky'ego
    L = cholesky_decomposition(A);
    
    % Błąd rozkładu
    e_dec = norm((A - L*L'),2)/norm(A);
    
    % Wynik implementacji numerycznej
    X = cholesky(A, B);
    
    % Wynik dokładny
    X_acc = matlab_inv(A, B);
    
    % Błąd względny
    e_rel = norm(X - X_acc)/norm(X_acc);
    
    % Współczynnik stabilności
    stab_coeff = e_rel/cond_a;

    % Współczynnik poprawności
    corr_coeff = norm(B-A*X)/(norm(A)*(norm(X)));

    ERROR = [cond_a e_dec e_rel stab_coeff corr_coeff];
end