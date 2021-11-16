import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/data/dto/genre.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/production_company.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/production_county.dto.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';

class MovieDetailDto extends MovieDetail {
  bool adult;
  String? backdropPath;
  int budget;
  List<GenreDto> genresDto;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  List<ProductionCompanyDto> productionCompaniesDto;
  List<ProductionCountryDto> productionCountriesDto;
  String releaseDateStr;
  int revenue;
  int? runtime;
  String status;
  String? tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailDto({
    required this.adult,
    required this.budget,
    required this.genresDto,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.productionCompaniesDto,
    required this.productionCountriesDto,
    required this.releaseDateStr,
    required this.revenue,
    required this.status,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.backdropPath,
    this.homepage,
    this.imdbId,
    this.overview,
    this.posterPath,
    this.runtime,
    this.tagline,
  }) : super(
          adult: adult,
          budget: budget,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          popularity: popularity,
          genres: genresDto,
          productionCompanies: productionCompaniesDto,
          productionCountries: productionCountriesDto,
          releaseDate: DateTime.parse(releaseDateStr),
          revenue: revenue,
          status: status,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
          homepage: homepage,
          imdbId: imdbId,
          overview: overview,
          backdropPath: backdropPath,
          posterPath: posterPath,
          runtime: runtime,
          tagline: tagline,
        );

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['backdrop_path']}'
          : null,
      posterPath: json['poster_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['poster_path']}'
          : null,
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      genresDto: json['genres'] != null
          ? (json['genres'] as List).map((e) => GenreDto.fromJson(e)).toList()
          : [],
      productionCompaniesDto: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((e) => ProductionCompanyDto.fromJson(e))
              .toList()
          : [],
      productionCountriesDto: json['production_countries'] != null
          ? (json['production_countries'] as List)
              .map((e) => ProductionCountryDto.fromJson(e))
              .toList()
          : [],
      releaseDateStr: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
