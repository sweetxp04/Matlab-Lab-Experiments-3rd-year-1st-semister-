clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
Fm = 35; %defining frequency of the message signal
Fc = 500;%defining frequency of the carrier signal
Fs = 10000;%defining sampling frequency
%defining the time range
t = (0:0.1*Fs)/Fs;
Wm = 2*pi*Fm;
Wc = 2*pi*Fc;
Mt = cos(Wm*t);%defining the message signal
Ct = cos(Wc*t);%defining the carrier signal wave
St = cos(Wc*t) + 100*sin(Wm*t);

subplot(4,1,1);%plotting the message signal wave
plot(t,Mt);
title("Baseband signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(4,1,2)%plotting the Carier signal wave
plot(t,Ct);
title("Carrier signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(4,1,3);%plotting Frequency Modulated signal
plot(t,St);
title("Frequency Modulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");