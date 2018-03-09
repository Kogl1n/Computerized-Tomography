%Sheet 4: Exercise 5
%Discrete Backprojection for crescent-chaped phantom
%Usage if Ram-Lak filter with F(w)=1
%Given Data of the form: (j*d,k*pi/N)
clear all
close all
%%1.) Set constant values
t=linspace(-1,1,41);% equivalent to j*d
d=0.05;%or d=1/M
M=1/0.05;
S=[18,36];
L=pi/d;%border for the shepp logan filter (Nyquist Theorem)
for i=1:2
    for e=1:2
   N=S(i); 
%%2.)First show the original function
x=linspace(-1,1,100);
y=x;
[X,Y]=meshgrid(x,y);
R=X.^2+Y.^2;
f=1*(R<=1/4)-1/2*((X-1/8).^2+Y.^2 <=9/64);
pic=figure('name',['Crescend-Shaped Backprojection  for N=' num2str(N) ' with convp' num2str(e)]);
subplot(2,2,1)
imshow(f,[0,1])
title('Function to reconstruct');
xlabel('x'); ylabel('y');

%% 3.) Radondata
theta=linspace(0,pi,N);%equivalent to k*pi/N
t=[-1:d:1];
[T,Theta]=meshgrid(t,theta);
Rf=radon_cs(T,Theta);

subplot(2,2,2)
imshow(Rf)
title('Radondata');
ylabel('\theta')
xlabel('t')
%% 4.)Filterdata
n=-20:20;
rlf=irlf(L,n);


subplot(2,2,3)
 plot(rlf)
axis([0 40 -300 700])
title('F^{-1}Filter-data');
 axis on
 %NEXT STEP IS VERY IMPORTANT!!!!
rlf=[rlf(21:41) rlf(1:20)];


%% 5.)Convolution for every theta.
% h=Rf;

    if e==1
     for m=1:length(theta)
     h(m,:)=convp(rlf,Rf(m,:));
    end 
    else
        h=convp2(rlf,Rf);
    end
 %% 6.) %Compute the interpolation points t*.
 %choose grid
 xx=linspace(-1,1,100);
 yy=xx;
 [XX,YY]=meshgrid(xx,yy);
 l=zeros(length(theta),length(XX),length(YY));
 
 %For every theta we get a 100x100 matrix
 for k=1:length(theta)   
    
     l(k,:,:)=cos(theta(k))*XX+sin(theta(k))*YY;
        
 end
 Ih=l;
%%
%Interpolation of the wanted points for every theta.
%Given: values of the function on the points t*.
for m=1:N 
 Ih(m,:,:)=interp1(t,h(m,:),l(m,:,:),'linear');
end

%%
%7.)Apply the discrete backprojection in the interpolated points to find 
%the values of f at gridpoints (xm,ym)
[a,b,c]=size(Ih);
 for j=1:b
    for k=1:c
        Bh(k,j)=sum(Ih(:,k,j))/(2*N);
    end
 end

subplot(2,2,4)
 imshow(Bh,[])
 title('Backprojection');
 ylabel('y')
xlabel('x')
%save pictures
saveas(pic, ['Crescend-Shaped Backprojection  for N=' num2str(N) 'with convp' num2str(e)], 'png'); 
    end 
end