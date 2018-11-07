clear all;close all;
clc;

N = 127;
dt  = 0.0001/2;
mu = .2;
[D,x]=cheb(N);

uinit=sin(x);
vel(1,:)=uinit;

u0=uinit;
for i=0:dt:5
    u0=u0 - dt*(u0')*D*(u0) + dt*mu*D^2*u0;
    u0(1)=uinit(1);
    u0(end)=uinit(end);
    plot(x,uinit,x,u0);
    axis([-1 1 -1 1])
    title(num2str(i))
   pause(0.01);
end
    