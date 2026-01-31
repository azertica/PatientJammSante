import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/doctor.model.dart';

class DoctorService {
  Future<List<Doctor>> loadDoctors() async {
    final jsonString = await rootBundle.loadString(
      'lib/Core/doctor_list_export.json',
    );

    final List data = jsonDecode(jsonString);
    return data.map((e) => Doctor.fromJson(e)).toList();
  }
}
