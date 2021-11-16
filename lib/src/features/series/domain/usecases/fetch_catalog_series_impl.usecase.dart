import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';
import 'package:my_movieflix/src/features/series/domain/repositories/series.repository.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/fetch_catalog_series.usecase.dart';

class FetchCatalogSerieUseCaseImpl implements FetchCatalogSeriesUseCase {
  final SeriesRepository _serieRepository;

  FetchCatalogSerieUseCaseImpl(this._serieRepository);

  @override
  Future<Either<Exception, List<Series>>> bestsOfTheYear({required int page}) {
    return _serieRepository.bestsOfTheYear(page: page);
  }
}
