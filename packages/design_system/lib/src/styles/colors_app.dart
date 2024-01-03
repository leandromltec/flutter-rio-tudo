import 'package:flutter/material.dart';

class DesignSystemColorApp extends Color {
  const DesignSystemColorApp(int value) : super(value);
}

class DesignSystemPaletterColorApp {
  DesignSystemPaletterColorApp._();

//Main colors
  static const primaryColor = DesignSystemColorApp(0Xff111111);
  static const secondaryColor = DesignSystemColorApp(0Xffff7d00);
  static const secondaryColorWhite = DesignSystemColorApp(0Xffffffff);

  //Menu Colors
  static const shadowItemMenu = DesignSystemColorApp(0Xff6c757d);

  //Font Colors
  static const fontColorDefault = Colors.black;
  static const fontColorSecondary = DesignSystemColorApp(0Xffffffff);
  static const fontColorHintText = DesignSystemColorApp(0Xff6c757d);
  static const fontColorButton = DesignSystemColorApp(0Xfffaa307);
  static const fontPrimaryColor = DesignSystemColorApp(0Xffffffff);

  //Card Colors
  static const cardColor = DesignSystemColorApp(0Xffe85d04);
  static const cardColorSubtitle = DesignSystemColorApp(0Xfff57c00);
  static const cardColorSubtitleGray = DesignSystemColorApp(0Xff303030);
  static const cardColorButtonLink = DesignSystemColorApp(0Xff8c34be);
  static const cardColorNoSubtitle = DesignSystemColorApp(0Xfffb8500);
  static const cardColorButtonLinkNoSubtitle = DesignSystemColorApp(0Xffdb2266);
  static const fontCardColorSubtitle = DesignSystemColorApp(0Xfff8f9fa);
}
