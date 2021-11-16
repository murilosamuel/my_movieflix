import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';

abstract class FetchCatalogMovieUseCase {
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  });

  Future<Either<Exception, List<Movie>>> fetchRecentlyAdded({
    required int page,
  });

  Future<Either<Exception, List<Movie>>> fetchComingSoon({
    required int page,
  });
}