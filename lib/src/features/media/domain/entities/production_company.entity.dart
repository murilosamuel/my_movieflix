class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    required this.originCountry,
    this.logoPath,
  });
}
