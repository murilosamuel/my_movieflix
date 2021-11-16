import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movieflix/src/features/media/presentation/ui/pages/person.page.dart';

class PersonAvatar extends StatelessWidget {
  final String? profilePath;
  final String name;
  final String? character;
  final double _size = 90;

  const PersonAvatar({
    Key? key,
    required this.profilePath,
    required this.name,
    this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAvatarTap(context),
      child: Container(
        constraints: BoxConstraints(maxWidth: _size),
        child: Column(
          children: [
            _personImage,
            const SizedBox(height: 6),
            _personName,
            if (character != null)
              _personCharter,
          ],
        ),
      ),
    );
  }

  Widget get _personName{
    return Text(
      name.toUpperCase(),
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget get _personCharter {
    return Text(
      '$character',
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w100,
          color: Colors.white60),
    );
  }

  Widget get _personImage {
    return Hero(
      tag: name,
      child: CachedNetworkImage(
        imageUrl: '$profilePath',
        cacheKey: profilePath,
        imageBuilder: (context, imageProvider) => Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (context, url, error) => unknownProfile,
        placeholder: (context, url) => unknownProfile,
      ),
    );
  }

  Widget get unknownProfile {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _size,
          height: _size,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  void onAvatarTap(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonPage(
          profilePath: profilePath,
          name: name,
          character: character,
        ),
      ),
    );
  }
}
