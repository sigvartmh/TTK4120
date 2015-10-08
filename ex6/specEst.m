f1 = 7/40; f2 = 9/40; N = 1024;
%generates 100 samples of the sampled signal
t = 0:99; x = sin(2*pi*f1*t) + sin(2*pi*f2*t); X = fft(x,N);
f =0:1/N:1-1/N; figure(1)
plot(f(1:length(f)/2),abs(X(1:length(f)/2)))
xlabel('f');ylabel('|X(f)|')
title('segment length 100 samples'); grid
