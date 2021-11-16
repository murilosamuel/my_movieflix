import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/series/domain/entities/author.entity.dart';

class AuthorDto extends Author {
  final int id;
  final String creditId;
  final String name;
  final int? gender;
  final String? profilePath;

  AuthorDto({
    this.profilePath,
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
  }) : super(
          profilePath: profilePath,
          id: id,
          creditId: creditId,
          name: name,
          gender: gender,
        );

  factory AuthorDto.fromJson(Map<String, dynamic> json) {
    return AuthorDto(
      id: json['id'],
      creditId: json['credit_id'],
      name: json['name'],
      gender: json['gender'],
      profilePath: json['profile_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['profile_path']}'
          : null,
    );
  }
}
