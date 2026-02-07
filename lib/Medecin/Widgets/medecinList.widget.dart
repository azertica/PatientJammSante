import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Models/doctor.model.dart';
import 'package:patient_jamm_sante/Medecin/Providers/medecin.service.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/medecinCard.widget.dart';

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
    return FutureBuilder<List<Doctor>>(
      future: _futureDoctors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}', style: TextStyle(color: ThemeColor().primaryColor)));
        }

        final doctors = snapshot.data!;

        return ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return medecinCardWidget(
              color: ThemeColor().thirdBgColor,
              fullname: doctor.fullName ?? 'No FullName',
              specialty: doctor.specialty ?? 'No Speciality',
              distance: doctor.distance?.toString() ?? '0',
              photoUrl: doctor.photoUrl ?? 'https://imgs.search.brave.com/rqDVlrVXh66oYREFOpP47AoZsTIu3V531RLEEA0dPlo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3RpL3ZlY3Rl/dXItbGlicmUvdDIv/NjgzODQ1OS1ub2ly/LWFic3RyYWl0LXRl/eHR1cmUtZ3J1bmdl/LXdlYi1mb25kLXZl/Y3RldXItdmVjdG9y/aWVsLmpwZw',
              fullAddress: doctor.fullAddress ?? 'No FullAddress',
            );
          },
        );
      },
    );
  }
}
