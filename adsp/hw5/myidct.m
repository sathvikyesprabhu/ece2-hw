function out=myidct(x)
N=length(x);
x(1)=x(1)*sqrt(2);x=x*sqrt(2*N); %Scaling
out=ifft([x 0 -flip(x(2:N))].*exp(-1i*2*pi*(N-0.5)*(0:2*N-1)/(2*N))); %Shifting
out=real(flip(out(1:N)));
end