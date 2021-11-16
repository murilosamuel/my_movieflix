import 'package:my_movieflix/src/features/media/domain/entities/produtction_country.entity.dart';

class ProductionCountryDto extends ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountryDto({
    required this.iso31661,
    required this.name,
  }) : super(
          abreviation: iso31661,
          name: name,
        );

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) {
    return ProductionCountryDto(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}
