import '../models/artist.dart';
import '../models/song.dart';
import '../models/album.dart';

class MockData {
  static List<Artist> artists = [
    Artist(id: 1, name: 'The Beatles', genre: 'Rock', country: 'UK'),
    Artist(id: 2, name: 'Queen', genre: 'Rock', country: 'UK'),
    Artist(id: 3, name: 'Pink Floyd', genre: 'Progressive Rock', country: 'UK'),
    Artist(id: 4, name: 'Led Zeppelin', genre: 'Hard Rock', country: 'UK'),
    Artist(id: 5, name: 'AC/DC', genre: 'Hard Rock', country: 'Australia'),
    Artist(id: 6, name: 'Metallica', genre: 'Heavy Metal', country: 'USA'),
  ];

  static List<Song> songs = [
    Song(id: 1, title: 'Hey Jude', artistId: 1, duration: '7:11', year: 1968),
    Song(id: 2, title: 'Let It Be', artistId: 1, duration: '4:03', year: 1970),
    Song(id: 3, title: 'Yesterday', artistId: 1, duration: '2:05', year: 1965),
    Song(id: 4, title: 'Bohemian Rhapsody', artistId: 2, duration: '5:55', year: 1975),
    Song(id: 5, title: 'We Will Rock You', artistId: 2, duration: '2:02', year: 1977),
    Song(id: 6, title: 'We Are The Champions', artistId: 2, duration: '2:59', year: 1977),
    Song(id: 7, title: 'Another Brick in the Wall', artistId: 3, duration: '3:59', year: 1979),
    Song(id: 8, title: 'Comfortably Numb', artistId: 3, duration: '6:23', year: 1979),
    Song(id: 9, title: 'Wish You Were Here', artistId: 3, duration: '5:34', year: 1975),
    Song(id: 10, title: 'Stairway to Heaven', artistId: 4, duration: '8:02', year: 1971),
    Song(id: 11, title: 'Whole Lotta Love', artistId: 4, duration: '5:34', year: 1969),
    Song(id: 12, title: 'Back in Black', artistId: 5, duration: '4:15', year: 1980),
    Song(id: 13, title: 'Highway to Hell', artistId: 5, duration: '3:28', year: 1979),
    Song(id: 14, title: 'Enter Sandman', artistId: 6, duration: '5:31', year: 1991),
    Song(id: 15, title: 'Nothing Else Matters', artistId: 6, duration: '6:28', year: 1991),
  ];

  static List<Album> albums = [
    Album(id: 1, title: 'Abbey Road', artistId: 1, year: 1969, songIds: [1, 2]),
    Album(id: 2, title: 'Help!', artistId: 1, year: 1965, songIds: [3]),
    Album(id: 3, title: 'A Night at the Opera', artistId: 2, year: 1975, songIds: [4]),
    Album(id: 4, title: 'News of the World', artistId: 2, year: 1977, songIds: [5, 6]),
    Album(id: 5, title: 'The Wall', artistId: 3, year: 1979, songIds: [7, 8]),
    Album(id: 6, title: 'Wish You Were Here', artistId: 3, year: 1975, songIds: [9]),
    Album(id: 7, title: 'Led Zeppelin IV', artistId: 4, year: 1971, songIds: [10]),
    Album(id: 8, title: 'Led Zeppelin II', artistId: 4, year: 1969, songIds: [11]),
    Album(id: 9, title: 'Back in Black', artistId: 5, year: 1980, songIds: [12]),
    Album(id: 10, title: 'Highway to Hell', artistId: 5, year: 1979, songIds: [13]),
    Album(id: 11, title: 'Metallica (Black Album)', artistId: 6, year: 1991, songIds: [14, 15]),
  ];
}