import 'package:flutter/material.dart';
import '../models/artist.dart';
//import '../models/song.dart';
//import '../models/album.dart';
import '../data/mock_data.dart';

class ArtistDetailScreen extends StatelessWidget {
  const ArtistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final artist = ModalRoute.of(context)!.settings.arguments as Artist;
    final songs = MockData.songs.where((s) => s.artistId == artist.id).toList();
    final albums = MockData.albums.where((a) => a.artistId == artist.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
        backgroundColor: Colors.purple,
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
                  colors: [Colors.purple.shade100, Colors.purple.shade50],
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    artist.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        label: Text(artist.genre),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(artist.country),
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
                    'Пісні (${songs.length})',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (songs.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Немає пісень',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    ...songs.map((song) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.music_note, color: Colors.white),
                            ),
                            title: Text(song.title),
                            subtitle: Text('${song.duration} • ${song.year}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios, size: 16),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/song-detail',
                                  arguments: song,
                                );
                              },
                            ),
                          ),
                        )),
                  const SizedBox(height: 24),
                  Text(
                    'Альбоми (${albums.length})',
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
                          'Немає альбомів',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    ...albums.map((album) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.album, color: Colors.white),
                            ),
                            title: Text(album.title),
                            subtitle: Text('${album.year} • ${album.songIds.length} пісень'),
                          ),
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}