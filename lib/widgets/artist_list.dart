import 'package:flutter/material.dart';
import '../models/artist.dart';
import 'artist_card.dart';

class ArtistList extends StatelessWidget {
  final List<Artist> artists;
  final Function(Artist) onArtistTap;
  final Function(int) onDelete;

  const ArtistList({
    Key? key,
    required this.artists,
    required this.onArtistTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_off, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Виконавців не знайдено',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return ArtistCard(
          artist: artist,
          onTap: () => onArtistTap(artist),
          onDelete: () => onDelete(artist.id),
        );
      },
    );
  }
}