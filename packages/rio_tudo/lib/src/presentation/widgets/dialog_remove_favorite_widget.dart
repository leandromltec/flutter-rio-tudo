import 'package:config/config.dart';
import 'package:flutter/material.dart';

Future<void> showFavoriteDialogConfirmation(
    {required BuildContext context,
    required String titleTip,
    required Function onPressedRemoveFavorite}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(LabelsApp.titleDialogFavorite),
      content: Text(LabelsApp.descriptionDialog +
          titleTip +
          LabelsApp.descriptionDialogFinal),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LabelsApp.btnClose),
        ),
        TextButton(
          onPressed: onPressedRemoveFavorite as Function(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
