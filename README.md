# me_MusicBox_MATLAB

## 音乐盒 by碉堡了的少年
DEMO是乐谱脚本，如score_xyxlkb.m
打开任何一个乐谱运行，即可调用其他函数翻译乐谱并播放。
修改乐谱即可演奏你想的任何音乐，祝你玩的愉快。

共4个函数：
1. me_MusicBox_player:用来播放音乐的简单播放器，在MATLAB自带的audioplayer类型上加上了界面、暂停、进度条等简单的功能
2. me_MusicBox_score2audio:将乐谱转为音频波形文件，波形文件是通用的，用sound(data,41000)也可以实现播放
3. me_MusicBox_notearray:将音符转为波形，根据钢琴的音色添加了一些简单的泛音列，比正弦波好听一些。
4. me_MusicBox_freq:根据音符名确定主频率

有问题可联系：xiaoshipipi@sina.com