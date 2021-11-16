// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchController, Store {
  final _$filterAtom = Atom(name: '_SearchController.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$moviesAtom = Atom(name: '_SearchController.movies');

  @override
  ObservableList<Media> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Media> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$fetchRecentlyAddedAsyncAction =
      AsyncAction('_SearchController.fetchRecentlyAdded');

  @override
  Future<dynamic> fetchRecentlyAdded(int page) {
    return _$fetchRecentlyAddedAsyncAction
        .run(() => super.fetchRecentlyAdded(page));
  }

  final _$searchAsyncAction = AsyncAction('_SearchController.search');

  @override
  Future<dynamic> search(int page) {
    return _$searchAsyncAction.run(() => super.search(page));
  }

  final _$_SearchControllerActionController =
      ActionController(name: '_SearchController');

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_SearchControllerActionController.startAction(
        name: '_SearchController.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_SearchControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filter: ${filter},
movies: ${movies}
    ''';
  }
}
