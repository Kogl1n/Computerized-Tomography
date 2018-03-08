theta=0;
t=0;
A=0
for theta=0:0.1:pi
    for t=-0.5:0.01:0.5
        A(round(theta*10+1),round(t*100+51))=radon_cs(t,theta);
    end
end
imshow(A',[])
set(gca,'DataAspectRatio',[1 6 1])
