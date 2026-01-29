import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search, color: ThemeColor().secondaryColor),
      hintText: "Rechercher un médecin, specialitée...",
      hintStyle: MaterialStateProperty.all(
        TextStyle(color: ThemeColor().secondaryColor),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(color: ThemeColor().primaryColor),
      ),
      backgroundColor: MaterialStateProperty.all(
        ThemeColor().thirdBgColor,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        )
      ),
    );
  }
}