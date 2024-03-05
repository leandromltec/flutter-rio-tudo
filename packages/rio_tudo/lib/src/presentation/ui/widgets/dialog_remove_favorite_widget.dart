/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:config/config.dart';

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
          key: Key('remove_favorite'),
          onPressed: onPressedRemoveFavorite as Function(),
          child: Text(LabelsApp.btnOk),
        ),
      ],
    ),
  );
}

Future<void> showFavoriteDialogConfirmationIOS(
    {required BuildContext context,
    required String titleTip,
    required Function onPressedRemoveFavorite}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
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
          key: const Key('remove_favorite'),
          onPressed: onPressedRemoveFavorite as Function(),
          child: Text(LabelsApp.btnOk),
        ),
      ],
    ),
  );
    }