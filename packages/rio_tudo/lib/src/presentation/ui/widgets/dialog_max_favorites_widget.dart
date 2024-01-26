/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';

Future<void> showMaxFavoritesDialog({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(LabelsApp.titleDialogMaxFavorites),
      content: Text(LabelsApp.descriptionDialogMaxFavorites),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LabelsApp.btnClose),
        ),
      ],
    ),
  );
}
