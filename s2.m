format short
clc
f = @(x) x*x-2*x-120;
a = input('Enter initial guess 1')
b = input('Enter initial guess 2')
tol = input('Enter tolerance ')
err=abs(b-a);
while err>tol
    c = b-((b-a)*f(b))/(f(b)-f(a));
    err=abs(c-b);
    a=b;
    b=c;
end

fprintf('The root is %f ',c)