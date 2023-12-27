import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BaseContent extends StatefulWidget {
  final Widget widgetContent;

  BaseContent({super.key, required this.widgetContent});

  @override
  State<BaseContent> createState() => _BaseContentState();
}

class _BaseContentState extends State<BaseContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: DesignSystemPaddingApp.pd4),
      decoration: const BoxDecoration(
          color: DesignSystemPaletterColorApp.secondaryColorWhite,
          borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      width: MediaQuery.of(context).size.width,
      child: widget.widgetContent,
    ));
  }
}
