import 'package:dartz/dartz.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie_detail.entity.dart';
import 'package:my_movieflix/src/features/movie/domain/repositories/movie.repository.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/get_movie_detail.usecase.dart';

class GetMovieDetailUseCaseImpl implements GetMovieDetailUseCase {
  final MovieRepository _movieRepository;

  GetMovieDetailUseCaseImpl(this._movieRepository);

  @override
  Future<Either<Exception, MovieDetail>> find(int id) {
    return _movieRepository.find(id);
  }
}
