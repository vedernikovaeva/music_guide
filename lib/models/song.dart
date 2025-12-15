class Song {
  final int id;
  final String title;
  final int artistId;
  final String duration;
  final int year;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.year,
  });

  Song copyWith({
    int? id,
    String? title,
    int? artistId,
    String? duration,
    int? year,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artistId: artistId ?? this.artistId,
      duration: duration ?? this.duration,
      year: year ?? this.year,
    );
  }

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artistId: $artistId, duration: $duration, year: $year)';
  }
}