function [ f ] = ift_rlf(L,n)
%Inverse Fouriertransform values of the Ram-Lakfilter
%Input: L the border, n time pi
for i=1:length(n)
    if rem(n(i),2) && n(i)~=0
        f(i)=-2*L^2/(pi^3*n(i)^2);
    elseif n(i)==0
       f(i)=L^2/(2*pi);
    else
        f(i)=0;
    end
end
%f=L^2/(2*pi)*(2*sin(pi*n)./(pi*n)-(sin(pi*n/2)./(pi*n/2)).^2);
end

