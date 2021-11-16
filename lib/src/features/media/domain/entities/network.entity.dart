class Network {
  final String name;
  final int id;
  final String? logoPath;
  final String originCountry;

  Network({
    this.logoPath,
    required this.name,
    required this.id,
    required this.originCountry,
  });
}
