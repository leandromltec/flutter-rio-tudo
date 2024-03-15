/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class DividerApp extends StatelessWidget {
  const DividerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 4,
      indent: 10,
      endIndent: 10,
      color: DesignSystemPaletterColorApp.secondaryColor,
    );
  }
}
