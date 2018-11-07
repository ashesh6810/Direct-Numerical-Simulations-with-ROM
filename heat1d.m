clear all;close all;clc;
N = 128;
h = 2*pi/N;
x = (0:N-1)*h;
dt  = 0.001;
D = 0.5;
k = [0:N/2-1 0 -N/2+1:-1]*2*pi/(2*pi);
k1 = 1i*k;
k2 = k1.^2;

uinit = sin(x);
u0 = uinit;

for i=0:dt:1
 uhat=fft(u0)+dt*k2.*fft(u0);
 u0=real(ifft(uhat));
  plot(x,uinit,x,u0)
    axis([0,2*pi,-100,100])
    title(num2str(i))
    pause(0.01);
end
 