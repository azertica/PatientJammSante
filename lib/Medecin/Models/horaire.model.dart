class Horaires {
  final String lundi;
  final String mardi;
  final String mercredi;
  final String jeudi;
  final String vendredi;
  final String samedi;
  final String dimanche;

  Horaires({
    required this.lundi,
    required this.mardi,
    required this.mercredi,
    required this.jeudi,
    required this.vendredi,
    required this.samedi,
    required this.dimanche,
  });

  factory Horaires.fromJson(Map<String, dynamic> json) {
    return Horaires(
      lundi: json['Lundi'],
      mardi: json['Mardi'],
      mercredi: json['Mercredi'],
      jeudi: json['Jeudi'],
      vendredi: json['Vendredi'],
      samedi: json['Samedi'],
      dimanche: json['Dimanche'],
    );
  }
}
