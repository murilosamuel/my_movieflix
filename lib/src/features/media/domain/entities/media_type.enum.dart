enum MediaType {
  movie,
  tv,
  person,
}

extension EMediaType on MediaType{
  String get customName {
    var type = {
      MediaType.movie: 'movie',
      MediaType.tv: 'tv',
      MediaType.person: 'person',
    };
    return type[this] ?? 'unknown';
  }
}