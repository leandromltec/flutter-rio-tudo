import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';


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
