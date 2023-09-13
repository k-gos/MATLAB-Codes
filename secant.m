format long

% Write the function here
f = @(x) cos(x)-x*exp(x);
a = 0;  % 1st point
b = 1;  % 2nd point
n = 4;  % number of decimal place
Variables = {'Iter','a','b','x0','f_x0','Error'};   %Creating table
iter = 1;  %Set the initial iteration counter 
x0 = (a*f(b)-b*f(a))/(f(b)-f(a));  %Compute new root
err = abs(f(x0));  %Compute the initial error
epsilon = 5*10^(-n-1);  %Maximum tolerance error upto 'n' decimal accuracy
itermax = 70;  %Maximum number of iterations performed
HG = [iter a b x0 f(x0) err];  %For printing purpose 
if f(a)*f(b)>0
    disp('Wrong choice of a and b');  %Recheck points 'a' and 'b'
else
    while(iter<=itermax && err>epsilon)
        a = b;  %Update a
        b = x0; %Update b
        x0 = (a*f(b)-b*f(a))/(f(b)-f(a));  %Compute new root
        err = abs(f(x0));  %Compute error or f(x) at new root
        iter = iter + 1;   %Update the iteration counter
        HG = [HG;iter a b x0 f(x0) err];  %For printing purpose
    end
end
%%For printing purpose
disp('Output table with iteration ')
Result = array2table(HG);  %Convert array to table for displaying
Result.Properties.VariableNames(1:size(HG,2)) = Variables
%x0 = x0-rem(x0,10^-n);  %Convert to n decimal places
fprintf('Converged solution after %d iterations \n',iter);
fprintf('Root is %2.9f \n',x0)  %Final root print