clear all;
close all;
clc;
f1 = input("Enter message signal frequency: ");
f2 = input("Enter carrier signal frequency: ");
amp = 5;
t = 0:0.001:1;%Initializing time axis
Mt = sin(2*pi*f1*t);
Ct = amp.*sawtooth(2*pi*f2*t);
plot(t,Mt);

for i=1:length(Ct)
    if(Mt(i)>=Ct(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end

subplot(3,1,1)
plot(t,Mt);
title("Message Signal");
xlabel("Time in sec");
ylabel("Amplitude");
grid on;

subplot(3,1,2)
plot(t,Ct);
title("Carrier Signal");
xlabel("Time in sec");
ylabel("Amplitude");
grid on;

subplot(3,1,3)
plot(t,pwm,'r');
title("PWM Signal");
xlabel("Time in sec");
ylabel("Amplitude");
grid on;