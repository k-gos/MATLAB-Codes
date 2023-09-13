format short
clear all
clc

syms x;
f = @(x) x*sin(x)+cos(x);
df = diff(f, x);
dfx = inline(df);
a = pi;
tol = 5e-5;

if abs(dfx(a)) < 10^-9
    disp("wrong choice of a.");
else
    while abs(f(a)) > tol
        b = a - (f(a) / dfx(a));
        a = b;
    end
end

disp(a);
