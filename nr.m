format short
clc
syms x;
f=@(x) x*exp(x)-1;
df=diff(f,x);
dfx=inline(df);
x0=input('Enter first guess')
tol=input('Enter tolerance ')
a=abs(f(x0)/dfx(x0));
while a>tol
    if dfx(x0)==0
        fprintf('Slope is zero')
        exit
    else
        xn=x0-f(x0)/dfx(x0);
        a=abs(xn-x0);
        x0=xn;
    end
end
fprintf('The root is %f',xn)