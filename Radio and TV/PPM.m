clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
fc = 100;
fs = 1000;
f1 = 80;
t = 0.1/fs:((2*f1)-(1/fs));
x1 = 0.4*cos(2*pi*f1*t)+0.5;
y1 = modulate(x1,fc,fs,'ppm');
plot(t,x1)
axis([0 100 0 1]);