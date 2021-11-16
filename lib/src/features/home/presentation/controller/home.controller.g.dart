// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContentListController on _ContentListController, Store {
  final _$recentlyAddedAtom =
      Atom(name: '_ContentListController.recentlyAdded');

  @override
  ObservableList<Movie> get recentlyAdded {
    _$recentlyAddedAtom.reportRead();
    return super.recentlyAdded;
  }

  @override
  set recentlyAdded(ObservableList<Movie> value) {
    _$recentlyAddedAtom.reportWrite(value, super.recentlyAdded, () {
      super.recentlyAdded = value;
    });
  }

  final _$comingSoonAtom = Atom(name: '_ContentListController.comingSoon');

  @override
  ObservableList<Movie> get comingSoon {
    _$comingSoonAtom.reportRead();
    return super.comingSoon;
  }

  @override
  set comingSoon(ObservableList<Movie> value) {
    _$comingSoonAtom.reportWrite(value, super.comingSoon, () {
      super.comingSoon = value;
    });
  }

  final _$seriesAtom = Atom(name: '_ContentListController.series');

  @override
  ObservableList<Series> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(ObservableList<Series> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$featuredMovieAtom =
      Atom(name: '_ContentListController.featuredMovie');

  @override
  Movie? get featuredMovie {
    _$featuredMovieAtom.reportRead();
    return super.featuredMovie;
  }

  @override
  set featuredMovie(Movie? value) {
    _$featuredMovieAtom.reportWrite(value, super.featuredMovie, () {
      super.featuredMovie = value;
    });
  }

  final _$fetchRecentlyAddedAsyncAction =
      AsyncAction('_ContentListController.fetchRecentlyAdded');

  @override
  Future<dynamic> fetchRecentlyAdded(int page) {
    return _$fetchRecentlyAddedAsyncAction
        .run(() => super.fetchRecentlyAdded(page));
  }

  final _$fetchComingSoonAsyncAction =
      AsyncAction('_ContentListController.fetchComingSoon');

  @override
  Future<dynamic> fetchComingSoon(int page) {
    return _$fetchComingSoonAsyncAction.run(() => super.fetchComingSoon(page));
  }

  final _$fetchSeriesAsyncAction =
      AsyncAction('_ContentListController.fetchSeries');

  @override
  Future<dynamic> fetchSeries(int page) {
    return _$fetchSeriesAsyncAction.run(() => super.fetchSeries(page));
  }

  @override
  String toString() {
    return '''
recentlyAdded: ${recentlyAdded},
comingSoon: ${comingSoon},
series: ${series},
featuredMovie: ${featuredMovie}
    ''';
  }
}
