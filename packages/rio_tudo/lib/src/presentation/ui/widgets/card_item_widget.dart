/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../domain/entities/entities.dart';

import 'widgets.dart';

// ignore: must_be_immutable
class CardItem extends StatefulWidget {
  bool isFavoritesScreen;
  bool? isMaxFavorites;
  final dynamic presenter;
  final int? indexItemSubCategory;
  final List<ItemSubCategoryEntity>? listFilterSelectedDistrict;

  // ignore: use_key_in_widget_constructors
  CardItem(
      {required this.presenter,
      this.isMaxFavorites,
      required this.indexItemSubCategory,
      this.isFavoritesScreen = false,
      this.listFilterSelectedDistrict});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
          margin: const EdgeInsets.fromLTRB(
              DesignSystemPaddingApp.pd8,
              DesignSystemPaddingApp.pd4,
              DesignSystemPaddingApp.pd8,
              DesignSystemPaddingApp.pd8),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
              color: DesignSystemPaletterColorApp.cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.fromLTRB(
                                DesignSystemPaddingApp.pd10,
                                DesignSystemPaddingApp.pd10,
                                DesignSystemPaddingApp.pd6,
                                DesignSystemPaddingApp.pd6),
                            child: Text(
                              _itemSubcategory().titleTip!,
                            ).titleTipCard(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: DesignSystemPaddingApp.pd10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              ValueListenableBuilder(
                                valueListenable: widget
                                    .presenter!.listItemsSubCategoriesNotifier!,
                                builder: (_, __, ___) {
                                  return ButtonFavorite(
                                      onTapFavorite: () {
                                        if (widget.isFavoritesScreen) {
                                          if (Platform.isIOS) {
                                            showFavoriteDialogConfirmationIOS(
                                              context: context,
                                              titleTip:
                                                  _itemSubcategory().titleTip!,
                                              onPressedRemoveFavorite: () {
                                                _removeFavorite();
                                                Navigator.of(context).pop();
                                              });
                                          }
                                          else{
                                          showFavoriteDialogConfirmation(
                                              context: context,
                                              titleTip:
                                                  _itemSubcategory().titleTip!,
                                              onPressedRemoveFavorite: () {
                                                _removeFavorite();
                                                Navigator.of(context).pop();
                                              });
                                          }
                                        } else {
                                          _validateFavorites();
                                        }
                                      },
                                      isFavorite:
                                          _itemSubcategory().isFavorite!);
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.all(DesignSystemPaddingApp.pd8),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: DesignSystemPaletterColorApp
                              .cardColorSubtitleGray,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Text(
                        _itemSubcategory().district!,
                      ).subTitleTipCard(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    UrlLancher()
                        .openUrl(urlString: _itemSubcategory().urlInstagram!);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(DesignSystemPaddingApp.pd4),
                    decoration: const BoxDecoration(
                        color: DesignSystemPaletterColorApp.cardColorButtonLink,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/icon_instagram.svg',
                          semanticsLabel: LabelsApp.labelInstagram,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          LabelsApp.textButtonSeeInstagram,
                          textAlign: TextAlign.center,
                        ).textButtonSeeInstagram(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  ItemSubCategoryEntity _itemSubcategory() {
    return widget.listFilterSelectedDistrict == null
        ? widget.presenter!.listItemsSubCategoriesNotifier!
            .value![widget.indexItemSubCategory!]
        : widget.listFilterSelectedDistrict![widget.indexItemSubCategory!];
  }

  _removeFavorite() {
    widget.presenter!.removeFavorite(
      _itemSubcategory(),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 2000),
        content: Text(LabelsApp.textRemovedFavorite)));
  }

  _validateFavorites() {
    widget.presenter!.updateFavoriteSubCategory(
      _itemSubcategory(),
    );

    if (widget.presenter.isMaxFavoritesNotifier.value) {
      showMaxFavoritesDialog(context: context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: Text(_itemSubcategory().isFavorite!
              ? LabelsApp.textAddFavorite
              : LabelsApp.textRemovedFavorite)));
    }
  }

  void shareItem({required String textShare}) async {
    await Share.share(textShare);
  }
}
