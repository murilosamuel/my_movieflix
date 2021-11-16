import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movieflix/src/core/opacity.utils.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';
import 'package:my_movieflix/src/core/presentation/widgets/cast_action.widget.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/drawer_menu.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/categorized_media_list.widget.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_poster_featured.widget.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/home/presentation/controller/home.controller.dart';
import 'package:my_movieflix/src/features/movie/presentation/ui/pages/movie.page.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = GetIt.I.get<HomeController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _startPagingControllerListeners();
    super.initState();
  }

  void _startPagingControllerListeners() {
    _controller.recentlyAddedPagingController.addPageRequestListener((pageKey) {
      _controller.fetchRecentlyAdded(pageKey);
    });
    _controller.comingSoonPagingController.addPageRequestListener((pageKey) {
      _controller.fetchComingSoon(pageKey);
    });
    _controller.seriesPagingController.addPageRequestListener((pageKey) {
      _controller.fetchSeries(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: const DrawerMenuWidget(),
      body: CustomStructure(
        appBar: _appBar,
        body: _content,
        scrollController: _scrollController,
      ),
    );
  }

  Widget get _content {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _featuredPoster,
          _recentlyAddedList,
          _comingSoonList,
          _seriesList,
        ],
      ),
    );
  }

  Widget get _recentlyAddedList {
    return CategorizedMediaList(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      title: 'Recently Added',
      pagingController: _controller.recentlyAddedPagingController,
      backgroundColor: Colors.black.withOpacity(0.57),
    );
  }

  Widget get _comingSoonList {
    return CategorizedMediaList(
      padding: const EdgeInsets.symmetric(vertical: 6),
      title: 'Coming Soon',
      orientation: Axis.horizontal,
      pagingController: _controller.comingSoonPagingController,
      backgroundColor: Colors.black.withOpacity(0.33),
    );
  }

  Widget get _seriesList {
    return CategorizedMediaList(
      padding: const EdgeInsets.symmetric(vertical: 6),
      title: 'Series',
      pagingController: _controller.seriesPagingController,
      backgroundColor: Colors.black.withOpacity(0.33),
    );
  }

  Widget get _featuredPoster {
    return Observer(builder: (_) {
      if (_controller.featuredMovie != null) {
        Movie? featured = _controller.featuredMovie;
        return MediaPosterFeatured(
          title: featured?.title,
          posterPath: featured?.backdropPath ?? featured?.posterPath,
          releasedDate: featured?.releaseDate,
          voteAverage: featured?.voteAverage,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MoviePage(movie: featured!),
            ));
          },
        );
      } else {
        return Container(height: 50);
      }
    });
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        child: Image.asset('assets/images/hbomax.png'),
        width: 130,
      ),
      actions: const [
        CastActionWidget(),
      ],
    );
  }
}
