clear all; %clear workspace window
close all; %close all window except command window
clc; %clear command window
x = [1 0 1 1 0 0 1];
amp = input("Enter amplitude of the carrier signal: ");
f = input("Enter frequency of the carrier signal: ");
bit = [];
for i = 1:length(x)
    if (x(i)==1)
        k = ones(1,1000);
    else
        k = zeros(1,1000);
    end
    bit = [bit k];
end
t = 0.001:0.001:length(x);
Ct =amp.*sin(2*pi*f*t);
St = Ct.*bit;
subplot(3,1,1);
plot(t,bit,'k','lineWidth',1.5);
title("Message Signal");
xlabel("Time in sec");
ylabel("Amplitude");
subplot(3,1,2);
plot(t,Ct);
title("Carrier Signal");
xlabel("Time in sec");
ylabel("Amplitude");
subplot(3,1,3);
plot(t,St);
title("ASK Signal");
xlabel("Time in sec");
ylabel("Amplitude");
    