import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/data/datasource/api/series.datasource.dart';
import 'package:my_movieflix/src/features/series/data/dto/series.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series_detail.dto.dart';
import 'package:my_movieflix/src/features/series/domain/repositories/series.repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesDataSource _serieDataSource;

  SeriesRepositoryImpl(this._serieDataSource);

  @override
  Future<Either<Exception, List<SeriesDto>>> bestsOfTheYear({required int page}) {
    return _serieDataSource.bestsOfTheYear(page: page);
  }

  @override
  Future<Either<Exception, SeriesDetailDto>> find({required int id}) {
    return _serieDataSource.find(id);
  }
}