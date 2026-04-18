// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get takeAppointment => 'Prendre rendez-vous';

  @override
  String get doctorDetails => 'Détails du médecin';

  @override
  String get noFullName => 'Nom non disponible';

  @override
  String get findDoctor => 'Trouver un médecin';

  @override
  String get specialities => 'Spécialités';

  @override
  String get seeAll => 'Tout voir';

  @override
  String get recommendedDoctors => 'Médecins recommandés';

  @override
  String get searchHint => 'Rechercher un médecin, spécialité...';

  @override
  String get noSpeciality => 'Spécialité non disponible';

  @override
  String get noAddress => 'Adresse non disponible';

  @override
  String get homePage => 'Accueil';

  @override
  String get doctors => 'Médecins';

  @override
  String get agenda => 'Agenda';

  @override
  String get settings => 'Paramètres';

  @override
  String get doctorLoadingError => 'Une erreur est survenue lors du chargement des médecins. Veuillez réessayer plus tard.';
}