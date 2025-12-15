import 'package:flutter/material.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/song.dart';
import 'album_card.dart';

class AlbumList extends StatelessWidget {
  final List<Album> albums;
  final List<Artist> artists;
  final List<Song> songs;
  final Function(Album) onAlbumTap;
  final Function(int) onDelete;

  const AlbumList({
    Key? key,
    required this.albums,
    required this.artists,
    required this.songs,
    required this.onAlbumTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (albums.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.album, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Альбомів не знайдено',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        final artist = artists.firstWhere(
          (a) => a.id == album.artistId,
          orElse: () => Artist(id: 0, name: 'Невідомий', genre: '', country: ''),
        );
        final albumSongs = songs.where((s) => album.songIds.contains(s.id)).toList();
        return AlbumCard(
          album: album,
          artist: artist,
          songCount: albumSongs.length,
          onTap: () => onAlbumTap(album),
          onDelete: () => onDelete(album.id),
        );
      },
    );
  }
}