import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/logo_menu.widget.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/menu_item.widget.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF0C0C0C),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.clear,
                    color: ColorsUtil.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const MenuItem(label: 'Series'),
            const MenuItem(label: 'Movies'),
            const MenuItem(label: 'Recently Added'),
            const MenuItem(label: 'Coming Soon'),
            _divider,
            const MenuItem(label: 'Action'),
            const MenuItem(label: 'Adventure'),
            const MenuItem(label: 'Comedy'),
            const MenuItem(label: 'Crime'),
            const MenuItem(label: 'Documentary'),
            const MenuItem(label: 'Drama'),
            const MenuItem(label: 'Family'),
            const MenuItem(label: 'Fantasy'),
            const MenuItem(label: 'Romance'),
            const MenuItem(label: 'Thriller'),
            const MenuItem(label: 'War'),
            _divider,
            const SizedBox(height: 15),
            _rowLogosHboMaxOriginals,
            const SizedBox(height: 15),
            _rowLogosWarnerDc,
            const SizedBox(height: 15),
            _rowLogoCartoon,
            const SizedBox(height: 260),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoMenuRow({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget get _rowLogosHboMaxOriginals {
    return _buildLogoMenuRow(
      children: const [
        LogoMenu(
          asset: 'assets/svg/hbo_logo.svg',
          horizontalPadding: 15,
        ),
        LogoMenu(
          asset: 'assets/svg/max_originals_logo.svg',
          horizontalPadding: 15,
        ),
      ],
    );
  }

  Widget get _rowLogosWarnerDc {
    return _buildLogoMenuRow(
      children: const [
        LogoMenu(
          asset: 'assets/svg/warner_logo.svg',
          verticalPadding: 5,
        ),
        LogoMenu(
          asset: 'assets/svg/dc_logo.svg',
          verticalPadding: 5,
        ),
      ],
    );
  }

  Widget get _rowLogoCartoon {
    return _buildLogoMenuRow(
      children: const [
        LogoMenu(
          asset: 'assets/svg/cartoon_logo.svg',
          verticalPadding: 8,
        ),
      ],
    );
  }

  Widget get _divider {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        color: Colors.white30,
      ),
    );
  }
}
