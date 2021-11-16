import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/app_bar_detail_page.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/genre_chips.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_detail_options.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/person_avatar.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/production_company_avatar.widget.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/presentation/controller/movie_detail.controller.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  const MoviePage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = GetIt.I.get<MovieDetailController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _controller.setMovie(widget.movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomStructure(
        appBar: const AppBarDetailPage(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Observer(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _moviePoster,
                  _movieDetails,
                ],
              );
            },
          ),
        ),
        scrollController: _scrollController,
      ),
    );
  }

  Widget get _movieDetails {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _overview,
        const SizedBox(height: 24),
        _cast,
        const SizedBox(height: 24),
        _productionCompanies,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget get _overview {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_controller.detail?.overview ?? ''),
          const SizedBox(height: 12),
          GenreChips(
            genres: _controller.detail?.genres ?? [],
          ),
        ],
      ),
    );
  }

  Widget get _productionCompanies {
    var size = _controller.detail?.productionCompanies.length ?? 0;
    return size > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle('Production Companies'),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: size,
                  itemBuilder: (context, index) {
                    var company =
                        _controller.detail!.productionCompanies[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 24)
                          : EdgeInsets.zero,
                      child: ProductionCompanyAvatar(
                        company: company,
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Container();
  }

  Widget get _cast {
    var size = _controller.detail?.cast?.length ?? 0;
    return size > 0 ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Cast'),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            scrollDirection: Axis.horizontal,
            itemCount: size,
            itemBuilder: (context, index) {
              var cast = _controller.detail!.cast![index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 24)
                    : EdgeInsets.zero,
                child: PersonAvatar(
                  name: cast.name,
                  profilePath: cast.profilePath,
                  character: cast.character,
                ),
              );
            },
          ),
        ),
      ],
    ) : Container();
  }

  Widget get _moviePoster {
    var url =
        _controller.movie?.backdropPath ?? _controller.movie?.posterPath ?? '';
    return Stack(
      children: [
        Hero(
          tag: url,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              cacheKey: url,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: _backDropImageDecoration,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MediaDetailOptions(),
                const SizedBox(height: 4),
                _movieTitle,
                const SizedBox(height: 7),
                if (_released)
                  _releasedInfo
                else
                  _comingSoonText,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _movieTitle => Text(
    '${_controller.movie?.title}',
    style: const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 28,
    ),
  );

  Widget get _releasedInfo => Row(
    children: [
      Text(_controller.detail?.duration ?? ''),
      if (_controller.detail?.duration.isNotEmpty ??
          ''.isNotEmpty)
        const SizedBox(width: 10),
      Text('${_controller.detail?.releaseDate.year ?? ''}'),
      Expanded(child: Container()),
      const Icon(
        Icons.star,
        color: ColorsUtil.purple,
        size: 20,
      ),
      const SizedBox(width: 3),
      Text(
        '${_controller.movie?.voteAverage ?? '-'}',
        textAlign: TextAlign.center,
      ),
    ],
  );

  bool get _released {
    return DateTime.now().isAfter(widget.movie.releaseDate ?? DateTime.now());
  }

  String formatDate(DateTime date) => DateFormat("dd/MM/yyyy").format(date);

  Widget get _comingSoonText {
    return Text(
      'Available in ${formatDate(widget.movie.releaseDate ?? DateTime.now())}',
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Decoration get _backDropImageDecoration => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.transparent,
        Colors.black,
      ],
      stops: [0.1, 0.9],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
