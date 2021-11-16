import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';

abstract class GetMovieDetailUseCase {
  Future<Either<Exception, MovieDetail>> find(int id);
}
