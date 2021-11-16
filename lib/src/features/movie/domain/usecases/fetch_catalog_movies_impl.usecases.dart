import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/repositories/movie.repository.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/fetch_catalog_movies.usecase.dart';

class FetchCatalogMovieUseCaseImpl implements FetchCatalogMovieUseCase {
  final MovieRepository _movieRepository;

  FetchCatalogMovieUseCaseImpl(this._movieRepository);

  @override
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  }) {
    return _movieRepository.filter(
      title: title,
      page: page,
    );
  }

  @override
  Future<Either<Exception, List<Movie>>> fetchRecentlyAdded({required int page}) {
    return _movieRepository.recentlyAdded(page: page);
  }

  @override
  Future<Either<Exception, List<Movie>>> fetchComingSoon({required int page}) {
    return _movieRepository.fetchComingSoon(page: page);
  }
}
