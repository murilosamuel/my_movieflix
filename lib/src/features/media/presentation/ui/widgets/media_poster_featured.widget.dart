import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';

class MediaPosterFeatured extends StatelessWidget {
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final DateTime? releasedDate;
  final GestureTapCallback? onTap;

  const MediaPosterFeatured({
    Key? key,
    this.posterPath,
    required this.title,
    this.voteAverage,
    this.releasedDate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _buildImage(context),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Hero(
      tag: posterPath!,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: CachedNetworkImage(
          imageUrl: '$posterPath',
          fit: BoxFit.cover,
          cacheKey: posterPath,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: _fadeDecoration,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _mediaNameText,
            _yearText,
            const SizedBox(height: 10),
            _rate,
          ],
        ),
      ),
    );
  }

  Widget get _mediaNameText {
    return Text(
      title ?? 'unknown',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 28,
      ),
    );
  }

  Widget get _yearText {
    return Text(
      '${(releasedDate ?? DateTime.now()).year}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget get _rate {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: ColorsUtil.purple,
          size: 20,
        ),
        const SizedBox(width: 3),
        Text(
          '${voteAverage ?? '-'}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  BoxDecoration get _fadeDecoration{
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.transparent,
          Colors.black,
        ],
        stops: [0.0, 0.5, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
