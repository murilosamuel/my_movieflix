import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/movie/data/datasource/api/movie.datasource.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/repositories/movie.repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  }) {
    return _movieDataSource.filter(
      title: title,
      page: page,
    );
  }

  @override
  Future<Either<Exception, MovieDetail>> find(int id) {
    return _movieDataSource.find(id);
  }

  @override
  Future<Either<Exception, List<Movie>>> recentlyAdded({required int page}) {
    return _movieDataSource.recentlyAdded(page: page);
  }

  @override
  Future<Either<Exception, List<Movie>>> fetchComingSoon({required int page}) {
    return _movieDataSource.comingSoon(page: page);
  }
}
