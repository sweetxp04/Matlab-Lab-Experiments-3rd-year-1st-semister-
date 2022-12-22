clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
Fm = input("Enter frequency of the message signal: ");
Fc = input("Enter frequency of the carrier signal: ");
Fs = input("Enter sampling frequency: ");
T = input("Enter duration over which signal to be plotted: ");
C = input("Enter value of the capacitor of the filter: ");
t = 0:T/Fs:T;%defining the time range
Mt =cos(2*pi*Fm*t);%defining the message signal
Ct =cos(2*pi*Fc*t);%defining the carrier signal wave
St = Mt.*Ct;%DSB-SC Modulated wave, according to the standard definition
O = St.*Ct;
R = 1/(2*pi*Fm*C);%defining reactance of the capacitor
H = (1/(R*C))*exp(-t/(R*C));
h = conv(H,conv(O,H));
t1 =t;
for i=length(t)+1:length(h)
    t1(i)=0;
end

subplot(4,1,1)%plotting the message signal wave
plot(t,Mt);
title("Message Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(4,1,2);%plotting the carrier signal wave
plot(t,Ct);
title("Carrier Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(4,1,3);%plotting the modulated wave
plot(t,St);
title("DSB-SC Modulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(4,1,4);%plotting the demodulated wave
plot(t1,h);
title("Demodulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
