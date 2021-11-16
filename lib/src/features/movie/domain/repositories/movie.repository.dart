import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';

abstract class MovieRepository {
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  });

  Future<Either<Exception, List<Movie>>> recentlyAdded({
    required int page,
  });

  Future<Either<Exception, List<Movie>>> fetchComingSoon({
    required int page,
  });

  Future<Either<Exception, MovieDetail>> find(int id);
}
