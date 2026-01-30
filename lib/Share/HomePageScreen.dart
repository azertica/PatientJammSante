import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Medecin/Layouts/MedecinList.screen.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Share/CustomBottomNavBar.widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;

  void navigateBottomNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> pages = [
    Center(child: Text("HOME PAGE", style: TextStyle(color: ThemeColor().primaryColor))),
    Medecinlistscreen(),
    Center(child: Text("AGENDA", style: TextStyle(color: ThemeColor().primaryColor))),
    Center(child: Text("MESSAGES", style: TextStyle(color: ThemeColor().primaryColor))),
    Center(child: Text("SETTINGS", style: TextStyle(color: ThemeColor().primaryColor))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().primaryBgColor,
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: navigateBottomNavBar,
      ),
    );
  }
}
