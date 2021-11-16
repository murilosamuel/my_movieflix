import 'package:my_movieflix/src/features/media/domain/entities/cast.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/crew.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/production_company.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/genre.entity.dart';
import 'package:my_movieflix/src/features/media/domain/entities/produtction_country.entity.dart';

class MovieDetail {
  bool adult;
  String? backdropPath;
  int budget;
  List<Genre> genres;
  List<Crew>? crew;
  List<Cast>? cast;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int? runtime;
  String status;
  String? tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetail({
    required this.adult,
    this.backdropPath,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.cast,
    this.crew,
  });

  String get duration {
    if (runtime == null || runtime == 0) {
      return '';
    }
    var d = Duration(minutes: runtime!);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h${parts[1].padLeft(2, '0')}min';
  }
}
