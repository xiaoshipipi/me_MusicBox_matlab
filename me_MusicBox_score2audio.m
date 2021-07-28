function audio=me_MusicBox_score2audio(score,tempo)
% ����תΪ��Ƶ���Σ�����ֱ�Ӳ���
%tempo ÿ���ӵ�notearray��cell����Ĭ��240
if ~exist('tempo','var')
    tempo=240;
end
audio=zeros(round(44100*(length(score)/(tempo/60)+5)),1);
H_waitbar=waitbar(0,'��ʼ��...');
for n=1:length(score)
    waitbar(n/length(score),H_waitbar,[num2str(100*n/length(score),3),'%']);
    if isempty(score{n})
        continue
    end
    t=round(1+44100/(tempo/60)*(n-1));
    datatemp=me_MusicBox_notearray( score{n} );
    audio(t:t-1+length(datatemp))=audio(t:t-1+length(datatemp))+datatemp;
end
close(H_waitbar);
end