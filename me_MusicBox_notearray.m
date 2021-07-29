function [ data1 ] = me_MusicBox_notearray( notearray1 )
%   将同一时间的几个音符转换为波形序列
%   
%% 泛音列
% 修改泛音列可以修改音色，用傅里叶反变换将泛音频谱转换为波形
overtone=[987.8,368.6,620.2,483.9,156.7,83.62,120.1,70.73,5.348,24.41,...
         27.35,21.3,10.31,6.477,15.91,3.495,2.546,0.4751];
%% 振幅与衰减
zhenfu=[1,1.5,1.5,1.5,1.5,1.5];
%% 参数设置
T=5;%时长5sec
%采样率
fs=44100;
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
    data1=data1+zhenfu(n)*ifft(8*fft1).*exp(-(1:fs*T)'*(4*freq(1)/440)/fs);
end
end
end

