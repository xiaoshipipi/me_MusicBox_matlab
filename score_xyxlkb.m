% 乐谱 小雨写立可白2
score={...
'C5','B4',...
'A2A4','E3B4','C4C5','E3D5','B3E5','E3D5','C4F5','E3E5',...
'G2B4','E3','B3','E3','C4','E3','B3C5','E3B4',...前三小节完
'F2A4','C3B4','A3C5','C3D5','G2E5','D3D5','B3E5','D3F5',...
'C2C3E5','G3','D4','G3','E4','G3G4','D4C5','G3E5',...
'D3F5','A3E5','F4G5','A3F5','D3B4','B3','F4','B3',...6小节完
'E3D5','C4C5','E4E5','C4C5','#F3E4','C4','A4','C4',...
'G3C5','D4B4','A4D5','D4C5','F4B4','D4','A4','D4C5',...
'E4B4','B3','A4','B3','#G4','B3E4E5','E3C5C6','B2B4B5',...9小节完
'A1A2A4A5','E3B3B5','C4C5C6','E3D5D6','B3E5E6','E3D5D6','C4F5F6','E3E5E6',...
'G1G2B4B5','E3','B3','E3','C4','E3','B3C5C6','E3B4B5',...
'F1F2A4A5','C3B4B5','A3C5C6','C3D5D6','G1G2E5E6','D3D5D6','B3E5E6','D3F5F6',...12
'C2C3E5E6','G3','D4','G3','E4','G3G4G5','D4C5C6','G3E5E6',...
'D2D3F5F6','A3E5E6','F4G5G6','A3F5F6','D2D3B4B5','B3','F4','B3',...
'E2E3D5D6','C4C5C6','E4E5E6','C4C5C6','G2G3E4E5','C4','A4','C4',...15
'F2F3C5C6','D4B4B5','A4D5D6','D4C5C6','E2E3B4B5','B3','#G4','B3C5C6',...
'A2A4A5','D3','C4','E4','A3','A4','C5','E5',...
'D3A4D5F5','A3E5','F4G5','A3F5','D3B4','B3','D4','',...18
'E3E4A4D5','A3C5','C4E5','E4C5','#F3E4','C4','E4','',...
'F3C5','D4B4','A4D5','C5','E3B4','B3','#G4','C5',...
'A2A4','E3','B3D4','E3','A3C4','','E3','',...21
'A1A2',...
   };
audio=me_MusicBox_score2audio(score,180);
me_MusicBox_player(audio);