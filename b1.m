clc 
format short
f=@(x) x*x-2*x-120;
a=input('Enter first guess')
b=input('Enter second guess')
if f(a)*f(b)>0
fprintf('Wrong choice of a and b')
else
    tol=5e-5;
    while abs(b-a)>tol
        c=(a+b)/2;
        if(f(c)==0)
            fprintf('The Root is %f ',c);
        end
        if f(c) < 0
            a=c;
        else
            b=c;
        end
    end
fprintf('The root is %f ',c)
end