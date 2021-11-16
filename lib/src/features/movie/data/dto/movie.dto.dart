import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';

class MovieDto extends Movie {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String? mediaTypeStr;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDateStr;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDto({
    this.backdropPath,
    this.posterPath,
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.mediaTypeStr,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDateStr,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          posterPath: posterPath,
          adult: adult,
          genreIds: genreIds,
          id: id,
          mediaType: MediaType.movie,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          releaseDate: releaseDateStr != null && releaseDateStr.isNotEmpty
              ? DateTime.parse(releaseDateStr)
              : null,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['backdrop_path']}'
          : null,
      posterPath: json['poster_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['poster_path']}'
          : null,
      genreIds: json['genre_ids'] != null
          ? (json['genre_ids'] as List).map<int>((e) => e).toList()
          : [],
      id: json['id'],
      mediaTypeStr: json['media_type'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'] != null ? num.parse(json['popularity'].toString()).toDouble() : null,
      releaseDateStr: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: num.parse(json['vote_average'].toString()).toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
