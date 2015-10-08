
function specEst
N = 1024;
N_1 = 256;
N_2 = 128;
 f_1 = 7/40; 
 f_2 = 9/40;
 spec(100, N, f_1, f_2);
 spec(1000, N, f_1, f_2);
 spec(30, N, f_1, f_2);
 spec(10, N, f_1, f_2);
 spec(100, N_1, f_1, f_2);
 spec(100, N_2, f_1, f_2);
end

function [ ] = spec(len, N, f_1, f_2)
   
    t=0:len-1;
    x_n = sin(2*pi*f_1*t) + sin(2*pi*f_2*t); 
    X_f = fft(x_n,N);
    f =linspace(0, 1, length(X_f));
    figure;
    plot(f(1:length(f)/2),abs(X_f(1:length(f)/2)))
    xlabel('f'); 
    ylabel('|X(f)|');
    title(sprintf('segment length %d samples and N=%d', len, N));
    
end
