import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series_detail.entity.dart';
import 'package:my_movieflix/src/features/series/domain/repositories/series.repository.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/get_series_detail.usecase.dart';

class GetSeriesDetailUseCaseImpl implements GetSeriesDetailUseCase {

  final SeriesRepository _seriesRepository;

  GetSeriesDetailUseCaseImpl(this._seriesRepository);

  @override
  Future<Either<Exception, SeriesDetail>> find(int id) {
    return _seriesRepository.find(id: id);
  }

}