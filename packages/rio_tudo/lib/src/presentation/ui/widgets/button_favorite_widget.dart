import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonFavorite extends StatefulWidget {
  Function? onTapFavorite;
  bool? isFavorite;

  // ignore: use_key_in_widget_constructors
  ButtonFavorite({
    required this.onTapFavorite,
    this.isFavorite,
  });

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTapFavorite as Function(),
        child: Icon(widget.isFavorite! ? Icons.favorite : Icons.favorite_border,
            color: widget.isFavorite!
                ? DesignSystemPaletterColorApp.cardColorFavoriteButton
                : DesignSystemPaletterColorApp.secondaryColorWhite));
  }
}
