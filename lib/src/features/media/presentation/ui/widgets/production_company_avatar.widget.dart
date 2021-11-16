import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movieflix/src/features/media/domain/entities/production_company.entity.dart';

class ProductionCompanyAvatar extends StatelessWidget {
  final ProductionCompany company;

  const ProductionCompanyAvatar({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: '${company.logoPath}',
        cacheKey: company.logoPath,
        fit: BoxFit.scaleDown,
        errorWidget: (context, url, error) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _movieIcon,
            _companyName,
          ],
        ),
      ),
    );
  }

  double get _size => 100;

  Widget get _movieIcon => const Icon(
        Icons.movie,
        size: 30,
        color: Colors.deepPurple,
      );

  Widget get _companyName => Text(
        company.name,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.deepPurple,
        ),
      );
}
