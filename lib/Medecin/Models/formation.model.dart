class Formation {
  final String year;
  final String description;

  Formation({
    required this.year,
    required this.description,
  });

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      year: json['year'],
      description: json['description'],
    );
  }
}
