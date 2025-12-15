# Music Guide (Довідник меломана)

Зручний та простий Flutter-додаток для перегляду інформації про музичних виконавців, альбоми та пісні.

## Архітектура проєкту
```
lib/
├── main.dart                   
├── models/                    
   ├── artist.dart             
   ├── song.dart          
   └── album.dart              
├── widgets/                    
  ├── artist_card.dart        
  ├── song_card.dart          
  ├── album_card.dart       
  ├── artist_list.dart         
  ├── song_list.dart          
   └── album_list.dart          
├── screens/                    
   ├── home_screen.dart        
   ├── artists_screen.dart     
   ├── songs_screen.dart        
   ├── albums_screen.dart       
   ├── artist_detail_screen.dart 
   └── song_detail_screen.dart  
   └── data/
       └── mock_data.dart          
└── pubspec.yaml                    
```
