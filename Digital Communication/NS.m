clear all;
close all;
clc;
 
t=0:0.0001:1;
s=sin(2*pi*t);
sv=.5.*square(2*pi*t*20)+.5;
h=sv.*s;

subplot(3,1,1)
plot(t,s)
grid on
subplot(3,1,2)
plot(t,sv,'k','linewidth',2)
grid on

subplot(3,1,3)
plot(t,h)
axis ([0 1 -1.2 1.2])
grid on
