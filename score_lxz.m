%乐谱 绿袖子
score={...
'A4','' ,'C4','E4','A4','E4D5','C4','G3G4C5E5','C4','E4','G4F5','E4E5','C4','G3G4B4D5','B3','D4','G4','D4B4','B3',...
'E3B3E4G4','G3','B3','E4A4','B3B4','G3','F3A4C5','A3','C4','F4B4','C4A4','A3','D3F4A4','','','#G4','A4','','E3D4#G4B4','','','','#G4','','E4','','','',...
'A4','','A3E4C5','','','','D5','','C3G4C5E5','','','F5','E5','','G3G4B4D5','','','','B4','',...
'E3B3E4G4','','','A4','B4','','F3A4C5','','','B4','A3E4A4','','E3B3D4#G4','','','#F4','#G4','','A3C4E4A4','','','','','',...
'C3E5G5','','','','G5','','C3E5G5','','','F5','E5','',...
'G3B3D4D5','','','','B4','','E3B3E4G4','','','A4','B4','',...
'F3C4A4C5','','','B4','A4','','E3B3D4#G4','','','#F4','#G4','','A3C4E4A4','','',''
   };
audio=me_MusicBox_score2audio(score);
me_MusicBox_player(audio);