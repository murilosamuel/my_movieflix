import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarDetailPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      title: SvgPicture.asset(
        'assets/svg/hbo_max.svg',
        height: 25,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
