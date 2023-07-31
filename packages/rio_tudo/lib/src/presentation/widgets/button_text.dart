import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String textButton;

  const ButtonText({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
            decoration: BoxDecoration(
                color: DesignSystemPaletterColorApp.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            width: 80,
            height: 40,
            child: Text(
              textButton,
            ).textButton()));
  }
}
