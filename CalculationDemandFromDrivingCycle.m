clc   %clears the command window
clear all   % clears the previous work space
close all    % closes the privous graphical objects(figures)
%% Calculation of the demand power from driving cycle
theta=0; %Grade of the road
mb=11000; % kg
mp=2000; % kg
m=mb+mp; % kg
data3 = importdata('uddscol.txt');% import data from txt file
data=data3.data;
data1 = data(3:1369,2) ; 
data2 = data(3:1370,1:2) ; 
g=9.81; % m/s^2
C_d=0.79; % Drag coefficient
rho_a=1.202; % Air density,kg/m^3
A_f=7.316; % Frontal area, m^2
v_w=2; % wind speed, m/s
v=data1*0.44704; % mph to mps
a=diff(data2(:,2)*0.44704)./diff(data2(:,1));
mu=0.005+(14.696/36)*(0.01+0.0095*(v/27.778).^2);% friction coefficient
P_add=30000; % W
% The Urban Dynamometer Driving Schedule is used to represent real power demands.
Pd=(m*a + m*g*sin(theta) + mu*m*g*cos(theta) + 1/2*C_d*rho_a*A_f*(v+v_w).^2).*v + P_add; % Pd(t)
plot(Pd);