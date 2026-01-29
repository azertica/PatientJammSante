import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';

class IconBadgeWidget extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  const IconBadgeWidget({super.key, required this.icon, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Icon(icon, color: ThemeColor().primaryColor),
    );
  }
}