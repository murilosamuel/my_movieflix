import 'package:mobx/mobx.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series_detail.entity.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/get_series_detail.usecase.dart';

part 'series_detail.controller.g.dart';

class SeriesDetailController = _SeriesDetailController
    with _$SeriesDetailController;

abstract class _SeriesDetailController with Store {
  final GetSeriesDetailUseCase _getSeriesDetailUseCase;

  _SeriesDetailController(this._getSeriesDetailUseCase);

  @observable
  Series? series;

  @observable
  SeriesDetail? detail;

  @observable
  Exception? seriesDetailError;

  @action
  void setSeries(Series series) {
    this.series = series;
    fetchSeriesDetail();
  }

  @action
  Future<void> fetchSeriesDetail() async {
    if (series != null) {
      var result = await _getSeriesDetailUseCase.find(series!.id);
      result.fold(
        (exception) => seriesDetailError = exception,
        (seriesDetail) => detail = seriesDetail,
      );
    }
    return Future.value();
  }
}
