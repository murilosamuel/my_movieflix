import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:my_movieflix/src/core/exceptions/imdb.exception.dart';
import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/core/data/datasource/base_api.datasource.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media_type.enum.dart';
import 'package:my_movieflix/src/features/movie/data/datasource/api/movie.datasource.dart';
import 'package:my_movieflix/src/features/media/data/dto/cast.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/crew.dto.dart';
import 'package:my_movieflix/src/features/movie/data/dto/movie.dto.dart';
import 'package:my_movieflix/src/features/movie/data/dto/movie_detail.dto.dart';
import 'package:http/http.dart' as http;
import 'package:my_movieflix/src/features/media/data/dto/person.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series.dto.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';

class MovieDataSourceImpl extends BaseApi implements MovieDataSource{

  static final DateFormat _apiDateFormat = DateFormat('yyyy-MM-dd');

  @override
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  }) async {
    var url =
        '${ApiProperties.apiBaseUrl}/search/multi?$baseUrl&query=$title&page=$page';
    var response = await http.get(Uri.parse(url));
    var responseJson = json.decode(response.body);
    var results = responseJson['results'];
    try {
      if (response.statusCode == 200) {
        var list = List<Media>.from(results.map(
          (e) => e['media_type'] == MediaType.movie.customName
              ? MovieDto.fromJson(e)
              : (e['media_type'] == MediaType.tv.customName
                  ? SeriesDto.fromJson(e)
                  : PersonDto.fromJson(e)),
        ));
        return Right(list);
      } else {
        return Left(ImdbException(
          imdbMessage: responseJson['Error'],
        ));
      }
    } catch (ex) {
      return Left(Exception(ex));
    }
  }

  @override
  Future<Either<Exception, MovieDetailDto>> find(int id) async {
    var url =
        '${ApiProperties.apiBaseUrl}/movie/$id?$baseUrl';
    var urlCredit = '${ApiProperties.apiBaseUrl}/movie/$id/credits?$baseUrl';
    var response = await http.get(Uri.parse(url));
    var responseCredit = await http.get(Uri.parse(urlCredit));
    var responseJson = json.decode(response.body);
    var responseCreditJson = json.decode(responseCredit.body);
    try {
      if (response.statusCode == 200) {
        var detail = MovieDetailDto.fromJson(responseJson);
        if (responseCredit.statusCode == 200){
          detail.crew = List<CrewDto>.from(responseCreditJson['crew'].map(
            (e) => CrewDto.fromJson(e),
          ));
          detail.cast = List<CastDto>.from(responseCreditJson['cast'].map(
                (e) => CastDto.fromJson(e),
          ));
        }
        return Right(detail);
      } else {
        return Left(ImdbException(
          imdbMessage: responseJson['Error'],
        ));
      }
    } catch (ex) {
      return Left(Exception(ex));
    }
  }

  @override
  Future<Either<Exception, List<MovieDto>>> recentlyAdded({
    required int page,
  }) async {
    var startDate = DateTime.now().add(const Duration(days: -30));
    var startDateStr = _apiDateFormat.format(startDate);
    var endDateStr = _apiDateFormat.format(DateTime.now());
    var url = '${ApiProperties.apiBaseUrl}/discover/movie?'
        'primary_release_date.gte=$startDateStr&'
        'primary_release_date.lte=$endDateStr&'
        'sort_by=popularity.desc&page=$page';
    return _fetchMovie(url);
  }

  @override
  Future<Either<Exception, List<MovieDto>>> comingSoon({required int page}) {
    var endDate = DateTime.now().add(const Duration(days: 60));
    var startDateStr = _apiDateFormat.format(DateTime.now());
    var endDateStr = _apiDateFormat.format(endDate);
    var url = '${ApiProperties.apiBaseUrl}/discover/movie?'
        'primary_release_date.gte=$startDateStr&'
        'primary_release_date.lte=$endDateStr&'
        'sort_by=popularity.desc&'
        'page=$page';
    return _fetchMovie(url);
  }

  Future<Either<Exception, List<MovieDto>>> _fetchMovie(String url) async{
    var response = await http.get(Uri.parse(url));
    var responseJson = json.decode(response.body);
    var results = responseJson['results'];
    try {
      if (response.statusCode == 200) {
        var list = List<MovieDto>.from(results.map(
              (e) => MovieDto.fromJson(e),
        ));
        return Right(list);
      } else {
        return Left(ImdbException(
          imdbMessage: responseJson['Error'],
        ));
      }
    } catch (ex) {
      return Left(Exception(ex));
    }
  }

}
