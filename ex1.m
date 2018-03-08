n=201;
A=ones(n,n);
x=-1;
y=-1;

for x=-1:0.01:1
    for y=-1:0.01:1
        if x^2+y^2<=1/16
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=0.5;
        end
        if x^2+y^2<=0.25 && x^2+y^2>1/16
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=0.25;
        end
        if x^2+y^2<=9/16 && x^2+y^2>0.25
            a=round(x*100+100);
            b=round(y*100+100);
            A(a,b)=1;
        end
        if x^2+y^2>9/16 && x~=-1 && y~=-1
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
theta = 90;
[R,xp] = radon(A,theta);




