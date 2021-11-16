import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_poster_item_bottom_sheet.widget.dart';

class MediaPosterItem extends StatelessWidget {
  final String? posterPath;
  final String? backDrop;
  final String title;
  final String description;
  final DateTime? date;
  final double rate;
  final GestureTapCallback? onTap;
  final Axis orientation;
  final double? height;
  final double? width;


  const MediaPosterItem({
    Key? key,
    required this.posterPath,
    required this.backDrop,
    required this.title,
    required this.rate,
    required this.description,
    required this.date,
    this.onTap,
    this.orientation = Axis.vertical,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () => showBottomSheetLogin(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: posterPath ?? '',
              child: SizedBox(
                height: height ?? (orientation == Axis.vertical ? 200 : 120),
                width: orientation == Axis.vertical ? null : 220,
                child: _image,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: width ?? (orientation == Axis.vertical ? 130 : 220),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _image {
    var url = (orientation == Axis.vertical ? posterPath : backDrop) ?? '';
    return CachedNetworkImage(
      imageUrl: url,
      fit: orientation == Axis.vertical ? BoxFit.fitHeight : BoxFit.fitWidth,
      placeholder: (context, url) => hboDefaultPoster,
      errorWidget: (context, url, error) => hboDefaultPoster,
      cacheKey: url,
    );
  }

  Widget get hboDefaultPoster {
    if (orientation == Axis.vertical) {
      return Image.asset('assets/images/hbo_poster.jpeg');
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SvgPicture.asset('assets/svg/hbo_logo.svg'),
      );
    }
  }

  void showBottomSheetLogin(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            MediaPosterItemBottomSheet(
              title: title,
              posterPath: posterPath ?? backDrop,
              description: description,
              rate: rate,
              date: date,
              onTap: onTap,
            ),
          ],
        );
      },
    );
  }
}
