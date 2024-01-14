import 'dart:ffi';

import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../rio_tudo.dart';
import '../../widgets/widgets.dart';
import '../base_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final FavoritesPresenter presenterFavorites;

  const FavoriteScreen({required this.presenterFavorites});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    widget.presenterFavorites.init();
    await widget.presenterFavorites.getFavoritesText();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.presenterFavorites.state!,
      builder: (_, __, ___) {
        return BaseScreenWidget(
          state: widget.presenterFavorites.state!,
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
                  child: ValueListenableBuilder(
                    valueListenable:
                        widget.presenterFavorites.favoritesNotifier!,
                    builder: (_, __, ___) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.presenterFavorites.favoritesNotifier!
                                  .value!.titleNoFavorites!,
                            ).textFavoriteScreen(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.presenterFavorites.favoritesNotifier!
                                  .value!.descriptionFavorites!,
                            ).textFavoriteScreen(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        color: DesignSystemPaletterColorApp
                                            .secondaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
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
                              widget.presenterFavorites.favoritesNotifier!
                                  .value!.textNumberMaxFavorites!,
                            ).textFavoriteScreen(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
