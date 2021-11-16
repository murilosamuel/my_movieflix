import 'dart:math';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/fetch_catalog_movies.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/fetch_catalog_series.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

part 'home.controller.g.dart';

class HomeController = _ContentListController
    with _$ContentListController;

abstract class _ContentListController with Store {
  final FetchCatalogMovieUseCase _fetchCatalogMovieUseCase;
  final FetchCatalogSeriesUseCase _fetchCatalogSeriesUseCase;
  final int _pageSize = 20;

  _ContentListController(
    this._fetchCatalogMovieUseCase,
    this._fetchCatalogSeriesUseCase,
  );

  @observable
  ObservableList<Movie> recentlyAdded = ObservableList.of([]);

  @observable
  ObservableList<Movie> comingSoon = ObservableList.of([]);

  @observable
  ObservableList<Series> series = ObservableList.of([]);

  @observable
  Movie? featuredMovie;

  final PagingController<int, Movie> recentlyAddedPagingController =
      PagingController(firstPageKey: 1);

  final PagingController<int, Movie> comingSoonPagingController =
      PagingController(firstPageKey: 1);

  final PagingController<int, Series> seriesPagingController =
      PagingController(firstPageKey: 1);

  @action
  Future fetchRecentlyAdded(int page) async {
    var result = await _fetchCatalogMovieUseCase.fetchRecentlyAdded(
      page: page,
    );
    result.fold(
      (exception) => recentlyAddedPagingController.error = exception,
      (content) {
        recentlyAdded = ObservableList.of(content);
        if (page == 1) featuredMovie = content[Random().nextInt(19)];
        final isLastPage = content.length < _pageSize;
        if (isLastPage) {
          recentlyAddedPagingController.appendLastPage(content);
        } else {
          recentlyAddedPagingController.appendPage(content, page + 1);
        }
      },
    );
  }

  @action
  Future fetchComingSoon(int page) async {
    var result = await _fetchCatalogMovieUseCase.fetchComingSoon(
      page: page,
    );
    result.fold(
      (exception) => comingSoonPagingController.error = exception,
      (content) {
        comingSoon = ObservableList.of(content);
        final isLastPage = content.length < _pageSize;
        if (isLastPage) {
          comingSoonPagingController.appendLastPage(content);
        } else {
          comingSoonPagingController.appendPage(content, page + 1);
        }
      },
    );
  }

  @action
  Future fetchSeries(int page) async {
    var result = await _fetchCatalogSeriesUseCase.bestsOfTheYear(
      page: page,
    );
    result.fold(
      (exception) => seriesPagingController.error = exception,
      (content) {
        series = ObservableList.of(content);
        final isLastPage = content.length < _pageSize;
        if (isLastPage) {
          seriesPagingController.appendLastPage(content);
        } else {
          seriesPagingController.appendPage(content, page + 1);
        }
      },
    );
  }
}
