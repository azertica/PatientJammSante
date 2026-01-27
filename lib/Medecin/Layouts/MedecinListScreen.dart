import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/IconBagdeWidget.dart';


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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthScreen / 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconBadgeWidget(icon: Icons.medical_services, bgColor: ThemeColor().secondaryBgColor),
                      Text("Trouver un médecin", style: TextStyle(color: ThemeColor().primaryColor, fontSize: 16, fontWeight: FontWeight.w500))                      
                    ],
                  ),
                ),
                Icon(Icons.notifications, color: ThemeColor().secondaryColor)
              ],
            )
          ],
        )
      )
    );
  }
}