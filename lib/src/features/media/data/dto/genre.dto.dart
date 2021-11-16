import 'package:my_movieflix/src/features/media/domain/entities/genre.entity.dart';

class GenreDto extends Genre {
  final int id;
  final String name;

  GenreDto({
    required this.id,
    required this.name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreDto.fromJson(Map<String, dynamic> json) {
    return GenreDto(
      id: json['id'],
      name: json['name'],
    );
  }
}
