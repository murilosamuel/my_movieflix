import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/fetch_catalog_movies.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

part 'search.controller.g.dart';

class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  final FetchCatalogMovieUseCase _fetchCatalogMovieUseCase;
  final FetchCatalogMovieUseCase _fetchCatalogMediaUseCase;
  final int _pageSize = 20;
  static const int _initialPage = 1;

  _SearchController(
    this._fetchCatalogMovieUseCase,
    this._fetchCatalogMediaUseCase,
  ) {
    initPagingController();
  }

  PagingController<int, Media> searchPagingController =
      PagingController(firstPageKey: _initialPage);

  @observable
  String filter = '';

  @observable
  ObservableList<Media> movies = ObservableList.of([]);

  @action
  void setFilter(String value) {
    filter = value;
    searchPagingController.refresh();
  }

  @action
  Future fetchRecentlyAdded(int page) async {
    var result = await _fetchCatalogMovieUseCase.fetchRecentlyAdded(
      page: page,
    );
    result.fold(
      (exception) => searchPagingController.error = exception,
      (content) {
        if (page == 1) {
          movies = ObservableList.of(content);
        } else {
          movies.addAll(content);
        }
        final isLastPage = content.length < _pageSize;
        if (isLastPage) {
          searchPagingController.appendLastPage(content);
        } else {
          searchPagingController.appendPage(content, page + 1);
        }
      },
    );
  }

  @action
  Future search(int page) async {
    var result = await _fetchCatalogMediaUseCase.filter(
      title: filter,
      page: page,
    );
    result.fold(
      (exception) => searchPagingController.error = exception,
      (content) {
        var medias = content
            .where((element) => element is Movie || element is Series)
            .toList();
        if (page == 1) {
          movies = ObservableList.of(medias);
        } else {
          movies.addAll(medias);
        }
        final isLastPage = content.length < _pageSize;
        if (isLastPage) {
          searchPagingController.appendLastPage(medias);
        } else {
          searchPagingController.appendPage(medias, page + 1);
        }
      },
    );
  }

  void initPagingController() {
    searchPagingController.removePageRequestListener(listener);
    searchPagingController.addPageRequestListener(listener);
  }

  listener(pageKey) {
    Future.sync(() => filter.isNotEmpty ? search(pageKey) : fetchRecentlyAdded(pageKey));
  }
}
