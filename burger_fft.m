clear all;close all;clc;
N = 128;
h = 2*pi/N;
x = (0:N-1)*h;
dt  = 0.01/2;
D = 0.1;

k = [0:N/2-1 0 -N/2+1:-1]*2*pi/(2*pi);
k1 = 1i*k;
k2 = k1.^2;
%%
%uinit = exp(-x)./(1+exp(x));
uinit=sin(x);
u0 = uinit;
count=2;vel(1,:)=u0;
for t = 0:dt:20
    %if(t==0)
       u1hat = fft(vel(count-1,:)) - dt*k1.*fft(0.5*vel(count-1,:).^2) + dt*D*k2.*fft(vel(count-1,:));
       u = ifft(u1hat);
        vel(count,:)=u;
        count=count+1;
   % else
        
%        u= 1.5*dt*(fft(vel(count-1,:)) - dt*k1.*fft(0.5*vel(count-1,:).^2) + dt*D*k2.*fft(vel(count-1,:)))-0.5*dt*(fft(vel(count-2,:)) - dt*k1.*fft(0.5*vel(count-2,:).^2) + dt*D*k2.*fft(vel(count-2,:)));
%        u=ifft(u);
%        vel(count,:)=u;
% 
%        count=count+1;
    %end

    plot(x,uinit,x,u);
    axis([0,2*pi,-1,1])
    title(num2str(t))
   pause(0.01);
end
        Xem=vel';
        [Udmd,Sdmd,Vdmd]=svd(Xem(:,1:end-1),'econ');
        Atilda=Udmd'*Xem(:,2:end)*Vdmd*diag(1./diag(Sdmd));
        [w_d,eigs_d]=eig(Atilda); Phi=Udmd*w_d;y=diag(eigs_d);
        eignew_dmd=diag(log(y));
        phi=Phi;