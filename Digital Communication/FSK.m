clear all;
close all;
clc;

amp = input("Enter amplitude of the carriers: ");
f1 = input("Enter frequency of the first carrier: ");
f2 = input("Enter frequency of the second carrier: ");
x = [1 0 0 1 1 0 1];
bit = [];

for i=1:length(x)
    if (x(i)==1)
        k = ones(1,1000);
    else
        k = zeros(1,1000);
    end
    bit = [bit k];
end

t = 0.001:0.001:length(x);
c1 = amp.*sin(2*pi*f1*t);
c2 = amp.*sin(2*pi*f2*t);

for j=1:1000*length(x)
    if(bit(j)==1)
        mbit(j) = c1(j);
    else
        mbit(j) = c2(j);
    end
end

subplot(4,1,1);
plot(t,bit,'k','lineWidth',1.5);
title("Message signal");
xlabel("Time in sec");
ylabel("Amplitude");

subplot(4,1,2);
plot(t,c1);
title("Carrier 1");
xlabel("Time in sec");
ylabel("Amplitude");

subplot(4,1,3);
plot(t,c2);
title("Carrier 2");
xlabel("Time in sec");
ylabel("Amplitude");

subplot(4,1,4);
plot(t,mbit);
title("FSK Signal");
xlabel("Time in sec");
ylabel("Amplitude");








