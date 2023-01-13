clear all;%clear workspace window
close all;%close all window except command window
clc;%clear command window
t = 0:0.001:0.1;
t1 = zeros(1,length(t));
f = input("Enter the baseband signal frequency: ");
x = sin(2*pi*f*t);
n = input("Enter the integer which decides the sampling frequency: ");
for i = 1:length(t)
    if n*i<=length(t)
        t1(n*i)=1;
    end
end

s1 = x.*t1;
[den,num] = butter(1,2*pi*f/1000);
s11 = filter(den,num,s1);
subplot(2,1,1)
stem(t,s1)
title("Sampling rate less than Nyquist rate");
subplot(2,1,2)
plot(t,s11)
title("Reconstructed signal");
