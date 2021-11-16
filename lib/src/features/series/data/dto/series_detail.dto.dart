import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/series/data/dto/author.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/genre.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/network.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/production_company.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/production_county.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/season.dto.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series_detail.entity.dart';

class SeriesDetailDto extends SeriesDetail {
  final String? backdropPath;
  final List<AuthorDto> createdBy;
  final List<int>? episodeRunTime;
  final String? firstAirDateStr;
  final List<GenreDto>? genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final String name;
  final List<NetworkDto>? networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String>? originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyDto>? productionCompanies;
  final List<ProductionCountryDto>? productionCountries;
  final List<SeasonDto> seasons;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  SeriesDetailDto({
    this.networks,
    this.originCountry,
    this.productionCompanies,
    this.productionCountries,
    this.genres,
    this.episodeRunTime,
    required this.backdropPath,
    required this.createdBy,
    required this.firstAirDateStr,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          networks: networks,
          originCountry: originCountry,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          genres: genres,
          episodeRunTime: episodeRunTime,
          createdBy: createdBy,
          firstAirDate: firstAirDateStr != null && firstAirDateStr.isNotEmpty
              ? DateTime.parse(firstAirDateStr)
              : null,
          homepage: homepage,
          id: id,
          inProduction: inProduction,
          languages: languages,
          lastAirDate: lastAirDate,
          name: name,
          numberOfEpisodes: numberOfEpisodes,
          numberOfSeasons: numberOfSeasons,
          originalLanguage: originalLanguage,
          originalName: originalName,
          overview: overview,
          popularity: popularity,
          backdropPath: backdropPath,
          posterPath: posterPath,
          seasons: seasons,
          status: status,
          tagline: tagline,
          type: type,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory SeriesDetailDto.fromJson(Map<String, dynamic> json) {
    return SeriesDetailDto(
      backdropPath: json['backdrop_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['backdrop_path']}'
          : null,
      posterPath: json['poster_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['poster_path']}'
          : null,
      createdBy: json['created_by'] != null
          ? (json['created_by'] as List)
              .map((e) => AuthorDto.fromJson(e))
              .toList()
          : [],
      episodeRunTime: json['episode_run_time'].cast<int>(),
      firstAirDateStr: json['first_air_date'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((e) => GenreDto.fromJson(e)).toList()
          : [],
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: json['languages'].cast<String>(),
      lastAirDate: json['last_air_date'],
      name: json['name'],
      networks: json['networks'] != null
          ? (json['networks'] as List)
              .map((e) => NetworkDto.fromJson(e))
              .toList()
          : [],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: json['origin_country'].cast<String>(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((e) => ProductionCompanyDto.fromJson(e))
              .toList()
          : [],
      productionCountries: json['production_countries'] != null
          ? (json['production_countries'] as List)
              .map((e) => ProductionCountryDto.fromJson(e))
              .toList()
          : [],
      seasons: json['seasons'] != null
          ? (json['seasons'] as List).map((e) => SeasonDto.fromJson(e)).toList()
          : [],
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
