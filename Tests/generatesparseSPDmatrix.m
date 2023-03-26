function A = generatesparseSPDmatrix(n, D)
% Funkcja generatesparseSPDmatrix służy generowaniu obiektu typu Sparse,
% który w zależności od przekazanego parametru D zwraca macierz z taką
% gęstością współczynników niezerowych. Zwracana macierz jest symetryczna i
% dodatnio określona

% n - rozmiar macierzy
% D - liczba z przedziału [0,1], decyduje o gęstości

A = sprandsym(n, D);
A = A + n * speye(n);

end