import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_detail_icon.widget.dart';

class MediaPosterItemBottomSheet extends StatefulWidget {
  final String? posterPath;
  final String title;
  final String description;
  final DateTime? date;
  final double rate;
  final GestureTapCallback? onTap;

  const MediaPosterItemBottomSheet({
    Key? key,
    required this.posterPath,
    required this.title,
    required this.rate,
    required this.date,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  _MediaPosterItemBottomSheetState createState() =>
      _MediaPosterItemBottomSheetState();
}

class _MediaPosterItemBottomSheetState
    extends State<MediaPosterItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: ColorsUtil.black,
      ),
      child: Stack(
        children: [
          _bottomSheetContent,
          _closeButton,
        ],
      ),
    );
  }

  Widget get _bottomSheetContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 110,
                      child: _image,
                    ),
                    const SizedBox(width: 24),
                    _mediaContent,
                  ],
                ),
              ),
              _mediaOptions,
              const Divider(color: Colors.white70),
              _moreInfoBottom
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget get _mediaContent {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 22),
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 6),
          if (_mediaReleased) _rate else _comingSoonText,
          const SizedBox(height: 6),
          Text(
            widget.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ],
      ),
    );
  }

  Widget get _mediaOptions {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        MediaDetailIcon(
          icon: Icons.play_arrow,
          text: 'Watch',
        ),
        MediaDetailIcon(
          icon: Icons.download,
          text: 'Download',
        ),
        MediaDetailIcon(
          icon: Icons.play_circle_outline,
          text: 'Trailer',
        ),
      ],
    );
  }

  Widget get _moreInfoBottom {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 10),
            Text('More info'),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _rate {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: ColorsUtil.purple,
          size: 20,
        ),
        const SizedBox(width: 3),
        Text(
          '${widget.rate}',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  bool get _mediaReleased {
    return DateTime.now().isAfter(widget.date ?? DateTime.now());
  }

  String formatDate(DateTime date) => DateFormat("dd/MM/yyyy").format(date);

  Widget get _comingSoonText {
    return Text(
      'Available in ${formatDate(widget.date ?? DateTime.now())}',
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get _image {
    return CachedNetworkImage(
      imageUrl: widget.posterPath ?? '',
      fit: BoxFit.fitHeight,
      cacheKey: widget.posterPath,
    );
  }

  Widget get _closeButton {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.clear,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
