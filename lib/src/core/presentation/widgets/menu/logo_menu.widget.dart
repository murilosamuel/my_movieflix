import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movieflix/src/core/presentation/util/colors_util.dart';

class LogoMenu extends StatelessWidget {
  final String asset;
  final double horizontalPadding;
  final double verticalPadding;

  const LogoMenu({
    Key? key,
    required this.asset,
    this.horizontalPadding = 13,
    this.verticalPadding = 10
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 128,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: ColorsUtil.purple, width: 2),
      ),
      child: SvgPicture.asset(asset),
    );
  }
}
