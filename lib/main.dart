import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movieflix/src/features/movie/data/datasource/api/movie.datasource.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/get_movie_detail_impl.usecase.dart';
import 'package:my_movieflix/src/features/series/data/datasource/api/series.datasource.dart';
import 'package:my_movieflix/src/features/movie/data/repositories/movie_impl.repository.dart';
import 'package:my_movieflix/src/features/series/data/repositories/series_impl.repository.dart';
import 'package:my_movieflix/src/features/movie/domain/repositories/movie.repository.dart';
import 'package:my_movieflix/src/features/series/domain/repositories/series.repository.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/fetch_catalog_movies.usecase.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/fetch_catalog_movies_impl.usecases.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/fetch_catalog_series.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/fetch_catalog_series_impl.usecase.dart';
import 'package:my_movieflix/src/features/movie/domain/usecases/get_movie_detail.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/get_series_detail.usecase.dart';
import 'package:my_movieflix/src/features/series/domain/usecases/get_series_detial.usecase.dart';
import 'package:my_movieflix/src/features/home/presentation/controller/home.controller.dart';
import 'package:my_movieflix/src/features/movie/presentation/controller/movie_detail.controller.dart';
import 'package:my_movieflix/src/features/media/presentation/controller/search.controller.dart';
import 'package:my_movieflix/src/features/series/presentation/controller/series_detail.controller.dart';
import 'package:my_movieflix/src/features/home/presentation/ui/pages/home_control.page.dart';
import 'package:my_movieflix/src/features/movie/data/datasource/api/movie_impl.datasource.dart';
import 'package:my_movieflix/src/features/series/data/datasource/api/series_impl.datasource.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

Future<void> setupLocators() async {
  GetIt getIt = GetIt.instance;
  GetIt.I.registerFactory<MovieDataSource>(
    () => MovieDataSourceImpl(),
  );
  GetIt.I.registerFactory<SeriesDataSource>(
    () => SeriesDataSourceImpl(),
  );
  GetIt.I.registerFactory<MovieRepository>(
    () => MovieRepositoryImpl(getIt()),
  );
  GetIt.I.registerFactory<SeriesRepository>(
    () => SeriesRepositoryImpl(getIt()),
  );
  GetIt.I.registerFactory<FetchCatalogMovieUseCase>(
    () => FetchCatalogMovieUseCaseImpl(getIt()),
  );
  GetIt.I.registerFactory<FetchCatalogSeriesUseCase>(
    () => FetchCatalogSerieUseCaseImpl(getIt()),
  );
  GetIt.I.registerFactory<GetMovieDetailUseCase>(
    () => GetMovieDetailUseCaseImpl(getIt()),
  );
  GetIt.I.registerFactory<GetSeriesDetailUseCase>(
    () => GetSeriesDetailUseCaseImpl(getIt()),
  );
  GetIt.I.registerFactory<HomeController>(
    () => HomeController(getIt(), getIt()),
  );
  GetIt.I.registerFactory<MovieDetailController>(
    () => MovieDetailController(getIt()),
  );
  GetIt.I.registerFactory<SeriesDetailController>(
    () => SeriesDetailController(getIt()),
  );
  GetIt.I.registerFactory<SearchController>(
    () => SearchController(getIt(), getIt()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor white = MaterialColor(0xFFFAFAFA, {
    50: Color.fromRGBO(250, 250, 250, .1),
    100: Color.fromRGBO(250, 250, 250, .2),
    200: Color.fromRGBO(250, 250, 250, .3),
    300: Color.fromRGBO(250, 250, 250, .4),
    400: Color.fromRGBO(250, 250, 250, .5),
    500: Color.fromRGBO(250, 250, 250, .6),
    600: Color.fromRGBO(250, 250, 250, .7),
    700: Color.fromRGBO(250, 250, 250, .8),
    800: Color.fromRGBO(250, 250, 250, .9),
    900: Color.fromRGBO(250, 250, 250, 1),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.white,
          decorationColor: Colors.white,
        ),
        primaryColor: white,
        primarySwatch: white,
      ),
      home: const HomeControl(),
    );
  }
}
