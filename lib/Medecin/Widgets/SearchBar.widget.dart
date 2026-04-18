import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/l10n/app_localizations.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SearchBar(
      leading: Icon(Icons.search, color: ThemeColor().secondaryColor),
      hintText: l10n.searchHint,
      hintStyle: WidgetStateProperty.all(
        TextStyle(color: ThemeColor().secondaryColor),
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(color: ThemeColor().primaryColor),
      ),
      backgroundColor: WidgetStateProperty.all(
        ThemeColor().thirdBgColor,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}