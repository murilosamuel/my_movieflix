import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/app_bar_detail_page.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/genre_chips.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_detail_icon.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_detail_options.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_poster_item.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/person_avatar.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/production_company_avatar.widget.dart';
import 'package:my_movieflix/src/features/series/presentation/controller/series_detail.controller.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

class SeriesPage extends StatefulWidget {
  final Series series;

  const SeriesPage({
    Key? key,
    required this.series,
  }) : super(key: key);

  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final _controller = GetIt.I.get<SeriesDetailController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _controller.setSeries(widget.series);
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
                  _seriesPoster,
                  _seriesDetails,
                ],
              );
            },
          ),
        ),
        scrollController: _scrollController,
      ),
    );
  }

  Widget get _seriesDetails {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _overview,
        const SizedBox(height: 24),
        _seasons,
        const SizedBox(height: 24),
        _cast,
        const SizedBox(height: 24),
        _authors,
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
    var size = _controller.detail?.productionCompanies?.length ?? 0;
    return size > 0 ?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Production Companies'),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            scrollDirection: Axis.horizontal,
            itemCount: size,
            itemBuilder: (context, index) {
              var company = _controller.detail!.productionCompanies![index];
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
    ) : Container();
  }

  Widget get _authors {
    var size = _controller.detail?.createdBy.length ?? 0;
    return size > 0 ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Created by'),
        const SizedBox(height: 12),
        SizedBox(
          height: 135,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            scrollDirection: Axis.horizontal,
            itemCount: size,
            itemBuilder: (context, index) {
              var author = _controller.detail!.createdBy[index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 24)
                    : EdgeInsets.zero,
                child: PersonAvatar(
                  name: author.name,
                  profilePath: author.profilePath,
                ),
              );
            },
          ),
        ),
      ],
    ) : Container();
  }

  Widget get _cast {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Cast'),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            scrollDirection: Axis.horizontal,
            itemCount: _controller.detail?.cast?.length ?? 0,
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
    );
  }

  Widget get _seasons {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Seasons'),
        const SizedBox(height: 12),
        SizedBox(
          height: 235,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _controller.detail?.seasons.length ?? 0,
            itemBuilder: (context, index) {
              var season = _controller.detail!.seasons[index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 12)
                    : EdgeInsets.zero,
                child: MediaPosterItem(
                  title: season.name,
                  description: season.overview,
                  rate: 0,
                  date: season.airDate,
                  posterPath: season.posterPath,
                  backDrop: season.posterPath,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget get _seriesPoster {
    var url = _controller.series?.backdropPath ??
        _controller.series?.posterPath ??
        '';
    return Stack(
      children: [
        Stack(
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
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.1, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
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
                Text(
                  '${_controller.series?.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                        '${_controller.detail?.numberOfSeasons ?? ''} ${_controller.detail?.moreThanOneSeason ?? false ? 'Seasons' : 'Season'} '
                        '| ${_controller.detail?.numberOfEpisodes ?? ''} Episodes'),
                    const SizedBox(width: 20),
                    Text('${_controller.detail?.firstAirDate?.year ?? ''}'),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.star,
                      color: ColorsUtil.purple,
                      size: 20,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${_controller.series?.voteAverage ?? '-'}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
}
