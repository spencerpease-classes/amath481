clear all; close all; % clear all variables and figures

L=20;	% define the computational domain [-L/2,L/2] 
n=128; % define the number of Fourier modes 2^n
x2=linspace(-L/2,L/2,n+1); 

% define the domain discretization 
x=x2(1:n); 
% consider only the first n points: periodicity 
u=sech(x);	% function to take a derivative of 
ut=fft(u);	% FFT the function

k=(2*pi/L)*[0:(n/2-1) (-n/2):-1]; % k rescaled to 2pi domain

ut1=i*k.*ut;	% first derivative 
ut2=-k.*k.*ut;	% second derivative 
ut3=-i*k.*k.*k.*ut; % third derivative

u1=ifft(ut1); u2=ifft(ut2); u3=ifft(ut3); % inverse transform 
u1exact=-sech(x).*tanh(x); % analytic first derivative

figure(1)
plot(x,u,'r',x,u1,'g',x,u1exact,'go',x,u2,'b',x,u3,'c') % plot