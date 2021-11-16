import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_movieflix/src/core/exceptions/imdb.exception.dart';
import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/core/data/datasource/base_api.datasource.dart';
import 'package:my_movieflix/src/features/series/data/datasource/api/series.datasource.dart';
import 'package:my_movieflix/src/features/media/data/dto/cast.dto.dart';
import 'package:my_movieflix/src/features/media/data/dto/crew.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series_detail.dto.dart';

class SeriesDataSourceImpl extends BaseApi implements SeriesDataSource {
  static final DateFormat _apiDateFormat = DateFormat('yyyy-MM-dd');

  @override
  Future<Either<Exception, List<SeriesDto>>> bestsOfTheYear({
    required int page,
  }) {
    var startDate = DateTime.now().add(const Duration(days: -365));
    var startDateStr = _apiDateFormat.format(startDate);
    var endDateStr = _apiDateFormat.format(DateTime.now());
    var url =
        '${ApiProperties.apiBaseUrl}/discover/tv?primary_release_date.gte=$startDateStr&primary_release_date.lte=$endDateStr&sort_by=popularity.desc&page=$page&$baseUrl';
    return _fetchSerie(url);
  }

  @override
  Future<Either<Exception, List<SeriesDto>>> filter({
    required String title,
    required int page,
  }) {
    return Future.value();
  }

  @override
  Future<Either<Exception, SeriesDetailDto>> find(int id) async {
    var url =
        '${ApiProperties.apiBaseUrl}/tv/$id?$baseUrl';
    var response = await http.get(Uri.parse(url));
    var responseJson = json.decode(response.body);

    var urlCredit = '${ApiProperties.apiBaseUrl}/tv/$id/credits?$baseUrl';
    var responseCredit = await http.get(Uri.parse(urlCredit));
    var responseCreditJson = json.decode(responseCredit.body);

    try {
      if (response.statusCode == 200) {
        var detail = SeriesDetailDto.fromJson(responseJson);
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

  Future<Either<Exception, List<SeriesDto>>> _fetchSerie(String url) async {
    var response = await http.get(Uri.parse(url));
    var responseJson = json.decode(response.body);
    var results = responseJson['results'];
    try {
      if (response.statusCode == 200) {
        var list = List<SeriesDto>.from(results.map(
          (e) => SeriesDto.fromJson(e),
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
