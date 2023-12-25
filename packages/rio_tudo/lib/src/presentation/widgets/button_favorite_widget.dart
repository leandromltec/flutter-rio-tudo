import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonFavorite extends StatefulWidget {
  Function? onTapFavorite;

  ButtonFavorite({super.key, required this.onTapFavorite});

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTapFavorite;
        },
        child: const Icon(
          Icons.favorite_border,
          color: Colors.white,
        ));
  }
}
