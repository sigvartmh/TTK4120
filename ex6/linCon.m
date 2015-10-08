function [ output_args ] = linCon( N_x, N_h )
%LINCON Summary of this function goes here
%   Detailed explanation goes here
    convolution(N_x, N_h);
    dftidft(N_x, N_h, 1);
    dftidft(N_x, N_h, 1/4);
    dftidft(N_x, N_h, 1/2);
    dftidft(N_x, N_h, 2);
end

function [ ] = convolution(N_x, N_h) 
    x_n = 0.9.^(0:(N_x-1));
    h_n = ones(1,N_h);
    %N = (N_x + N_h - 1)/2;
    y = conv(x_n,h_n);
    figure;
    stem(0:length(y)-1,y);
    xlabel('n'); 
    ylabel('y(n)');
    title(sprintf('y(n) for Nx=%s', strtrim(rats(N_x))));
    
end

function [ ]= dftidft(N_x, N_h, i)
    x_n = 0.9.^(0:(N_x-1));
    h_n = ones(1,N_h);
    N_y = (N_x + N_h - 1)*i;
    N = N_y/2;
    H_n = fft(h_n, N);
    X_n = fft(x_n, N);
    Y_n = X_n.*H_n;
    y_n = ifft(Y_n, N);
    figure;
    stem(0:(N-1),y_n)
    xlabel('n'); 
    ylabel('y(n)');
    title(sprintf('y(n) with dft and idft for N_y=%s', strtrim(rats(N_y))));
end