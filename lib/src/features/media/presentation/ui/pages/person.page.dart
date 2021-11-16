import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movieflix/src/core/presentation/widgets/menu/app_bar_detail_page.widget.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';

class PersonPage extends StatefulWidget {
  final String? profilePath;
  final String name;
  final String? character;

  const PersonPage({
    Key? key,
    required this.profilePath,
    required this.name,
    this.character,
  }) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomStructure(
        appBar: const AppBarDetailPage(),
        body: _poster,
        scrollController: ScrollController(),
      ),
    );
  }

  Widget get _poster {
    return Hero(
      tag: widget.name,
      child: Stack(
        children: [
          _personImage,
          _personInfo,
        ],
      ),
    );
  }

  Widget get _personInfo => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.89,
        decoration: _imageBottomDecoration,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _personName,
                if (widget.character != null) _personCharacter,
              ],
            ),
          ),
        ),
      );

  Widget get _personName => Text(
        widget.name,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 28,
        ),
      );

  Widget get _personCharacter => Text('Interpreted ${widget.character}');

  Widget get _personImage => Container(
        color: Colors.black38,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.85,
        child: CachedNetworkImage(
          imageUrl: widget.profilePath ?? '',
          fit: BoxFit.fitHeight,
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            size: MediaQuery.of(context).size.height * 0.3,
            color: Colors.grey.shade300,
          ),
        ),
      );

  BoxDecoration get _imageBottomDecoration => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
          ],
          stops: [0.5, 0.95],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
}
