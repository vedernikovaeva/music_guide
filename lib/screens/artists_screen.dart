import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../data/mock_data.dart';
import '../widgets/artist_list.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  List<Artist> artists = List.from(MockData.artists);
  String searchQuery = '';
  String? selectedGenre;

  List<String> get genres {
    return artists.map((a) => a.genre).toSet().toList()..sort();
  }

  List<Artist> get filteredArtists {
    return artists.where((artist) {
      final matchesSearch = artist.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesGenre = selectedGenre == null || artist.genre == selectedGenre;
      return matchesSearch && matchesGenre;
    }).toList();
  }

  void _deleteArtist(int id) {
    setState(() {
      artists.removeWhere((a) => a.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Виконавця видалено')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Виконавці'),
        backgroundColor: Colors.purple,
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
                    hintText: 'Пошук виконавця...',
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
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedGenre,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        hint: const Text('Всі жанри'),
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('Всі жанри'),
                          ),
                          ...genres.map((genre) {
                            return DropdownMenuItem<String>(
                              value: genre,
                              child: Text(genre),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGenre = value;
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
            child: ArtistList(
              artists: filteredArtists,
              onArtistTap: (artist) {
                Navigator.pushNamed(
                  context,
                  '/artist-detail',
                  arguments: artist,
                );
              },
              onDelete: _deleteArtist,
            ),
          ),
        ],
      ),
    );
  }
}