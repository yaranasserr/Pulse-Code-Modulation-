
% reconstruction from oversampling
t=0:0.001:1;% time signal
y=2*cos(2*pi*5*t);
[B,A] = butter(3,1000/100000,'low' ); % butterworth filter 
%a cutoff frequency of 1000/100000.

zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];

% Adding zeros enhances the signal display and don't change the
%spectrum,it changes sampling freq. only
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r' );hold on;
xlabel('time')
ylabel('oversampled signals')

%%
% construction from minimum sampling
figure
t=0:0.01:1; % replace ?? with the suitable number
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.1,'low' );%Butterworth lpf with a 10th order and a cutoff frequency of 0.1 Hz.

zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];

t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);

plot(t,filtered_signal,'r' )
xlabel('time')
ylabel('minimum sampled signals')

s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));

figure
plot(freq,abs(s))
xlabel('freq')
ylabel('magnitude of minimum sampled signals')
%%

% construction from undersampling sampling
figure
t=0:0.2:1;
y=2*cos(2*pi*5*t);
[B,A] = butter(10,0.2,'low' );
% complete this part as shown in the construction from minimum sampling
%and do the necessary changes , you have to do low pass filtering and 
%display the spectrum

zero_added_signal=zeros(1,length(y)*5);
for i=1:length(y)
zero_added_signal(i*5)=y(i);
end
zero_added_signal(1:4)=[];

t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);

plot(t,filtered_signal,'r' )
xlabel('time')
ylabel('undersampled signals')


s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
freq=linspace(-fs/2,fs/2,length(s));

figure
plot(freq,abs(s))
xlabel('freq')
ylabel('magnitude of under sampled signals')