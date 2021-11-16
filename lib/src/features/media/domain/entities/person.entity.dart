import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';

class Person extends Media {
  final String? profilePath;
  final bool adult;
  final int id;
  final MediaType mediaType;
  final List<Media> knownFor;
  final String name;
  final double popularity;

  Person({
    this.profilePath,
    required this.adult,
    required this.id,
    required this.mediaType,
    required this.knownFor,
    required this.name,
    required this.popularity,
  });
}