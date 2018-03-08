function f= irlf(L,n)
% F^-1 of Ram-Lak-Filter
% page 72
% 0: L^2/(2*pi); !=0, even: 0; !=0, odd: -2*L^2/(pi^3*n^2)
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

