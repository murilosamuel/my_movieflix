import 'package:flutter/material.dart';
import 'package:my_movieflix/src/features/media/domain/entities/genre.entity.dart';

class GenreChips extends StatelessWidget {
  final List<Genre> genres;

  const GenreChips({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 5,
      children: [
        for (Genre genre in genres)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(100),
                right: Radius.circular(100),
              ),
              border: Border.all(color: Colors.deepPurple),
            ),
            child: Text(genre.name),
          ),
      ],
    );
  }
}
