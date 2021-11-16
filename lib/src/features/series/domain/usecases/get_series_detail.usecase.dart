import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series_detail.entity.dart';

abstract class GetSeriesDetailUseCase {
  Future<Either<Exception, SeriesDetail>> find(int id);
}