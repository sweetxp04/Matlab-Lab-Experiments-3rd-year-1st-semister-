clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
fc = 1000;
fs = 10000;
f1 = 200;
t = 0.1/fs:((2*f1)-(1/fs));
x1 = 0.4*cos(2*pi*f1*t)+0.5;
y1 = modulate(x1,fc,fs,'pwm');
subplot(4,1,1)
plot(t,x1);
axis([0 100 0 1]);
title('Modulating signal');
subplot(4,1,2)
plot(t,y1);
axis([0 1000 0 1]);
title("PWM");
x1_recov = demod(y1,fc,fs,'pwm');
[den,num] = butter(1,2*pi*f1/fs);
s11 = filter(den,num,x1_recov);
s12 = filter(den,num,s11);
subplot(4,1,3)
plot(t,x1_recov);
%axis([0 100 0 1]);
title('Time domain recovered');
subplot(4,1,4)
plot(t,s12);
%axis([0 100 0 1]);
title('Filtered Output');


