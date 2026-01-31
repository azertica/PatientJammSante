class Tarif {
  final String name;
  final String price;

  Tarif({
    required this.name,
    required this.price,
  });

  factory Tarif.fromJson(Map<String, dynamic> json) {
    return Tarif(
      name: json['name'],
      price: json['price'],
    );
  }
}
