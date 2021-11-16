import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/series/domain/entities/season.entity.dart';

class SeasonDto extends Season {
  final String? airDateStr;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;

  SeasonDto({
    required this.airDateStr,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  }) : super(
          airDate: airDateStr != null && airDateStr.isNotEmpty
              ? DateTime.parse(airDateStr)
              : null,
          episodeCount: episodeCount,
          id: id,
          name: name,
          overview: overview,
          posterPath: posterPath,
          seasonNumber: seasonNumber,
        );

  factory SeasonDto.fromJson(Map<String, dynamic> json) {
    return SeasonDto(
      airDateStr: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['poster_path']}'
          : null,
      seasonNumber: json['season_number'],
    );
  }
}
