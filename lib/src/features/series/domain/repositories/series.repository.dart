import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series_detail.entity.dart';

abstract class SeriesRepository {
  Future<Either<Exception, List<Series>>> bestsOfTheYear({
    required int page,
  });

  Future<Either<Exception, SeriesDetail>> find({
    required int id,
  });
}
