%% Write the function here
f = @(x) x*log10(x) - 1.2;
a = 2; %% 1st initial point
b = 3; %% 2nd initial point
n = 4; %% number of decimal places
epsilon = 5*10^(-n-1); %% maximum tolerance error upto "n" decimal accuracy
itermax = ceil(log2((abs(b-a)/epsilon))); %% n=maximum number of iterations 
x0 = (a+b)/2;
err = abs(b-a);
iter = 1;
Variables = {'Iter','a','b','x0','f_x0','Error'};

HG = [iter a b x0 f(x0) err];
if f(a)*f(b)>0
disp('Wrong choice of a and b'); %% Recheck points a and b
else
    while (iter<=itermax && err>=epsilon)
        if f(a)*f(x0)<0 %% check IVT property
        b = x0; %% update b
        else
        a = x0; %% update a
        end
        x0 = (a+b)/2;
        err = abs(f(x0)); %% Compute error or f(x) at new root
        HG = [HG;iter+1 a b x0 f(x0) err]; %% for printing purpose
        iter = iter+1; %% Update the iteration counter
    end
end
disp('Output table')
Result = array2table(HG); %% Convert array to table for displaying
Result.Properties.VariableNames(1:size(HG,2)) = Variables
x0 = x0-rem(x0,10^-n); %% convert to n decimal places
fprintf('Converged solution after %d iterations \n',iter);
fprintf('Root is %2.5f \n',x0) %% Final root print
