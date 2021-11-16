import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

abstract class FetchCatalogSeriesUseCase {
  Future<Either<Exception, List<Series>>> bestsOfTheYear({
    required int page,
  });
}
