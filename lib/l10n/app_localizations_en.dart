// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get takeAppointment => 'Book appointment';

  @override
  String get doctorDetails => 'Doctor details';

  @override
  String get noFullName => 'No Full Name';

  @override
  String get findDoctor => 'Find a doctor';

  @override
  String get specialities => 'Specialities';

  @override
  String get seeAll => 'See all';

  @override
  String get recommendedDoctors => 'Recommended doctors';

  @override
  String get searchHint => 'Search for a doctor, speciality...';

  @override
  String get noSpeciality => 'No Speciality';

  @override
  String get noAddress => 'No Address';

  @override
  String get homePage => 'Home';

  @override
  String get doctors => 'Doctors';

  @override
  String get agenda => 'Agenda';

  @override
  String get settings => 'Settings';

  @override
  String get doctorLoadingError => 'An error occurred while loading doctors. Please try again later.';
}