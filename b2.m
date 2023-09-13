clc

 % f = @(x) x^2 - 2*x + 1;
 f = @(x) x*log10(x) -1.2;
    %f=@(x)x^2-4;

a = 2;
b = 3;
inter = 0;
intermax = 70;
tol = 5e-5;

mean = (a+b)/2;

while abs(f(mean)) > tol && inter <= intermax
    
    mean = (a + b)/2;
    if f(mean) > 0
        b = mean;
    else
        a = mean;
    end
    
    inter = inter+1;
    if f(mean) == 0
        break;
    end
end

disp(mean)
