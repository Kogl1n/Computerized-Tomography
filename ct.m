n=201;
A=ones(n,n);
x=-1;
y=-1;

for x=-1:0.01:1
    for y=-1:0.01:1
        if x^2+y^2<=0.25 && (x-1/8)^2+y^2>9/64
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=1;
        end
        if (x-1/8)^2+y^2<=9/64
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=0.5;
        end
        if x^2+y^2>0.25 && x~=-1 && y~=-1
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=0;
        end
    end
end
figure; 
imagesc(A);
colormap(gray);

figure
theta = 0:360;
[R,xp] = radon(A,theta);
imshow(R,[],'Xdata',theta,'Ydata',xp,...
            'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gray), colorbar
iptsetpref('ImshowAxesVisible','on')

figure 
theta = 60;
[R,xp] = radon(A(50:150,50:150),theta);
plot(0:1:144,R)

figure 
theta = 0;
[R,xp] = radon(A(50:150,50:150),theta);
plot(0:1:144,R)
