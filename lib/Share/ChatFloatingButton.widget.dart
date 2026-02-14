import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeColor().secondaryBgColor,
      onPressed: () {print("GO TO MESSAGE PAGE");},
      child: const Icon(Icons.message, color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}