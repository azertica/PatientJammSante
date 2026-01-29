import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Medecin/Layouts/MedecinList.screen.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;

  void navigateBottomNavBar(int index){
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = [
    //Tempory
    Center(child: Text("HOME PAGE", style: TextStyle(color: ThemeColor().primaryColor))),
    Medecinlistscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        backgroundColor: ThemeColor().primaryBgColor,
        bottomNavigationBar: BottomNavigationBar(
          onTap: navigateBottomNavBar,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Accueil"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Medecins"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "RDV"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Parametres")
          ]
        ),
      );
  }
}