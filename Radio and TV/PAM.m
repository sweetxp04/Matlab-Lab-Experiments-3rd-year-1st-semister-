clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
t = 0:0.001:5; %1kHz sampling frequency for 1 sec
d = 0:1/5:5;
x = sin(2*pi/4*2*t); %message signal
subplot(4,1,1)
plot(t,x);
title("Message Signal");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
y = pulstran(t,d,'rectpuls',0.1); %generating of pulse input
subplot(4,1,2)
plot(t,y);
title("Pulse Input");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
z = x.*y; %PAM OUTPUT
subplot(4,1,3)
plot(t,z);
title("Pulse Input");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
[den,num] = butter(1,2*pi*0.5/1000);
s11 = filter(den,num,z);
s12 = filter(den,num,s11);
s13 = filter(den,num,s12);
subplot(4,1,4)
plot(t,s13);
title("Pulse Input");
xlabel("Time(sec)---->");
ylabel("Amplitude--->");
