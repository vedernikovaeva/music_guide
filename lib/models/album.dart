class Album {
  final int id;
  final String title;
  final int artistId;
  final int year;
  final List<int> songIds;

  Album({
    required this.id,
    required this.title,
    required this.artistId,
    required this.year,
    required this.songIds,
  });

  Album copyWith({
    int? id,
    String? title,
    int? artistId,
    int? year,
    List<int>? songIds,
  }) {
    return Album(
      id: id ?? this.id,
      title: title ?? this.title,
      artistId: artistId ?? this.artistId,
      year: year ?? this.year,
      songIds: songIds ?? this.songIds,
    );
  }

  @override
  String toString() {
    return 'Album(id: $id, title: $title, artistId: $artistId, year: $year, songs: ${songIds.length})';
  }
}