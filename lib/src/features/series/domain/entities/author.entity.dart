class Author {
  final int id;
  final String creditId;
  final String name;
  final int? gender;
  final String? profilePath;

  Author({
    this.profilePath,
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
  });
}