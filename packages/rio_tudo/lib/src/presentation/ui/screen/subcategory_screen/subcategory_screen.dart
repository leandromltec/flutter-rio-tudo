/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
// ignore: implementation_imports
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../domain/entities/entities.dart';
import '../../widgets/widgets.dart';
import '../base_screen.dart';
import '../screens.dart';

class SubCategoryScreen extends StatefulWidget {
  final SubCategoryPresenter? presenterSubCategory;

  // ignore: use_key_in_widget_constructors
  const SubCategoryScreen({this.presenterSubCategory});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    widget.presenterSubCategory!.init();
    await widget.presenterSubCategory!.loadMaxFavorites();

    List<ItemSubCategoryEntity>? listSubCategory =
        await widget.presenterSubCategory!.getItemsSubCategory(
            idSubCategorySelected: InjectorGetIt.instance
                .get<HomeScreenPresenter>()
                .idSubCategorySelected!
                .value);

    if (listSubCategory != null) {
      widget.presenterSubCategory!.loadDistricts();
    }
  }

  @override
  void dispose() {
    widget.presenterSubCategory!.disposeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ItemSubCategoryEntity> _listItemsTipsFilterDistrict = [];

    SuggestionsBoxController suggestionBoxController =
        SuggestionsBoxController();
    return ValueListenableBuilder(
      valueListenable: widget.presenterSubCategory!.state!,
      builder: (_, __, ___) {
        return GestureDetector(
          key: Key('close_texfield_district'),
          onTap: () {
            suggestionBoxController.close();
          },
          child: BaseScreenWidget(
            indexBottomNavigator: 4,
            state: widget.presenterSubCategory!.state,
            widgetScreen: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(DesignSystemPaddingApp.pd10),
                    child: FieldSearch(
                        suggestionBoxController: suggestionBoxController,
                        presenterSubCategory: widget.presenterSubCategory!)),
                BaseContent(
                  widgetContent: SingleChildScrollView(
                    child: Container(
                      padding:
                          const EdgeInsets.all(DesignSystemPaddingApp.pd16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _containerTextTop(),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _containerTitleCategory(
                                    widgetChild: TitleCategory(
                                  titleCategory: InjectorGetIt.instance
                                      .get<HomeScreenPresenter>()
                                      .titleSubCategorySelected!
                                      .value,
                                )),
                                _containerButton(
                                    widgetChild: ButtonText(
                                  textButton: LabelsApp.textButtonSeeAll,
                                  onPressedFunction: () async {
                                    _listItemsTipsFilterDistrict = [];
                                    await widget.presenterSubCategory!
                                        .getItemsSubCategory(
                                            idSubCategorySelected: InjectorGetIt
                                                .instance
                                                .get<HomeScreenPresenter>()
                                                .idSubCategorySelected!
                                                .value);
                                  },
                                )),
                              ],
                            ),
                            ValueListenableBuilder(
                                valueListenable: widget.presenterSubCategory!
                                    .listDistrictNotifier!,
                                builder: (_, __, ___) {
                                  return ValueListenableBuilder(
                                      valueListenable: widget
                                          .presenterSubCategory!
                                          .listItemDistrictSelectedNotifier!,
                                      builder: (_, __, ___) {
                                        List<ItemSubCategoryEntity>
                                            _listItemsTipsFilterDistrict =
                                            widget
                                                .presenterSubCategory!
                                                .listItemsSubCategoriesNotifier!
                                                .value!;
                                        if (widget
                                            .presenterSubCategory!
                                            .listItemDistrictSelectedNotifier!
                                            .value!
                                            .isNotEmpty) {
                                          _listItemsTipsFilterDistrict = widget
                                              .presenterSubCategory!
                                              .listItemDistrictSelectedNotifier!
                                              .value!;
                                        }

                                        return SingleChildScrollView(
                                          child: _listViewItemsSubCategory(
                                              listItemsSubCategory:
                                                  _listItemsTipsFilterDistrict),
                                        );
                                      });
                                }),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _containerTextTop() {
    return Container(
      margin: const EdgeInsets.only(left: DesignSystemPaddingApp.pd10),
      padding: const EdgeInsets.all(
        DesignSystemPaddingApp.pd10,
      ),
      decoration: BoxDecoration(
          color: DesignSystemPaletterColorApp.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        LabelsApp.textOrderDistric,
        style: const TextStyle(
            fontSize: 12, color: DesignSystemPaletterColorApp.secondaryColor),
      ),
    );
  }

  Widget _containerTitleCategory({required Widget widgetChild}) {
    return Container(
        margin: const EdgeInsets.only(
            left: DesignSystemPaddingApp.pd10,
            top: DesignSystemPaddingApp.pd10),
        child: widgetChild);
  }

  Widget _containerButton({required Widget widgetChild}) {
    return Container(
        margin: const EdgeInsets.only(right: DesignSystemPaddingApp.pd10),
        child: widgetChild);
  }

  Widget _listViewItemsSubCategory(
      {required List<ItemSubCategoryEntity> listItemsSubCategory}) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listItemsSubCategory.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            verticalOffset: 200,
            child: FadeInAnimation(
              child: CardItem(
                isMaxFavorites:
                    widget.presenterSubCategory!.isMaxFavoritesNotifier!.value,
                listFilterSelectedDistrict: listItemsSubCategory,
                presenter: widget.presenterSubCategory,
                indexItemSubCategory: index,
              ),
            ),
          ),
        );
      }),
    );
  }
}
