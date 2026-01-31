import 'formation.model.dart';
import 'horaire.model.dart';
import 'tarif.model.dart';

class Doctor {
  final String elemId;
  final String name;
  final String fullName;
  final String specialty;
  final String category;
  final String address;
  final String fullAddress;
  final String distance;
  final String photoUrl;
  final String accessInfo;
  final String presentation;

  final double latitude;
  final double longitude;

  final List<String> phones;
  final List<String> languages;
  final List<String> expertises;
  final List<String> galleryImages;
  final List<String> paymentMethods;

  final List<Formation> formations;
  final List<Tarif> tarifs;
  final Horaires horaires;

  Doctor({
    required this.elemId,
    required this.name,
    required this.fullName,
    required this.specialty,
    required this.category,
    required this.address,
    required this.fullAddress,
    required this.distance,
    required this.photoUrl,
    required this.accessInfo,
    required this.presentation,
    required this.latitude,
    required this.longitude,
    required this.phones,
    required this.languages,
    required this.expertises,
    required this.galleryImages,
    required this.paymentMethods,
    required this.formations,
    required this.tarifs,
    required this.horaires,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      elemId: json['elem_id'],
      name: json['name'],
      fullName: json['full_name'],
      specialty: json['specialty'],
      category: json['category'],
      address: json['address'],
      fullAddress: json['full_address'],
      distance: json['distance'],
      photoUrl: json['photo_url'],
      accessInfo: json['access_info'],
      presentation: json['presentation'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),

      phones: List<String>.from(json['phones'] ?? []),
      languages: List<String>.from(json['languages'] ?? []),
      expertises: List<String>.from(json['expertises'] ?? []),
      galleryImages: List<String>.from(json['gallery_images'] ?? []),
      paymentMethods: List<String>.from(json['payment_methods'] ?? []),

      formations: (json['formations'] as List)
          .map((e) => Formation.fromJson(e))
          .toList(),

      tarifs: (json['tarifs'] as List)
          .map((e) => Tarif.fromJson(e))
          .toList(),

      horaires: Horaires.fromJson(json['horaires']),
    );
  }
}
