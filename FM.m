%generation of an fm signal
clc;
clear all;
close all;
fs=100000;%sampling frequency

mf = input('enter the vlaue of modulation index');
a = input('enter the value of a')
fc = input('enter the value of carrier signal')
fm = input('enter the value of baseband signal')
t=0:1/fs:(2/fm)-1/fs;
m = a*(cos(2*pi*fm*t));%modulating signal
c = a*(cos(2*pi*fc*t));%carrier signal
s = a*cos((2*pi*fc*t) + mf*sin(2*pi*fm*t)); %frequency modulated signal
figure(1)
subplot(311)
plot(t,m)
title('m(t)')
subplot(312)
plot(t,c)
title('c(t)')
subplot(313)
plot(t,s)
title('s(t)')

%Spectrum of modulated signal
 N = length(s);
 y=abs(fft(s,N));
 f=((-(N-1)/2):(N-1)/2)*(fs/N);
 q = fftshift(y);
 figure(2)
 stem(f,q);
 axis([-200 200 0 20000])
 
 
 %demodulationn
x = diff(s);
 for i=1:length(x)
     if x(i)<0
         x(i)=0;
     end
 end
 [b,r]=butter(4,(2*pi*fm)/fs);
 y1=filter(b,r,x);
 figure(3)
 subplot(211)
 plot(t,m)
 title('x(t)')
 subplot(212)
 plot(y1)
 title('demodulated')
 

