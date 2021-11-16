import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/domain/entities/crew.entity.dart';

class CrewDto implements Crew {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  CrewDto({
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

  factory CrewDto.fromJson(Map<String, dynamic> json) {
    return CrewDto(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['profile_path']}'
          : null,
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}
