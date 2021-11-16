import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_movieflix/src/core/presentation/widgets/cast_action.widget.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_poster_item.widget.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/media/presentation/controller/search.controller.dart';
import 'package:my_movieflix/src/features/movie/presentation/ui/pages/movie.page.dart';
import 'package:my_movieflix/src/features/series/presentation/ui/pages/series.page.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = GetIt.I.get<SearchController>();
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomStructure(
        appBar: _appBar,
        body: _content,
        scrollController: _scrollController,
        pinned: false,
      ),
    );
  }

  Widget get _content {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topMessage,
        Flexible(
          child: _gridContent,
        ),
      ],
    );
  }

  Widget get _topMessage => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          'HBO Max recommends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget get _gridContent {
    return Observer(builder: (_) {
      return PagedGridView<int, Media>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: _controller.searchPagingController,
        padding: const EdgeInsets.symmetric(vertical: 15),
        builderDelegate: PagedChildBuilderDelegate<Media>(
          itemBuilder: (context, item, index) {
            var media = _controller.movies[index];

            if (media is Movie) {
              return _buildMovie(media);
            } else if (media is Series) {
              return _buildSeries(media);
            } else {
              // Person not implemented
              return Container();
            }
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: (1.9 / 3),
        ),
      );
    });
  }

  Widget _buildMovie(Movie movie) {
    return Center(
      child: MediaPosterItem(
        posterPath: movie.posterPath,
        title: movie.title,
        backDrop: movie.backdropPath,
        description: movie.overview,
        rate: movie.voteAverage,
        date: movie.releaseDate,
        height: 250,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MoviePage(movie: movie),
          ),
        ),
      ),
    );
  }

  Widget _buildSeries(Series series) {
    return Center(
      child: MediaPosterItem(
        posterPath: series.posterPath,
        title: series.name,
        date: series.firstAirDate,
        height: 250,
        backDrop: series.backdropPath,
        description: series.overview,
        rate: series.voteAverage,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SeriesPage(series: series),
          ),
        ),
      ),
    );
  }

  Widget get _inputSearch {
    return Observer(builder: (_) {
      return Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: _searchController,
          onChanged: (value) => _controller.setFilter(value),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            isDense: true,
            fillColor: const Color(0xff171321),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search',
            suffixIcon: _controller.filter.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      _searchController.text = '';
                      _controller.setFilter('');
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white70,
                    ),
                  )
                : null,
            hintStyle: const TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      title: _inputSearch,
      titleSpacing: 0,
      actions: const [
        CastActionWidget(),
      ],
    );
  }
}
