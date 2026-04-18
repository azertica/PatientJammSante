import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../Models/doctor.model.dart';

class DoctorService {
  Future<List<Doctor>> loadDoctors() async {
    try{
      Sentry.addBreadcrumb(
        Breadcrumb(
          level: SentryLevel.info,
          message: "Start Loading doctor list",

        )
      );

      final jsonString = await rootBundle.loadString(
        'lib/Core/doctor_list_export.json',
      );

      final List data = jsonDecode(jsonString);
      return data.map((e) => Doctor.fromJson(e)).toList();
    } catch(e, stackTrace){
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'doctor_list');
          scope.setContexts('doctor_json', {
            'asset': 'doctor_list_export.json',
          });
        }
      );
      rethrow;
    }
  }
}
