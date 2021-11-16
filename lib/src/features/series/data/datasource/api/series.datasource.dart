import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/data/dto/series.dto.dart';
import 'package:my_movieflix/src/features/series/data/dto/series_detail.dto.dart';

abstract class SeriesDataSource {
  Future<Either<Exception, List<SeriesDto>>> filter({
    required String title,
    required int page,
  });

  Future<Either<Exception, List<SeriesDto>>> bestsOfTheYear({
    required int page,
  });

  Future<Either<Exception, SeriesDetailDto>> find(int id);
}