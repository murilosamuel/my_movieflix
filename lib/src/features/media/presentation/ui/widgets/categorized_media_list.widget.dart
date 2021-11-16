import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_movieflix/src/features/media/domain/entities/media.entity.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_poster_item.widget.dart';
import 'package:my_movieflix/src/features/movie/domain/entities/movie.entity.dart';
import 'package:my_movieflix/src/features/movie/presentation/ui/pages/movie.page.dart';
import 'package:my_movieflix/src/features/series/presentation/ui/pages/series.page.dart';
import 'package:my_movieflix/src/features/series/domain/entities/series.entity.dart';

class CategorizedMediaList extends StatefulWidget {
  final Color? backgroundColor;
  final String title;
  final PagingController<int, Media> pagingController;
  final EdgeInsetsGeometry? padding;
  final Axis orientation;

  const CategorizedMediaList({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    required this.pagingController,
    required this.title,
    this.orientation = Axis.vertical,
  }) : super(key: key);

  @override
  _CategorizedMediaListState createState() => _CategorizedMediaListState();
}

class _CategorizedMediaListState extends State<CategorizedMediaList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: widget.padding,
      child: Column(
        children: [
          _sectionTitle,
          SizedBox(
            height: widget.orientation == Axis.vertical ? 250 : 175,
            child: PagedListView<int, Media>(
              scrollDirection: Axis.horizontal,
              pagingController: widget.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Media>(
                itemBuilder: (context, item, index) {
                  var firstItem = index == 0;
                  if (item is Movie) {
                    return _buildMovie(item, firstItem);
                  } else {
                    return _buildSeries(item as Series, firstItem);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovie(Movie movie, bool firstItem){
    return Padding(
      padding: firstItem
          ? const EdgeInsets.only(left: 14)
          : EdgeInsets.zero,
      child: MediaPosterItem(
        posterPath: movie.posterPath,
        title: movie.title,
        orientation: widget.orientation,
        backDrop: movie.backdropPath,
        date: movie.releaseDate,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MoviePage(movie: movie),
          ));
        },
        description: movie.overview,
        rate: movie.voteAverage,
      ),
    );
  }

  Widget _buildSeries(Series series, bool firstItem){
    return Padding(
      padding: firstItem
          ? const EdgeInsets.only(left: 14)
          : EdgeInsets.zero,
      child: MediaPosterItem(
        posterPath: series.posterPath,
        title: series.name,
        date: series.firstAirDate,
        orientation: widget.orientation,
        backDrop: series.backdropPath,
        description: series.overview,
        rate: series.voteAverage,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SeriesPage(series: series),
            ),
          );
        },
      ),
    );
  }

  Widget get _sectionTitle {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 7),
          const Icon(
            Icons.chevron_right_outlined,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }
}
