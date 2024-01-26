/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ButtonText extends StatelessWidget {
  final String textButton;
  final Function? onPressedFunction;

  const ButtonText(
      {super.key, required this.textButton, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressedFunction as Function(),
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
