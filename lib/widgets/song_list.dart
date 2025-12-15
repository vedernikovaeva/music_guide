import 'package:flutter/material.dart';
import '../models/song.dart';
import '../models/artist.dart';
import 'song_card.dart';

class SongList extends StatelessWidget {
  final List<Song> songs;
  final List<Artist> artists;
  final Function(Song) onSongTap;
  final Function(int) onDelete;

  const SongList({
    Key? key,
    required this.songs,
    required this.artists,
    required this.onSongTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_off, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Пісень не знайдено',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        final artist = artists.firstWhere(
          (a) => a.id == song.artistId,
          orElse: () => Artist(id: 0, name: 'Невідомий', genre: '', country: ''),
        );
        return SongCard(
          song: song,
          artist: artist,
          onTap: () => onSongTap(song),
          onDelete: () => onDelete(song.id),
        );
      },
    );
  }
}