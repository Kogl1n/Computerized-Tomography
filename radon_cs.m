function [ rc ] = radon_cs(t,theta)
%find the Radondata for crescend shaped phantom
%Input: t=x and y=theta (as vector?)
%Problem: Die Daten  müssen noch richtig zu t und theta zugeordnet werden,
%d.h. zu jedem Theta radonwerte an allen t.

tt=abs(t);
ttt=abs(t-1/8*cos(theta));
rc=2*sqrt(1/4-tt.^2).*(tt<=1/2)-sqrt(9/64-(ttt).^2).*(ttt<=3/8);
end

