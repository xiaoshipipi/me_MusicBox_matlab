function [ data1 ] = me_MusicBox_notearray( notearray1 )
%   将同一时间的几个音符转换为波形
%   
%% 泛音列
% overtone=[644.7 225.6 61.52 46.02 45.26 36.09 15.9 50.26 5.565 17.13 5.774 9.531 10.2 9.895 3.029 2.201 1.811 2.359 1.517 1.073];
overtone=[987.8,368.6,620.2,483.9,156.7,83.62,120.1,70.73,5.348,24.41,...
         27.35,21.3,10.31,6.477,15.91,3.495,2.546,0.4751];
%% 振幅与衰减
zhenfu=[1,1.5,1.5,1.5,1.5,1.5];
%shuaijian=[2,3,3,3,3,3,3];
%% 参数设置
T=5;%时长5sec
fs=44100;%bps
%%
data1=zeros(fs*T,1);
idx=[0,find((notearray1<='9')&(notearray1>='0'))];
notearray=cell(length(idx)-1,1);
if length(idx)==2
    freq=round(me_MusicBox_freq(notearray1)*(1:length(overtone)));
    fft1=zeros(fs*T,1);
    fft1(1+T*freq)=overtone;
    fft1(T*fs+1-T*freq)=overtone;
    data1=2*ifft(8*fft1).*exp(-(1:fs*T)'*(4*freq(1)/440)/fs);
else
for n=2:length(idx)
    notearray{n-1}=notearray1((idx(n-1)+1):idx(n));
end
for n=1:length(notearray)
    freq=round(me_MusicBox_freq(notearray{n})*(1:length(overtone)));
    fft1=zeros(fs*T,1);
    fft1(1+T*freq)=overtone;
    fft1(T*fs+1-T*freq)=overtone;
    %data1=data1+zhenfu(n)*ifft(8*fft1).*exp(-(1:fs*T)'*(shuaijian(n))/fs);
    data1=data1+zhenfu(n)*ifft(8*fft1).*exp(-(1:fs*T)'*(4*freq(1)/440)/fs);
end
end
end

