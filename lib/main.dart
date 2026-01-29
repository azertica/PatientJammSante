import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Medecin/Layouts/MedecinList.screen.dart';
import 'Core/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Medecinlistscreen(),
        backgroundColor: ThemeColor().primaryBgColor,
        //bottomNavigationBar: ,
      ),
    );
  }
}
