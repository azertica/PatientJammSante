import 'package:flutter/material.dart';
import '../Models/Speciality.model.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';


class SpecialityWidget extends StatelessWidget {
  final Speciality speciality;
  const SpecialityWidget({super.key, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ThemeColor().secondaryBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              speciality.icon,
              color: ThemeColor().primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            speciality.name,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}