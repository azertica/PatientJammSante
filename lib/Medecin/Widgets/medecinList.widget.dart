import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Models/doctor.model.dart';
import 'package:patient_jamm_sante/Medecin/Providers/medecin.service.dart';

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
            return ListTile(
              title: Text("${doctor.fullName}"),
              subtitle: Text("${doctor.specialty}"),
            );
          },
        );
      },
    );
  }
}
