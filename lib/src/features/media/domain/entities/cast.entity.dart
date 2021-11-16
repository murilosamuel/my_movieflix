class Cast {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;

  Cast({
    this.gender,
    this.profilePath,
    required this.adult,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.character,
    required this.creditId,
    required this.order,
  });
}