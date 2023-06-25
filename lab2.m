% Parameters
A = 1;       % Amplitude (V)
f = 2;       % Frequency (Hz)
Fs = 4000; 
% Define the continuous signal
t = 0:1/Fs:1-1/Fs; % time vector
x = A*sin(2*pi*f*t);
% Sample the signal
n = 0:1:(length(t)-1); % Sample indices
Ts = 1/Fs;             % Sampling interval (seconds)
xn = sin(2*pi*f*n*Ts);
figure
subplot(3,1,1)
plot(t,x)
title('Original signal');xlabel('time');ylabel('Amplitude')
subplot(3,1,2)
stem(n,xn)
title('Sampled signal');xlabel('samples');ylabel('Amplitude')
% Quantization
nq=3;
m=2*nq +1 ;
xq=double(fi(xn,1, m, nq));
subplot(3,1,3)
plot(n,xq);title("quantized signal with number of bits=3");xlabel('bits');ylabel('step');
%coding
x_c = dec2bin(xq);

%Mean square quantization error vs n-bits
N_3=quantize(n,xn,3);
N_4=quantize(n,xn,4);
N_5=quantize(n,xn,5);
N_10=quantize(n,xn,10);
figure;
plot(n,N_3,'k-x');hold on;
plot(n,N_4,'c-o');hold on;
plot(n,N_5,'m');hold on;
plot(n,N_10,'b-o');hold off;
legend('n=3','n=4','n=5','n=10');
title('Mean square quantization error vs n-bits');xlabel('number of bits');ylabel('Mean square quantization error');

function Quantization_error=quantize(n,xn,k)
m=2*k+1 ;
xq=double(fi(xn,1,m,k));
sum = zeros(1,4000);%quantization error
Fs=4000;
Ts=1/4000;
%figure;plot(n,xq);
for i = 1:1:Fs
    sum(i) = (xq(i)-xn(i))^2; 
end
Quantization_error=Ts*sum;
end