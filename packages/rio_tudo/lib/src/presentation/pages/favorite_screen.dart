import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'base_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      indexBottomNavigator: 2,
      widgetScreen: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystemPaddingApp.pd20),
            child: Text(
              LabelsApp.titleSeeUourFavoriteTips,
            ).textTopPage(),
          ),
          BaseContent(
            widgetContent: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(DesignSystemPaddingApp.pd20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LabelsApp.textNoTipAsAavorite,
                    ).textFavoriteScreen(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      LabelsApp.textAsFavorite,
                    ).textFavoriteScreen(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LabelsApp.textTouchThe,
                        ).textFavoriteScreen(),
                        Container(
                            decoration: const BoxDecoration(
                                color:
                                    DesignSystemPaletterColorApp.secondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      LabelsApp.textNumberFavorites,
                    ).textFavoriteScreen(),

                    /*CardItem(),
                            CardItem(),
                            CardItem(),
                            CardItem(),
                            CardItem(),*/
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
