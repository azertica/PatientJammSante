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
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Waiting for connecting the api and db
                // SizedBox(
                //   height: 16,
                //   width: 16,
                //   child: Image.network("${photoUrl}")
                // ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fullname,
                          style: TextStyle(color: ThemeColor().primaryColor, fontSize: 18)),
                      Text(specialty,
                          style: TextStyle(
                              color: ThemeColor().thirdColor)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(distance,
                              style: TextStyle(
                                  color:
                                      ThemeColor().secondaryColor)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              fullAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color:
                                      ThemeColor().secondaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Prendre rendez-vous"),
            ),
          ],
        ),
      ),
    );
  }
}