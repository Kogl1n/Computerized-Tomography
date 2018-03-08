x=linspace(-1,1,100);
y=x;
zz=zeros(100);
[X,Y]=meshgrid(x,y);
for i=1:100
    for j=1:100
        rr=X(1,i)^2+Y(j,1)^2;
        rrr=(X(1,i)-1/8)^2+Y(j,1)^2;
        if rr<=1/4 && rrr>9/64
        zz(i,j)=1;
        elseif rrr<=9/64
        zz(i,j)=0.5;
        elseif rr>1/4
        zz(i,j)=0;
        end
    end
end

figure; 
imshow(zz,[]);
colormap(gray);
title('Exercise 2 f(x,y)');
xlabel('x'); ylabel('y');