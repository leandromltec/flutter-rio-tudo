import 'package:flutter/material.dart';
import 'colors_app.dart';

class DesignSystemTextStyleApp {
  DesignSystemTextStyleApp._();

  static String defaultFont = 'Roboto';

  static TextStyle textTopPage = const TextStyle(
      color: DesignSystemPaletterColorApp.secondaryColor, fontSize: 16);

  static TextStyle titleCategory = const TextStyle(
      fontSize: 14,
      color: DesignSystemPaletterColorApp.secondaryColorWhite,
      fontWeight: FontWeight.bold);

  static TextStyle labelBottomNavigator = const TextStyle(
      fontSize: 12,
      color: DesignSystemPaletterColorApp.secondaryColorWhite,
      fontWeight: FontWeight.bold);

  static TextStyle nameCategory = const TextStyle(
      fontSize: 14,
      color: DesignSystemPaletterColorApp.secondaryColorWhite,
      fontWeight: FontWeight.bold);

  static TextStyle textButton =
      const TextStyle(color: DesignSystemPaletterColorApp.fontColorButton);

  static TextStyle titleTipCard = const TextStyle(
      fontSize: 16, color: DesignSystemPaletterColorApp.fontPrimaryColor);

  static TextStyle subTitleTipCard = const TextStyle(
      color: DesignSystemPaletterColorApp.fontPrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.bold);

      static TextStyle textButtonSeeInstagram = const TextStyle(
      color: DesignSystemPaletterColorApp.fontPrimaryColor,
      fontSize: 12,
      fontWeight: FontWeight.bold);

  static TextStyle textFavoriteScreen = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: DesignSystemPaletterColorApp.secondaryColor);

  static TextStyle titleInfoScreen = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: DesignSystemPaletterColorApp.secondaryColor);

  static TextStyle textInfoScreen = const TextStyle(
      fontSize: 14, color: DesignSystemPaletterColorApp.primaryColor);

  static TextStyle textHintSubCategoryScreen = const TextStyle(
      fontSize: 16,
      color: DesignSystemPaletterColorApp.fontColorHintText,
      fontWeight: FontWeight.bold);
}
