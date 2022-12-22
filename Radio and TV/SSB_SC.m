clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
Fm = input("Enter frequency of the message signal: ");
Fc = input("Enter frequency of the carrier signal: ");
Fs = input("Enter sampling frequency: ");
%defining the time range
t = 0:0.001:0.4;
Mt =cos(2*pi*Fm*t);%defining the message signal
Ct =cos(2*pi*Fc*t);%defining the carrier signal wave
DSB1 = Mt.*Ct;%DSB-SC Modulated wave
M1 = cos(2*pi*Fm*t - (pi/2));
N1 = cos(2*pi*Fc*t - (pi/2));
DSB2 = M1.*N1;
USB = DSB1-DSB2;%Generating upper sideband signal
LSB = DSB1+DSB2;%Generating lower sideband signal

USBMult = USB.*Ct;
%defining butterworth filter
[x,y] = butter(2,(2*pi*Fm)/Fs);
F1 = filter(x,y,USBMult);
F2 = filter(x,y,F1);
F3 = filter(x,y,F2);
F4 = filter(x,y,F3);

subplot(5,1,1);%plotting the message signal wave
plot(t,Mt,'k',t,M1,'--b');
title("Baseband signal and its hilbert transform");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,2)%plotting the Carier signal wave
plot(t,Ct,'k',t,N1,'--b');
title("Carrier signal and its hilbert transform");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,3);%plotting Upper side band signal
plot(t,USB);
title("Upper Sideband Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,4);%plotting lower sidea band signal
plot(t,LSB);
title("Lower Sideband Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,5);%plotting the message signal wave
plot(t,F4);
title("Demodulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");

