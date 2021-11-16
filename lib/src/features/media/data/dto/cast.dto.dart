import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/domain/entities/cast.entity.dart';

class CastDto implements Cast {
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

  CastDto({
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

  factory CastDto.fromJson(Map<String, dynamic> json) {
    return CastDto(
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
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}
