function h = convp2(f, A)
% Discrete Convolution of N-periodic function, NxM matrix A
% Input: f row vector and Matrix A.
% Output: NxM-Matrix

[N,M]=size(A);
for m=1:M % Spalten
    for n=1:N % Zeilen bzw. Eintrag von f
        h(n,m)=f(1:n)*A(n:-1:1,m)+f(n+1:N)*A(N:-1:n+1,m); 
        % hier kein Transp., da f Zeilenvektor
    end
end
end