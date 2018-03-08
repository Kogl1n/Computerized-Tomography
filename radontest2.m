
t=linspace(-1,1,200);
x=t;
y=t;
[X,Y]=meshgrid(x,y);
R=X.^2+Y.^2;
f=1*(R<=1/4)-1/2*((X-1/8).^2+Y.^2 <=9/64);

d=0.05;
M=1/0.05;
N=18;
L=pi/d;

theta=linspace(0,pi,N+1);
t=[-1:d:1];
[T,Theta]=meshgrid(t,theta);
Rf=2*sqrt(1/4-T.^2).*(abs(T)<=1/2)-sqrt(1/8-T.^2+1/4*(T.*cos(Theta))+1/64*sin(Theta).^2).*(abs(T-1/8*cos(Theta))<=3/8);

%R = radon(zz,0:179);
I = backproj(Rf',[0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180],'linear','Ram-Lak');
imshow(f); figure; imshow(I);