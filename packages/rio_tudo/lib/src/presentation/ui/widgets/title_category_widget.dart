/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class TitleCategory extends StatelessWidget {
  final String titleCategory;

  // ignore: use_key_in_widget_constructors
  const TitleCategory({required this.titleCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          DesignSystemPaddingApp.pd10,
          DesignSystemPaddingApp.pd6,
          DesignSystemPaddingApp.pd10,
          DesignSystemPaddingApp.pd6),
      decoration: BoxDecoration(
          color: DesignSystemPaletterColorApp.secondaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(titleCategory).titleCategory(),
    );
  }
}
