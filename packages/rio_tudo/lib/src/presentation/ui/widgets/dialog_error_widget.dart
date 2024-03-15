/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';

class ErrorDialog extends StatefulWidget {
  final BuildContext? context;
  final String? messageError;
  final Function onPressedErrorDialog;

  // ignore: use_key_in_widget_constructors
  const ErrorDialog(
      {required this.context,
      required this.messageError,
      required this.onPressedErrorDialog});

  @override
  State<ErrorDialog> createState() => _ErroDialogState();
}

//inserir alert do cupertino

class _ErroDialogState extends State<ErrorDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<void>(
        context: widget.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(LabelsApp.textOps),
            content: SingleChildScrollView(
              child: ListBody(children: [Text(widget.messageError!)]),
            ),
            actions: [
              TextButton(
                  key: Key('text_button_error_dialog'),
                  onPressed: widget.onPressedErrorDialog as Function(),
                  child: Text(LabelsApp.btnClose))
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: DesignSystemPaletterColorApp.secondaryColorWhite,
      ),
    );
  }
}
