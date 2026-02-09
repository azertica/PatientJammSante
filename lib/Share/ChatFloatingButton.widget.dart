import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthScreen * 0.5,
      height: heightScreen * 0.08,      
      child: FloatingActionButton(
        onPressed: () {print("GO TO MESSAGE PAGE");},
        child: const Icon(Icons.message),
      ),
    );
  }
}