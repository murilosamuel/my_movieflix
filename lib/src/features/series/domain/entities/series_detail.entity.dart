import 'package:my_movieflix/src/features/media/domain/entities/cast.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/crew.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/network.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/production_company.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/genre.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/produtction_country.entity.dart';
import 'package:my_movieflix/src/features/series/domain/entities/author.entity.dart';
import 'package:my_movieflix/src/features/series/domain/entities/season.entity.dart';

class SeriesDetail {
  final String? backdropPath;
  final List<Author> createdBy;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<Genre>? genres;
  List<Crew>? crew;
  List<Cast>? cast;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final String name;
  final List<Network>? networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String>? originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final List<Season> seasons;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  SeriesDetail({
    this.networks,
    this.originCountry,
    this.productionCompanies,
    this.productionCountries,
    this.genres,
    this.episodeRunTime,
    required this.backdropPath,
    required this.createdBy,
    required this.firstAirDate,
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
    this.cast,
    this.crew,
  });

  bool get moreThanOneSeason => numberOfSeasons > 1;
}