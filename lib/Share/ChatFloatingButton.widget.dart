import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeColor().secondaryBgColor,
      onPressed: () { logChatButtonClicked(); },
      child: Icon(Icons.message, color: ThemeColor().FloatingIconColor),
    );
  }
}

void logChatButtonClicked(){
  Sentry.addBreadcrumb(
    Breadcrumb(
      message: 'GO TO MESSAGE PAGE',
      level: SentryLevel.info,
      timestamp: DateTime.now()
    )
  );
}