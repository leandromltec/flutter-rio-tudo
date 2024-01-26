import 'package:flutter/material.dart';

import 'text_style_app.dart';

extension TextExtension on Text {
  Text mergeStyle({TextStyle? style, TextStyle? defaultStyle}) {
    return Text(data!,
        key: key,
        overflow: overflow,
        textAlign: textAlign,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        maxLines: maxLines,
        softWrap: softWrap,
        semanticsLabel: semanticsLabel,
        strutStyle: strutStyle,
        locale: locale,
        style: (this.style ?? defaultStyle)!.merge(style ?? defaultStyle));
  }

  Text textTopPage({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.textTopPage);
  }

  Text titleCategory({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.titleCategory);
  }

  Text labelBottomNavigator({TextStyle? style}) {
    return mergeStyle(
        style: style,
        defaultStyle: DesignSystemTextStyleApp.labelBottomNavigator);
  }

  Text nameCategory({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.nameCategory);
  }

  Text textButton({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.textButton);
  }

  Text titleTipCard({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.titleTipCard);
  }

  Text subTitleTipCard({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.subTitleTipCard);
  }

  Text textButtonSeeInstagram({TextStyle? style}) {
    return mergeStyle(
        style: style,
        defaultStyle: DesignSystemTextStyleApp.textButtonSeeInstagram);
  }

  Text textFavoriteScreen({TextStyle? style}) {
    return mergeStyle(
        style: style,
        defaultStyle: DesignSystemTextStyleApp.textFavoriteScreen);
  }

  Text titleInfoScreen({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.titleInfoScreen);
  }

  Text textInfoScreen({TextStyle? style}) {
    return mergeStyle(
        style: style, defaultStyle: DesignSystemTextStyleApp.textInfoScreen);
  }
}
