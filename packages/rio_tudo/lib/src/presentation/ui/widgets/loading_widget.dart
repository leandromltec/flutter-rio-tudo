/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: use_key_in_widget_constructors
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignSystemPaletterColorApp.primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFadingCircle(
              color: DesignSystemPaletterColorApp.secondaryColor,
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LabelsApp.textLoading,
              style: DesignSystemTextStyleApp.titleInfoScreen,
            )
          ],
        ),
      ),
    );
  }
}
