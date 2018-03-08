% Exercise 1: 2
% Crescent Shaped Region
x=linspace(-1,1,1000);
y=x;
zz=zeros(1000);
[xx,yy]=meshgrid(x,y);
rr=xx.^2+yy.^2;
zz=1*(rr<=1/4)-0.5*((rr-1/4*xx)<=1/8);

subplot(2,2,1) % f(x,y)
imshow(zz,[]);
axis off

subplot(2,2,2) % Radon Transform
theta=0:180;
[R,xp]=radon(zz,theta);
imshow(R,[],'Xdata',theta,'Ydata',xp/10,'InitialMagnification','fit')
xlabel('\theta'); ylabel('t');
axis([ 0 150 -30 30]);

subplot(2,2,3)
[R,xp]=radon(zz,0);
plot(xp/1000,R/1000);
axis([ -0.4 0.4 0 0.42]);
title('0');

subplot(2,2,4)
[R,xp]=radon(zz,60);
plot(xp/1000,R/1000);
axis([ -0.4 0.4 0 0.42]);
title('\pi/3');



