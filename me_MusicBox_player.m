function me_MusicBox_player(varargin)
% 音乐播放器，功能简单
% p.s. 其实不用这个播放器也可以直接播放，毕竟是标准的波形文件，用sound(data,41000)也可以播放，只是没有暂停功能很蛋疼
global H_FIG H_K1 H_K2 H_T1 H_M1 H_M2 H_AP Y Fs H_C1 H_S1
if nargin<=2
    if nargin==0
        [Y,Fs]=audioread('MusicBox\相思.wav');
    elseif nargin==1
        Y=varargin{1};
        Fs=44100;
    else
        Y=varargin{1};
        Fs=varargin{2};
%         Fs=44100;
    end
    H_FIG=figure('Name','播放器','Numbertitle','off','unit','pixels','Position',[800,500,420,180],'MenuBar','none');
    H_M1=uimenu('Label','打开','callback',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'M1'));
    H_M2=uimenu('Label','保存','callback',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'M2'));
    H_K1=uicontrol(H_FIG,'style','pushbutton','position',[20,20,80,80],'string','播放','fontsize',8,'enable','on',...
        'callback',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'K1'));
    H_K2=uicontrol(H_FIG,'style','pushbutton','position',[120,20,80,80],'string','停止','fontsize',8,...
        'callback',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'K2'));
    H_T1=uicontrol(H_FIG,'style','text','unit','pixels','position',[20,120,180,40],'BackgroundColor',[1,1,1],...
        'String','00:00/12:34','FontName','Consolas','FontSize',20);
    H_C1=uicontrol(H_FIG,'style','checkbox','position',[220,140,60,20],'String','循环','FontSize',12,'value',0);
    H_S1=uicontrol(H_FIG,'style','slider','position',[220,20,180,20]);
%     H_T2=uicontrol(H_FIG,'style','text','position',[300,40,20,20],'String',')
    H_AP=audioplayer(Y,Fs);
    set(H_AP,'TimerFcn',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'F1'));
    set(H_AP,'StopFcn',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'F2'));
    set(H_AP,'StartFcn','');
    CurrentTime=floor(H_AP.CurrentSample/H_AP.SampleRate);
    TotalTime=floor(H_AP.TotalSample/H_AP.SampleRate);
    set(H_T1,'String',[time2str(CurrentTime),'/',time2str(TotalTime)]);
else
    cmdline=varargin{3};
    switch cmdline
        case 'M1'
            [filename, pathname]=uigetfile({'*.mp3;*.wav;*.wma;*.m4a','音乐文件'},'打开音乐文件');
            if filename
                [Y,Fs]=audioread([pathname,filename]);
                H_AP=audioplayer(Y,Fs);
                set(H_AP,'TimerFcn',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'F1'));
                set(H_AP,'StopFcn',@(cbo,eventdata)me_MusicBox_player(cbo,eventdata,'F2'));
                set(H_K1,'String','播放');
                CurrentTime=floor(H_AP.CurrentSample/H_AP.SampleRate);
                TotalTime=floor(H_AP.TotalSample/H_AP.SampleRate);
                set(H_T1,'String',[time2str(CurrentTime),'/',time2str(TotalTime)]);
            end
        case 'M2'
            [filename, pathname]=uiputfile({'*.wav','wav文件';'*.m4a','m4a文件';'*.ogg','ogg文件';'*.flac','flac文件'},'保存音乐文件');
            if filename
                audiowrite([pathname,filename],Y,Fs);
            end
        case 'K1'
            switch get(H_K1,'string')
                case '播放'
                    play(H_AP);
                    set(H_K1,'string','暂停');
                case '暂停'
                    Current_C1=get(H_C1,'Value');
                    set(H_C1,'Value',0);
                    pause(H_AP);
                    set(H_K1,'string','继续');
                    set(H_C1,'Value',Current_C1);
                case '继续'
                     resume(H_AP);
                     set(H_K1,'string','暂停');
            end
        case 'K2'
            Current_C1=get(H_C1,'Value');
            set(H_C1,'Value',0);
            stop(H_AP);
            set(H_C1,'Value',Current_C1);
            set(H_K1,'string','播放');
        case 'F1'
            CurrentTime=floor(H_AP.CurrentSample/H_AP.SampleRate);
            TotalTime=floor(H_AP.TotalSample/H_AP.SampleRate);
            set(H_T1,'String',[time2str(CurrentTime),'/',time2str(TotalTime)]);
            set(H_S1,'Value',CurrentTime/TotalTime);
        case 'F2'
            flag=get(H_C1,'Value');
            set(H_K1,'String','播放');
            if (flag==1)&&(H_AP.CurrentSample==1)
                H_AP.play;
                set(H_K1,'String','暂停');
            end
    end
end
end
%%
function str_time=time2str(time_input_second)
time_minute=floor(time_input_second/60);
time_second=mod(time_input_second,60);
if time_minute<10
    str_minute=['0',num2str(time_minute)];
elseif time_minute<=99
    str_minute=num2str(time_minute);
else str_minute='99';
end
if time_second<10
    str_second=['0',num2str(time_second)];
else str_second=num2str(time_second);
end
str_time=[str_minute,':',str_second];
end