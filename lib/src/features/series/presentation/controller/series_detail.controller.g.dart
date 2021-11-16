// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../series/presentation/controller/series_detail.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SeriesDetailController on _SeriesDetailController, Store {
  final _$seriesAtom = Atom(name: '_SeriesDetailController.series');

  @override
  Series? get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(Series? value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$detailAtom = Atom(name: '_SeriesDetailController.detail');

  @override
  SeriesDetail? get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(SeriesDetail? value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  final _$seriesDetailErrorAtom =
      Atom(name: '_SeriesDetailController.seriesDetailError');

  @override
  Exception? get seriesDetailError {
    _$seriesDetailErrorAtom.reportRead();
    return super.seriesDetailError;
  }

  @override
  set seriesDetailError(Exception? value) {
    _$seriesDetailErrorAtom.reportWrite(value, super.seriesDetailError, () {
      super.seriesDetailError = value;
    });
  }

  final _$fetchSeriesDetailAsyncAction =
      AsyncAction('_SeriesDetailController.fetchSeriesDetail');

  @override
  Future<void> fetchSeriesDetail() {
    return _$fetchSeriesDetailAsyncAction.run(() => super.fetchSeriesDetail());
  }

  final _$_SeriesDetailControllerActionController =
      ActionController(name: '_SeriesDetailController');

  @override
  void setSeries(Series series) {
    final _$actionInfo = _$_SeriesDetailControllerActionController.startAction(
        name: '_SeriesDetailController.setSeries');
    try {
      return super.setSeries(series);
    } finally {
      _$_SeriesDetailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
series: ${series},
detail: ${detail},
seriesDetailError: ${seriesDetailError}
    ''';
  }
}
