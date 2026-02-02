import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';


class medecinCardWidget extends StatelessWidget {
  final String fullname;
  final String specialty;
  final String distance;
  final String fullAddress;
  final String photoUrl;
  final Color? color;


  const medecinCardWidget({
    super.key,
    required this.fullname,
    required this.specialty,
    required this.distance,
    required this.photoUrl,
    required this.fullAddress,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      child: Padding(
        padding: EdgeInsetsGeometry.all(16), //Make after a non constant size
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  // width: , Make after a non constant size
                  child: Image.network("${photoUrl}"),
                ),
                Column(
                  children: [
                    Text("${fullname}", style: TextStyle(color: ThemeColor().primaryColor)),
                    Text("${specialty}", style: TextStyle(color: ThemeColor().thirdColor)),
                    Row(
                      children: [
                        Text("${distance}", style: TextStyle(color: ThemeColor().secondaryColor)),
                        Text("${fullAddress}", style: TextStyle(color: ThemeColor().secondaryColor)),
                      ]
                    )
                  ]
                )
              ]
            ),
            ElevatedButton(
              onPressed: () => print('Redirect to doctor details'), 
              child: Text("Prendre rendez-vous", style: TextStyle(color: ThemeColor().thirdColor))
            )
          ]
        ),
      ),
    );
  }
}