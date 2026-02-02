import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/IconBagde.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/SearchBar.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/Speciality.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/medecinCard.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/medecinList.widget.dart';
import '../Providers/Speciality.provider.dart';
import '../Models/Speciality.model.dart';


class Medecinlistscreen extends StatelessWidget {
  const Medecinlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    List<Speciality> specialities = SpecialityProvider().specialities; 

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
            ),
            SizedBox(
              height: heightScreen * 0.02,
            ),
            //Don't forget to put an onTap on the specialityWidget
            SizedBox(
              height: heightScreen * 0.2,
              child: ListView.builder(
                padding: EdgeInsets.only(left: widthScreen * 0.1),
                scrollDirection: Axis.horizontal,
                itemCount: specialities.length,
                itemBuilder: (context, index){
                  final speciality = specialities[index];
                  return SpecialityWidget(speciality: speciality);
                }
              )
            ),
            SizedBox(
              width: widthScreen,
              child: Row(
                children: [
                  SizedBox(width: widthScreen * 0.08),
                  Text("Médecins recommandés", style: TextStyle(color: ThemeColor().primaryColor, fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            // SizedBox(
            //   height: heightScreen / 2,
            //   child: medecinCardWidget(fullname: "Cheikh Ahmed Tidiane Cisse", specialty: "Blockchain Dev", distance: "2.3km", photoUrl: "https://imgs.search.brave.com/y77qLn-Ol-l63hvglz8GcXNBFwVbp9Z_bERcbe9kArk/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/Y29vbC1waWMtb2Yt/bWVsaW9kYXMtZnIt/djAtZDFlbXptYjA4/aGVhMS5qcGc_d2lk/dGg9NjQwJmNyb3A9/c21hcnQmYXV0bz13/ZWJwJnM9YzMwNzU2/YjBhOTNmMTEzNzI0/NDRmMmJhNmMzYTg1/YmMwOTE5NDBiMA", fullAddress: "Rue 34, Gilbraltar 2"),
            // ),
            SizedBox(
              height: heightScreen,
              child: MedecinListWidget()
            )
          ],
        )
      )
    );
  }
}