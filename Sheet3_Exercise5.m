% Exercise 3: 5
% Crescent Shaped Region Backprojection
% Given Data of the form: (j*d,k*pi/N)
% Set up:
clear all
d=0.05; % or d=1/M
t=-1:d:1; % 2M+1=41 or j*d
N1=[18,36]; % N=18 or 36 angle k*pi/N
L=pi/d; % Niquist value for Ram-Lak-Filter

for i=1:2
for e=1:2
N=N1(i); 

% function
x=linspace(-1,1,100);
[X,Y]=meshgrid(x,x);
R=X.^2+Y.^2;
f=1*(R<=1/4)-0.5*((R-1/4*X)<=1/8);
pic=figure('name',['Crescend-Shaped Backprojection for N=' num2str(N) ' with convp' num2str(e)]);
subplot(2,2,1)
imshow(f,[0,1])
axis off
title('Function to reconstruct');
xlabel('x'); ylabel('y');

% Radon transform
theta=linspace(0,pi,N); % k*pi/N
[T,Theta]=meshgrid(t,theta);
tt=abs(T-1/8*cos(Theta));
Rf=2*sqrt(1/4-abs(T).^2).*(abs(T)<=1/2)-sqrt(9/64-(tt).^2).*(tt<=3/8);
subplot(2,2,2)
imshow(Rf)
title('Sinogram'); ylabel('\theta'); xlabel('t')

% Ram-Lak-Filter
n=-20:20; % 41 values corresponding to the number of values of t.
rlf=irlf(L,n);
subplot(2,2,3)
plot(rlf)
axis([1 40 -300 600])
title('F^{-1}: Filter in Spatial Domain');

% convolution h=rlf with Rf
rlf=[rlf(21:41) rlf(1:20)]; % because of convolution

    if e==1
        for m=1:length(theta)
            h(m,:)=convp(rlf,Rf(m,:));
        end
    else
        h=convp2(rlf,Rf);
    end

% rlf=[rlf(21:41) rlf(1:20) zeros(1,41)]; % with padding
% Rf=[Rf zeros(N,41)];
% for m=1:length(theta)
%     h(m,:)=convp(rlf,Rf(m,:));
% end
% h=h(:,1:41);

% interpolation points for every theta
I=zeros(N,100,100);
for k=1:N  
    I(k,:,:)=cos(theta(k))*X+sin(theta(k))*Y; % reuse existing mesh
end
for m=1:N 
    I(m,:,:)=interp1(t,h(m,:),I(m,:,:),'linear'); % interp1 for every theta for given values at t.
end

% backprojection
[a,b,c]=size(I);
B=zeros(c,b);
for j=1:b
    for k=1:c
        B(k,j)=sum(I(:,k,j))/(2*N); % script page 88
    end
end

subplot(2,2,4)
imshow(B,[])
axis off
title('Backprojection');
xlabel('x')
ylabel('y')
saveas(pic, ['Crescend-Shaped Backprojection for N=' num2str(N) 'with convp' num2str(e)], 'png'); 
end
end
