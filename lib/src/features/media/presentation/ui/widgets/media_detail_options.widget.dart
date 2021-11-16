import 'package:flutter/material.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/widgets/media_detail_icon.widget.dart';

class MediaDetailOptions extends StatelessWidget {
  const MediaDetailOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        MediaDetailIcon(
          icon: Icons.star,
          text: 'Rate',
        ),
        SizedBox(width: 20),
        MediaDetailIcon(
          icon: Icons.add,
          text: 'My List',
        ),
        SizedBox(width: 20),
        MediaDetailIcon(
          icon: Icons.download,
          text: 'Download',
        ),
      ],
    );
  }
}
