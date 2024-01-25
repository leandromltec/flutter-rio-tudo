import 'package:config/config.dart';
import 'package:flutter/material.dart';

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
