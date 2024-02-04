/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';

import '../../base_presenter.dart';
import '../widgets/widgets.dart';

class BaseScreenWidget extends StatefulWidget {
  final Widget widgetScreen;
  final int indexBottomNavigator;
  final ValueNotifier<UIState>? state;
  final bool isAutomaticallyImplyLeading;

  const BaseScreenWidget(
      {super.key,
      this.state,
      required this.widgetScreen,
      required this.indexBottomNavigator,
      this.isAutomaticallyImplyLeading = true});

  @override
  State<BaseScreenWidget> createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.state!.value is UILoadingState
          ? null
          : BottomNavigationBarApp(
              indexScreen: widget.indexBottomNavigator,
            ),
      appBar: widget.state!.value is UILoadingState
          ? null
          : AppBar(
              automaticallyImplyLeading: widget.isAutomaticallyImplyLeading,
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
                    key: Key('redirect_info_screen'),
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
      body: widget.state!.value is UIErrorState
          ? ErrorDialog(
              context: context,
              messageError: widget.state!.value.descriptionState,
              onPressedErrorDialog: () {
                if (widget.state!.value.typeUsecaseState ==
                    TypeUsecase.favorites) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesApp.HomeScreen, ModalRoute.withName('/'));
                } else {
                  Navigator.pushNamedAndRemoveUntil(context,
                      RoutesApp.FavoriteScreen, ModalRoute.withName('/'));
                }
              },
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              color: DesignSystemPaletterColorApp.primaryColor,
              child: widget.state!.value is UILoadingState
                  ? LoadingWidget()
                  : widget.widgetScreen),
    );
  }
}
