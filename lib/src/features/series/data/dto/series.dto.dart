import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

class SeriesDto extends Series{
  final String? posterPath;
  final double? popularity;
  final int id;
  final String overview;
  final String? backdropPath;
  final double voteAverage;
  final String? mediaTypeStr;
  final String? firstAirDateStr;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;

  SeriesDto({
    this.posterPath,
    this.backdropPath,
    required this.popularity,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.mediaTypeStr,
    required this.firstAirDateStr,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  }) : super(
    backdropPath: backdropPath,
    posterPath: posterPath,
    popularity: popularity,
    id: id,
    overview: overview,
    voteAverage: voteAverage,
    mediaType: MediaType.tv,
    firstAirDate: firstAirDateStr != null && firstAirDateStr.isNotEmpty
        ? DateTime.parse(firstAirDateStr)
        : null,
    originCountry: originCountry,
    genreIds: genreIds,
    originalLanguage: originalLanguage,
    voteCount: voteCount,
    name: name,
    originalName: originalName,
  );

  factory SeriesDto.fromJson(Map<String, dynamic> json) {
    return SeriesDto(
      backdropPath: json['backdrop_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['backdrop_path']}'
          : null,
      posterPath: json['poster_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['poster_path']}'
          : null,
      popularity: json['popularity'] != null
          ? num.parse(json['popularity'].toString()).toDouble()
          : null,
      id: json['id'],
      overview: json['overview'],
      voteAverage: num.parse(json['vote_average'].toString()).toDouble(),
      mediaTypeStr: json['media_type'],
      firstAirDateStr: json['first_air_date'],
      originCountry: json['origin_country'] != null
          ? (json['origin_country'] as List).map<String>((e) => e).toList()
          : [],
      genreIds: json['genre_ids'].cast<int>(),
      originalLanguage: json['original_language'],
      voteCount: json['vote_count'],
      name: json['name'],
      originalName: json['original_name'],
    );
  }
}
