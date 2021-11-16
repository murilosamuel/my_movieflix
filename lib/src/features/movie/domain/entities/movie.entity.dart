import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';

class Movie extends Media{
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final MediaType mediaType;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    this.backdropPath,
    this.posterPath,
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
