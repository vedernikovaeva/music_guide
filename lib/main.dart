import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/artists_screen.dart';
import 'screens/songs_screen.dart';
import 'screens/albums_screen.dart';
import 'screens/artist_detail_screen.dart';
import 'screens/song_detail_screen.dart';

void main() {
  runApp(const MusicGuideApp());
}

class MusicGuideApp extends StatelessWidget {
  const MusicGuideApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Довідник меломана',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/artists': (context) => const ArtistsScreen(),
        '/songs': (context) => const SongsScreen(),
        '/albums': (context) => const AlbumsScreen(),
        '/artist-detail': (context) => const ArtistDetailScreen(),
        '/song-detail': (context) => const SongDetailScreen(),
      },
    );
  }
}