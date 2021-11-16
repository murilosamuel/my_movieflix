import 'package:flutter/material.dart';

class CastActionWidget extends StatelessWidget {
  const CastActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
        icon: const Icon(
          Icons.cast,
          color: Colors.white,
          size: 22,
        ),
        onPressed: () {},
      ),
    );
  }
}
