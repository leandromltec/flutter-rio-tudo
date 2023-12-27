import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rio_tudo/src/presentation/base_presenter.dart';

import '../widgets/widgets.dart';

class BaseScreenWidget extends StatefulWidget {
  final Widget widgetScreen;
  final int indexBottomNavigator;
  final ValueNotifier<UIState>? state;

  const BaseScreenWidget(
      {super.key,
      this.state,
      required this.widgetScreen,
      required this.indexBottomNavigator});

  @override
  State<BaseScreenWidget> createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {
  /*@override
  void initState() {
    widget.state.addListener(() {

    });

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.state is UILoadingState
          ? null
          : BottomNavigationBarApp(
              indexScreen: widget.indexBottomNavigator,
            ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: DesignSystemPaletterColorApp.secondaryColorWhite),
        surfaceTintColor: Colors.transparent,
        title: Text(
          LabelsApp.titleAppBar,
          style: const TextStyle(
              color: DesignSystemPaletterColorApp.fontPrimaryColor),
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
          child: widget.state is UILoadingState
              ? LoadingWidget()
              : widget.widgetScreen),
    );
  }
}
