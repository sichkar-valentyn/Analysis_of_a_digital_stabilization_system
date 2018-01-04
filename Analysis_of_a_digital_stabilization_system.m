% Analysis of a digital stabilization system
close all;
DigitalStabSystem % Simulink-model
Ra=10; Ta=0.01; Ke=0.05;Km = Ke; J=0.5e-5;
Kpc = 3; Tpc = 0.001;
Kcs=10/3;Kvs=10/600;
Tcr=Ta; Kcr=5;
Tvr=8*Tpc; Kvr=5;
Kadc = (2^10-1)/10; Kdac = 10/(2^10-1);
% Kadc = (2^4-1)/10; Kdac = 10/(2^4-1);


% Tend = 0.1; % For step
h = Tpc/10;
Tend = 0.05;
M_L=0.0; t_L=Tend/2;

% g = 1023;
% g = 15;
% g = 1.5;
g = 0.51;

% Ts = h;
Ts = 0.001;
% Ts = 0.002;
% Ts = 0.003;
% Ts = 0.004;
% Ts = 0.01;


[t,x,W,Ia,Uvr,Ucr]=sim('DigitalStabSystem',Tend);
figure(1);
subplot(2,1,1); plot(t,W); title('W(t), rad/s');
                grid on;
subplot(2,1,2); plot(t,Ia); title('Ia(t), A');
                grid on;
                
figure(2);
subplot(2,1,1); stairs(t,Uvr); title('Uvr[n]');
                grid on;
%                 axis([0  Tend  -1.2*Umax  1.2*Umax]);
subplot(2,1,2); stairs(t,Ucr); title('Ucr[n]');
                grid on;
%                 axis([0  Tend  -1.2*Umax  1.2*Umax]);

