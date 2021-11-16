import 'package:my_movieflix/src/core/data/datasource/api.properties.dart';
import 'package:my_movieflix/src/features/media/domain/entities/production_company.entity.dart';

class ProductionCompanyDto extends ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompanyDto({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  }) : super(
          name: name,
          id: id,
          originCountry: originCountry,
          logoPath: logoPath,
        );

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyDto(
      id: json['id'],
      logoPath: json['logo_path'] != null
          ? '${ApiProperties.imageBaseUrl}${json['logo_path']}'
          : null,
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}
