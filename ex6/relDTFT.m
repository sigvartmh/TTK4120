function [ output_args ] = relDTFT( N_x, res )
%relDTFT shows the relation ship between DTFT and DFT
%   Solution to excercise 1 which uses a resolution for the DTFT plot and
%   plots the stem of the DFT into the plot of DTFT plot.
    f = 0:res:1;
    figure;
    plot(f,abs(X_f(N_x, f)));
    dft(N_x, 1/4); %Nx/4
    figure(2);
    plot(f,abs(X_f(N_x, f)));
    dft(N_x, 1/2); %Nx/2
    figure(3);
    plot(f,abs(X_f(N_x, f)));
    dft(N_x, 1);   %Nx
    figure(4);
    plot(f,abs(X_f(N_x, f)));
    dft(N_x, 2);   %Nx*2
    figure(5)
    plot(f,abs(X_f(N_x, f)));
    xlabel('f'); 
    ylabel('|X(f)|');
    title('DTFT plot');
end

function [ out ] = X_f( N_x, f )  
    w = 2*pi*f;
    [ num ] = 1-(0.9*exp(-1i*w)).^N_x;
    den = 1-(0.9*exp(-1i*w));
    out = num./den;
end

function [ out ] = dft(N_x, fac)
    hold on;
    x_n = 0.9.^(0:(N_x-1));
    N = N_x*fac;
    f = 0:1/(N-1):1; 
    out = fft(x_n, N);
    stem(f, abs(out));
    xlabel('f'); 
    ylabel('|X(f)|');
    title(sprintf('DFT length = Nx*%s', strtrim(rats(fac))));
    hold off;
end