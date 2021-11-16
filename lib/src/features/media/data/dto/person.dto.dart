import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';
import 'package:my_movieflix/src/features/movie/data/dto/movie.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series.dto.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/person.entity.dart';

class PersonDto extends Person{
  final String? profilePath;
  final bool adult;
  final int id;
  final String mediaTypeStr;
  final List<Media> knownFor;
  final String name;
  final double popularity;

  PersonDto({
    this.profilePath,
    required this.adult,
    required this.id,
    required this.mediaTypeStr,
    required this.knownFor,
    required this.name,
    required this.popularity,
  }): super(
    name: name,
    id: id,
    adult: adult,
    knownFor: knownFor,
    mediaType: MediaType.person,
    popularity: popularity,
    profilePath: profilePath,
  );

  factory PersonDto.fromJson(Map<String, dynamic> json) {

    List<Media> knownForMedia = [];
    if (json['known_for'] != null) {
      json['known_for'].forEach((v) {
        var media = v['media_type'] == MediaType.movie.customName
            ? MovieDto.fromJson(v) : SeriesDto.fromJson(v);
        knownForMedia.add(media);
      });
    }
    return PersonDto(
      profilePath: json['profile_path'],
      adult: json['adult'],
      id: json['id'],
      mediaTypeStr: json['media_type'],
      name: json['name'],
      popularity: json['popularity'],
      knownFor: knownForMedia,
    );
  }
}
