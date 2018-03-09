function f= irlf(L,n)
% Inverse Fouriertransform values F^-1 of the Ram-Lak-Filter
% 0: L^2/(2*pi); !=0, even: 0; !=0, odd: -2*L^2/(pi^3*n^2)
% Input: L the border, n time pi
for i=1:length(n)
    if n(i)==0
       f(i)=L^2/(2*pi);
    elseif rem(n(i),2) && n(i)~=0
       f(i)=-2*L^2/(pi^3*n(i)^2);
    else
       f(i)=0;
    end
end
end

