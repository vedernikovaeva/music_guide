import 'package:flutter/material.dart';
import '../models/song.dart';
import '../models/artist.dart';
//import '../models/album.dart';
import '../data/mock_data.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context)!.settings.arguments as Song;
    final artist = MockData.artists.firstWhere(
      (a) => a.id == song.artistId,
      orElse: () => Artist(id: 0, name: 'Невідомий', genre: '', country: ''),
    );
    final albums = MockData.albums.where((a) => a.songIds.contains(song.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade100, Colors.blue.shade50],
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.music_note, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    artist.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        avatar: const Icon(Icons.access_time, size: 16),
                        label: Text(song.duration),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        avatar: const Icon(Icons.calendar_today, size: 16),
                        label: Text('${song.year}'),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Альбоми з цією піснею (${albums.length})',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (albums.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Ця пісня не входить до жодного альбому',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    ...albums.map((album) {
                      final albumArtist = MockData.artists.firstWhere(
                        (a) => a.id == album.artistId,
                        orElse: () => Artist(id: 0, name: 'Невідомий', genre: '', country: ''),
                      );
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.album, color: Colors.white),
                          ),
                          title: Text(album.title),
                          subtitle: Text('${albumArtist.name} • ${album.year}'),
                          trailing: const Icon(Icons.album, color: Colors.green),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}