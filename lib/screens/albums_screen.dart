import 'package:flutter/material.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/song.dart';
import '../data/mock_data.dart';
import '../widgets/album_list.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  List<Album> albums = List.from(MockData.albums);
  List<Artist> artists = List.from(MockData.artists);
  List<Song> songs = List.from(MockData.songs);
  String searchQuery = '';

  List<Album> get filteredAlbums {
    return albums.where((album) {
      final artist = artists.firstWhere(
        (a) => a.id == album.artistId,
        orElse: () => Artist(id: 0, name: '', genre: '', country: ''),
      );
      final matchesSearch = album.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          artist.name.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesSearch;
    }).toList();
  }

  void _deleteAlbum(int id) {
    setState(() {
      albums.removeWhere((a) => a.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Альбом видалено')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Альбоми'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Пошук альбому або виконавця...',
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
          ),
          Expanded(
            child: AlbumList(
              albums: filteredAlbums,
              artists: artists,
              songs: songs,
              onAlbumTap: (album) {
                // Можна додати детальну сторінку альбому
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Відкрито альбом: ${album.title}')),
                );
              },
              onDelete: _deleteAlbum,
            ),
          ),
        ],
      ),
    );
  }
}