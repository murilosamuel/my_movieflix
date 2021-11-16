import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';

class Series extends Media {
  final String? posterPath;
  final double? popularity;
  final int id;
  final String overview;
  final String? backdropPath;
  final double voteAverage;
  final MediaType mediaType;
  final DateTime? firstAirDate;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;

  Series({
    this.posterPath,
    this.backdropPath,
    required this.popularity,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.mediaType,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });
}
