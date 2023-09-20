clc
clear all

%% Input
f = 60; % Frequency (Hz)
T = 1/f; % Period (s)
n = 12; % Samples per cycle
dt = T/n; % delta T
time = 0: dt : 0.2;
voltage = 6*sin(2*pi*f.*time + + pi/3).*(time<=0.1) + 10*sin(2*pi*f.*time+ pi/3).*(time>0.1);
%% Mann & Morrison Algorithm
for i = 2:length(time)-1
    sine_component = voltage(i); 
    cosine_component = (voltage(i+1) - voltage(i-1))/(4*pi*60*dt);
    Vp(i) = sqrt(sine_component^2 + cosine_component^2);
end

Vp(length(time)) = Vp(length(time)-1);

%% Plot
plot(time,voltage,time,Vp,'*-')
title('Mann& Morrison Algorithm')
xlabel('time (s)')
ylabel('voltage (V)')
legend('Actual Voltage','Estimated Amplitude')
grid