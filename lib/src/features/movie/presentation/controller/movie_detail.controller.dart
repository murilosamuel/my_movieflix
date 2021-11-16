import 'package:mobx/mobx.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/get_movie_detail.usecase.dart';

part 'movie_detail.controller.g.dart';

class MovieDetailController = _MovieDetailController
    with _$MovieDetailController;

abstract class _MovieDetailController with Store {
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  _MovieDetailController(this._getMovieDetailUseCase);

  @observable
  Movie? movie;

  @observable
  MovieDetail? detail;

  @observable
  Exception? movieDetailError;

  @action
  void setMovie(Movie movie) {
    this.movie = movie;
    fetchMovieDetail();
  }

  @action
  Future<void> fetchMovieDetail() async {
    if (movie != null) {
      var result = await _getMovieDetailUseCase.find(movie!.id);
      result.fold(
        (exception) => movieDetailError = exception,
        (movieDetail) => detail = movieDetail,
      );
    }
    return Future.value();
  }
}
