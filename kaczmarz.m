function x = kaczmarz( A,p,x0 )
% Kaczmarz Method
% p,x0 are column vectors

m = size(A,1);
x = x0;

% Abbruchkriterien
res = 1;
res_max = 0.001;
iter_max = 100;
iter = 0;

% Plot
g1 = @(x)p(1)/A(1,2) - A(1,1)/A(1,2)*x;
g2 = @(x)p(2)/A(2,2) - A(2,1)/A(2,2)*x;
if numel(p)==3
    g3 = @(x)p(3)/A(3,2) - A(3,1)/A(3,2)*x;
    fplot(g3,[-2,4],'g');
    hold on
end
fplot(g1,[-2,4],'r');
hold on
fplot(g2,[-2,4],'b');


while res>res_max && iter < iter_max
    for i=1:m
        r_i = A(i,:);
        p_i = p(i);
        
        lambda = (r_i*x-p_i)/(r_i*r_i');
        x_new = x-(lambda*r_i)';
        
        res = norm(A*x_new-p_i);
        plot([x(1),x_new(1)],[x(2),x_new(2)],'b--');
        x = x_new; 
        iter = iter+1;
    end
end

plot(x(1),x(2),'r*')

end

