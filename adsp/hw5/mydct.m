function out = mydct(x)
N=length(x);
% Generate symmetric extension and shift by half a sample in the freq. domain
f = real(fft([flip(x) x])./exp(-1i*2*pi*(N-0.5)*(0:2*N-1)/(2*N))); 
out = f(1:N)/sqrt(2*N); % scaling
out(1)=out(1)/sqrt(2); % scaling first coefficient
end



