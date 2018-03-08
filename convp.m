function h = convp( f,g )
% Discrete Convolution convp( f,g )
% Input: vectors of f- and g-values. Must be of the same type!
% Output: (circular) convolution h of the discrete N-periodic 
%         functions f and g.


N=length(f);
if N~=length(g)
    err=1
end
for m=1:N
    h(m)=f(1:m)*g(m:-1:1)'+f(m+1:N)*g(N:-1:m+1)';
% There are N values of h.
% Every value is the sum k=1 to N of f_k*g_{m-k}.
% But in Matlab there are no indizes m-k<=0.
% So split k up into 1:m and m+1:N: 
% f_1*g_m, ... , f_m*g_1, f_m+1*g_N, ... , f_N*g_m+1.

% Note: We avoided an explicit for-loop by using vector notation.
end

end

