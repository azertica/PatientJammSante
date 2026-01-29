import 'package:flutter/material.dart';
import '../Models/Speciality.model.dart';
//NOT A REAL PROVIDER

class SpecialityProvider {
  final List<Speciality> specialities = [
    Speciality(id: 1, name: "Généraliste", icon: Icons.medical_services),
    Speciality(id: 2, name: "Nutritioniste", icon: Icons.medication_liquid_sharp),
    Speciality(id: 3, name: "Cardiologue", icon: Icons.favorite),
    Speciality(id: 4, name: "Ophtalmologue", icon: Icons.visibility),
    Speciality(id: 5, name: "Pédiatre", icon: Icons.child_care),
    Speciality(id: 6, name: "Neurologue", icon: Icons.psychology),
    Speciality(id: 7, name: "Dermatologue", icon: Icons.face),
    Speciality(id: 8, name: "Gynécologue", icon: Icons.female),
    Speciality(id: 9, name: "Orthopédiste", icon: Icons.accessibility),
    Speciality(id: 10, name: "Psychiatre", icon: Icons.psychology_alt),
  ];
}
