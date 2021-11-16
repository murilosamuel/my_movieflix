import 'package:flutter/material.dart';

class MediaDetailIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const MediaDetailIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
