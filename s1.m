format short
clear 
clc


f = @(x) x*x*exp(-x/2)-1;
a = 1.42;
b = 1.43;

knot = b-((b-a)*f(b))/(f(b)-f(a));

tol = 5e-4;

while abs(f(knot)) >= tol && f(knot) ~= 0
        knot = (a*f(b) - b*f(a)) / (f(b) - f(a));
        a = b;
        b = knot;
end

disp(knot)