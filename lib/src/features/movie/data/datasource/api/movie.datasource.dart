import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/movie/data/dto/movie.dto.dart';
import 'package:my_movieflix/src/features/movie/data/dto/movie_detail.dto.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';

abstract class MovieDataSource {
  Future<Either<Exception, List<Media>>> filter({
    required String title,
    required int page,
  });

  Future<Either<Exception, List<MovieDto>>> recentlyAdded({
    required int page,
  });

  Future<Either<Exception, List<MovieDto>>> comingSoon({
    required int page,
  });

  Future<Either<Exception, MovieDetailDto>> find(int id);
}
