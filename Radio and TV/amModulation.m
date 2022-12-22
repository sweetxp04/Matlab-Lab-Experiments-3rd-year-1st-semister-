clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
Am = input("Enter amplitude of the message signal: ");
Fm = input("Enter frerquncy of the message signal: ");
Ac = input("Enter amplitude of the carrier signal: ");
Fc = input("Enter frequency of the carrier signal: ");
Fs = input("Enter sampling frequency: ");
t = 0:0.001:1;%defining the time range
MI = Am/Ac; %defining modulating index
Mt =Am.*sin(2*pi*Fm*t);%defining the message signal
Ct =Ac.*sin(2*pi*Fc*t);%defining the carrier signal wave
St =(1+MI*Mt).*Ct;%Amplitude Modulated wave, according to the standard definition
O = St;
%defining a loop for rectification of the modulated signal
for i=1:length(t)
    if O(i)<=0
        O(i)=0;
    end
end
[x,n] = butter(2,2*pi*Fm/Fs);%defining butterworth lpf of 2nd order 
O1 = filter(x,n,O);
O2 = filter(x,n,O1);
O3 = filter(x,n,O2);

subplot(5,1,1)%plotting the message signal wave
plot(t,Mt);
title("Message Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,2);%plotting the carrier signal wave
plot(t,Ct);
title("Carrier Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,3);%plotting the amplitude modulated wave
plot(t,St);
title("Modulated AM Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,4);%plotting the Rectified modulated wave
plot(t,O);
title("Rectified modulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
subplot(5,1,5);%plotting the demodulated wave
plot(t,O3);
title("Demodulated Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");

