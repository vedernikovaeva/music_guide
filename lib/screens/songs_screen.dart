import 'package:flutter/material.dart';
import '../models/song.dart';
import '../models/artist.dart';
import '../data/mock_data.dart';
import '../widgets/song_list.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  List<Song> songs = List.from(MockData.songs);
  List<Artist> artists = List.from(MockData.artists);
  String searchQuery = '';
  int? selectedArtistId;

  List<Song> get filteredSongs {
    return songs.where((song) {
      final matchesSearch = song.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesArtist = selectedArtistId == null || song.artistId == selectedArtistId;
      return matchesSearch && matchesArtist;
    }).toList();
  }

  void _deleteSong(int id) {
    setState(() {
      songs.removeWhere((s) => s.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Пісню видалено')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пісні'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Пошук пісні...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.filter_list, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        initialValue: selectedArtistId,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        hint: const Text('Всі виконавці'),
                        items: [
                          const DropdownMenuItem<int>(
                            value: null,
                            child: Text('Всі виконавці'),
                          ),
                          ...artists.map((artist) {
                            return DropdownMenuItem<int>(
                              value: artist.id,
                              child: Text(artist.name),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedArtistId = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SongList(
              songs: filteredSongs,
              artists: artists,
              onSongTap: (song) {
                Navigator.pushNamed(
                  context,
                  '/song-detail',
                  arguments: song,
                );
              },
              onDelete: _deleteSong,
            ),
          ),
        ],
      ),
    );
  }
}