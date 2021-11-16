// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../movie/presentation/controller/movie_detail.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailController on _MovieDetailController, Store {
  final _$movieAtom = Atom(name: '_MovieDetailController.movie');

  @override
  Movie? get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie? value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$detailAtom = Atom(name: '_MovieDetailController.detail');

  @override
  MovieDetail? get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(MovieDetail? value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  final _$movieDetailErrorAtom =
      Atom(name: '_MovieDetailController.movieDetailError');

  @override
  Exception? get movieDetailError {
    _$movieDetailErrorAtom.reportRead();
    return super.movieDetailError;
  }

  @override
  set movieDetailError(Exception? value) {
    _$movieDetailErrorAtom.reportWrite(value, super.movieDetailError, () {
      super.movieDetailError = value;
    });
  }

  final _$fetchMovieDetailAsyncAction =
      AsyncAction('_MovieDetailController.fetchMovieDetail');

  @override
  Future<void> fetchMovieDetail() {
    return _$fetchMovieDetailAsyncAction.run(() => super.fetchMovieDetail());
  }

  final _$_MovieDetailControllerActionController =
      ActionController(name: '_MovieDetailController');

  @override
  void setMovie(Movie movie) {
    final _$actionInfo = _$_MovieDetailControllerActionController.startAction(
        name: '_MovieDetailController.setMovie');
    try {
      return super.setMovie(movie);
    } finally {
      _$_MovieDetailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie},
detail: ${detail},
movieDetailError: ${movieDetailError}
    ''';
  }
}
