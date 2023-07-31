import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class BaseScreenWidget extends StatefulWidget {
  final Widget widgetScreen;
  final int indexBottomNavigator;

  const BaseScreenWidget(
      {super.key,
      required this.widgetScreen,
      required this.indexBottomNavigator});

  @override
  State<BaseScreenWidget> createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarApp(
        indexScreen: widget.indexBottomNavigator,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: DesignSystemPaletterColorApp.secondaryColor),
        surfaceTintColor: Colors.transparent,
        title: Text(
          LabelsApp.titleAppBar,
          style:  const TextStyle(color: DesignSystemPaletterColorApp.fontPrimaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesApp.InfoScreen);
              },
              icon: const Icon(
                Icons.info,
                color: DesignSystemPaletterColorApp.secondaryColorWhite,
                size: 30,
              ))
        ],
        backgroundColor: DesignSystemPaletterColorApp.primaryColor,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: DesignSystemPaletterColorApp.primaryColor,
          child: widget.widgetScreen),
    );
  }
}
