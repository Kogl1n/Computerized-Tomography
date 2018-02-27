% x=linspace(-1,1,1000);
% y=x;
% zz=zeros(1000);
% [X,Y]=meshgrid(x,y);
% for i=1:1000
%     for j=1:1000
%         rr=X(1,i)^2+Y(j,1)^2;
%         rrr=(X(1,i)-1/8)^2+Y(j,1)^2;
%         if rr<=1/4 && rrr>9/64
%         zz(j,i)=1;
%         elseif rrr<=9/64
%         zz(j,i)=0.5;
%         elseif rr>1/4
%         zz(j,i)=0;
%         end
%     end
% end
% theta=0:180;
% [R,xp]=radon(zz,theta);

t=linspace(-1,1,500);
x=t;
y=t;
[X,Y]=meshgrid(x,y);
R=X.^2+Y.^2;
f=1*(R<=1/4)-1/2*((X-1/8).^2+Y.^2 <=9/64);

d=0.01;
M=1/0.05;
N=180;
L=pi/d;

theta=linspace(0,pi,N+1);
t=[-1:d:1];
[T,Theta]=meshgrid(t,theta);
Rf=2*sqrt(1/4-T.^2).*(abs(T)<=1/2)-sqrt(1/8-T.^2+1/4*(T.*cos(Theta))+1/64*sin(Theta).^2).*(abs(T-1/8*cos(Theta))<=3/8);
FA=zeros(length(t),1);


%FA=zeros(length(theta),1);
t_length=length(t);
for i=1:length(FA)
    if mod(i-(1+(t_length-1)/2),2)~=0
        FA(i)=-2*L^2/(pi^3*(i-(1+(t_length-1)/2))^2);
    end
end
FA((t_length-1)/2+1)=L^2/(2*pi);
h=zeros(length(theta),length(t));

 for m=1:length(theta)
     h(m,:)=convp(FA',Rf(m,:));
 end
 
 
 
 xx=linspace(-1,1,100);
 yy=xx;
 [XX,YY]=meshgrid(xx,yy);
 
 l=zeros(length(theta),length(XX),length(YY));
 for k=1:length(theta)     
     l(k,:,:)=cos(theta(k))*XX+sin(theta(k))*YY;    
 end
 
 YI=l;

for m=1:N 
 YI(m,:,:)=interp1(t,h(m,:),l(m,:,:));
end

[a,b,c]=size(YI);
 for j=1:b
    for k=1:c
        Bh(j,k)=sum(YI(:,j,k))/(2*N);
    end
 end

 figure
 imshow(Bh,[0,10])
 