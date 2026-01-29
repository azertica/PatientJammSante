import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/IconBagdeWidget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/SearchBarWidget.dart';


class Medecinlistscreen extends StatelessWidget {
  const Medecinlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SizedBox(
        height: heightScreen,
        child: ListView(
          children: [
            SizedBox(
              height: heightScreen * 0.03,
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthScreen / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconBadgeWidget(icon: Icons.medical_services, bgColor: ThemeColor().secondaryBgColor),
                      Text("Trouver un médecin", style: TextStyle(color: ThemeColor().primaryColor, fontSize: 18, fontWeight: FontWeight.w500))                      
                    ],
                  ),
                ),
                Icon(Icons.notifications, color: ThemeColor().secondaryColor)
              ],
            ),
            SizedBox(
              height: heightScreen * 0.02,
            ),
            Center(
              child: SizedBox(
                width: widthScreen * 0.9,
                child: SearchBarWidget()
              ),
            ),
            SizedBox(
              height: heightScreen * 0.02,
            ),
            Center(
              child: SizedBox(
                width: widthScreen * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Spécialités", style: TextStyle(color: ThemeColor().primaryColor, fontSize: 18, fontWeight: FontWeight.w500)),
                    Text("Tout voir", style: TextStyle(color: ThemeColor().thirdColor, fontSize: 18, fontWeight: FontWeight.w500))//After a text button
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}