class Crew {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String department;
  final String creditId;
  final String job;

  Crew({
    this.profilePath,
    this.gender,
    required this.adult,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.creditId,
    required this.department,
    required this.job,
  });
}
