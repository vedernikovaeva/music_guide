class Artist {
  final int id;
  final String name;
  final String genre;
  final String country;

  Artist({
    required this.id,
    required this.name,
    required this.genre,
    required this.country,
  });

  Artist copyWith({
    int? id,
    String? name,
    String? genre,
    String? country,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      genre: genre ?? this.genre,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, genre: $genre, country: $country)';
  }
}