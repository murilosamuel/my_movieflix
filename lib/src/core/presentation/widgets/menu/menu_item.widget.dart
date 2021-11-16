import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;

  const MenuItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0.0,
      ),
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      title: Text(label),
    );
  }
}
