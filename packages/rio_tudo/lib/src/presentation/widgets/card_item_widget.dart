import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem extends StatefulWidget {
  bool isFavoritesScreen;
  final dynamic presenter;
  final int? indexItemSubCategory;

  CardItem(
      {required this.presenter,
      required this.indexItemSubCategory,
      this.isFavoritesScreen = false});

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
                              widget
                                  .presenter!
                                  .listItemsSubCategoriesNotifier!
                                  .value![widget.indexItemSubCategory!]
                                  .titleTip!,
                            ).titleTipCard(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: DesignSystemPaddingApp.pd10),
                          child: Row(
                            children: [
                              ButtonShare(),
                              const SizedBox(
                                width: 10,
                              ),
                              ValueListenableBuilder(
                                valueListenable: widget
                                    .presenter!.listItemsSubCategoriesNotifier!,
                                builder: (_, __, ___) {
                                  return ButtonFavorite(
                                      onTapFavorite: () {
                                        widget.presenter!
                                            .updateFavoriteSubCategory(
                                          widget
                                                  .presenter!
                                                  .listItemsSubCategoriesNotifier!
                                                  .value![
                                              widget.indexItemSubCategory!],
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration:
                                                    const Duration(
                                                        milliseconds: 2000),
                                                content: Text(widget
                                                        .presenter!
                                                        .listItemsSubCategoriesNotifier!
                                                        .value![widget
                                                            .indexItemSubCategory!]
                                                        .isFavorite!
                                                    ? LabelsApp.textAddFavorite
                                                    : LabelsApp
                                                        .textRemovedFavorite)));
                                      },
                                      isFavorite: widget
                                          .presenter!
                                          .listItemsSubCategoriesNotifier!
                                          .value![widget.indexItemSubCategory!]
                                          .isFavorite!);
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
                        widget.presenter!.listItemsSubCategoriesNotifier!
                            .value![widget.indexItemSubCategory!].district!,
                      ).subTitleTipCard(),
                    )
                  ],
                ),
              ),
              Expanded(
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
              )
            ],
          )),
    );
  }

  void shareItem({required String textShare}) async {
    await Share.share(textShare);
  }
}
