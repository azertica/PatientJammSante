import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Models/doctor.model.dart';
import 'package:patient_jamm_sante/Medecin/Providers/medecin.service.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/medecinCard.widget.dart';
import 'package:patient_jamm_sante/l10n/app_localizations.dart';

class MedecinListWidget extends StatefulWidget {
  const MedecinListWidget({super.key});

  @override
  State<MedecinListWidget> createState() => _MedecinListWidgetState();
}

class _MedecinListWidgetState extends State<MedecinListWidget> {
  final DoctorService _service = DoctorService();
  late Future<List<Doctor>> _futureDoctors;

  @override
  void initState() {
    super.initState();
    _futureDoctors = _service.loadDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FutureBuilder<List<Doctor>>(
      future: _futureDoctors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              l10n.doctorLoadingError,
              style: TextStyle(color: ThemeColor().primaryColor),
              textAlign: TextAlign.center,
            ),
          );
        }

        final doctors = snapshot.data!;

        return ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return MedecinCardWidget(
              color: ThemeColor().thirdBgColor,
              fullname: doctor.fullName ?? l10n.noFullName,
              specialty: doctor.specialty ?? l10n.noSpeciality,
              distance: doctor.distance?.toString() ?? '0',
              photoUrl: doctor.photoUrl ?? '',
              fullAddress: doctor.fullAddress ?? l10n.noAddress,
            );
          },
        );
      },
    );
  }
}