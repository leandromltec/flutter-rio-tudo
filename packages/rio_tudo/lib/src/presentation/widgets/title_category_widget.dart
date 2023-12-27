import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  final String titleCategory;

  const TitleCategory({super.key, required this.titleCategory});

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
