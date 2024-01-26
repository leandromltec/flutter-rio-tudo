/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonShare extends StatefulWidget {
  //Function? onTapShare;

  ButtonShare({
    super.key,
    /*required this.onTapShare*/
  });

  @override
  State<ButtonShare> createState() => _ButtonShareState();
}

class _ButtonShareState extends State<ButtonShare> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.ios_share,
          color: Colors.white,
        ));
  }
}
