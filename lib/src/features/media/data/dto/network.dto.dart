import 'package:my_movieflix/src/features/media/domain/entities/network.entity.dart';

class NetworkDto implements Network{
  final String name;
  final int id;
  final String? logoPath;
  final String originCountry;

  NetworkDto({
    this.logoPath,
    required this.name,
    required this.id,
    required this.originCountry,
  });

  factory NetworkDto.fromJson(Map<String, dynamic> json) {
    return NetworkDto(
      name: json['name'],
      id: json['id'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}
