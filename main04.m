%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sahebeh Dadboud: 
% Classical 4th RK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;                                              
clear all;

h = 0.03;                                          % step size
t = -2.5:h:10;                                     
y = zeros(2,length(t));        
y(:,1) = [(2.5)*sin(2.5);(-2.5)*cos(2.5)];         %initial conditions                                 
             

for i=1:(length(t)-1)
    t(i+1) = t(i) + h;                             % calculation loop
    %k1 = F(t(i),y(i));
    k1 = [0 1;-1 0]*y(:,i) + [sin(i);cos(i)];
    %k2 = F(t(i)+0.5*h,y(i)+0.5*h*k1);
    k2 = [0 1;-1 0]*(y(:,i)+(0.5*h*k1)) + [sin(i);cos(i)];
    %k3 = F((t(i)+0.5*h),(y(i)+0.5*h*k2));
    k3 = [0 1;-1 0]*(y(:,i)+(0.5*h*k2)) + [sin(i);cos(i)];
    %k4 = F((t(i)+h),(y(i)+k3*h));
    k4 = [0 1;-1 0]*(y(:,i)+(h*k3)) + [sin(i);cos(i)];
    y(:,i+1) = y(:,i) + h/6*(k1+(2*k2)+(2*k3)+k4);         % main equation
end
plot(t,y);
%plot(y);
